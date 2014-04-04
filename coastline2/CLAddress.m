//
//  CLAddress.m
//  coastline
//
//  Created by WangYuanOu on 13-7-19.
//  Copyright (c) 2013年 mixbus. All rights reserved.
//

#import "CLAddress.h"
#import "Define.h"

@implementation CLAddress {
	CLLocationManager*			_locationManger;
	CLLocation*					_location;
	CLGeocoder*					_geoCoder;
}

+(CLAddress*) shareInstance {
    SINGLETON_INSTANCE;
}

-(id) init {
	self						= [super init];
	if (self) {
		_locationManger			= [[CLLocationManager alloc] init];
		_locationManger.delegate= self;
		[_locationManger startUpdatingLocation];
		_geoCoder				= [[CLGeocoder alloc] init];
		_location				= nil;
	}
	
	return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
	[_locationManger stopUpdatingLocation];
	_location					= locations[0];
}

-(BOOL) queryByCurrentLocationWithComplection:(AddressResponse)addressResponse {
	if (!_location) {
		return NO;
	}
	
	[_geoCoder reverseGeocodeLocation:_location
					completionHandler:^(NSArray *placemarks, NSError *error) {
						CLPlacemark* placemark	= placemarks[0];
						addressResponse(placemark.locality, placemark.subLocality,
										placemark.location.coordinate.latitude,
										placemark.location.coordinate.longitude);
					}];
	
	return YES;
}

-(void) queryByAddress:(NSString*)address withComplection:(AddressResponse)addressResponse {
	[_geoCoder geocodeAddressString:address
				  completionHandler:^(NSArray *placemarks, NSError *error) {
					  CLPlacemark* placemark	= placemarks[0];
					  addressResponse(placemark.locality, placemark.subLocality,
									  placemark.location.coordinate.latitude,
									  placemark.location.coordinate.longitude);
				  }];
}

@end
