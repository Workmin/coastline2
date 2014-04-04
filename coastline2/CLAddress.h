//
//  CLAddress.h
//  coastline
//
//  Created by WangYuanOu on 13-7-19.
//  Copyright (c) 2013年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^AddressResponse)(NSString* locality, NSString* subLocality, double latitude, double longitude);

@interface CLAddress : NSObject<CLLocationManagerDelegate>

+(CLAddress*) shareInstance;

-(id) init;

-(BOOL) queryByCurrentLocationWithComplection:(AddressResponse)addressResponse;
-(void) queryByAddress:(NSString*)address withComplection:(AddressResponse)addressResponse;

@end
