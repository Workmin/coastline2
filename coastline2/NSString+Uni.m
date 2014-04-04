//
//  NSString+Uni.m
//  coastline2
//
//  Created by wangyuanou on 14-3-31.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSString+Uni.h"
#import "NSString+Convert.h"
#import <AdSupport/AdSupport.h>

@implementation NSString (Uni)

+(NSString*) UniString {
    NSDateFormatter* formatter		= [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
	[formatter setTimeZone:[NSTimeZone localTimeZone]];
	NSString* resultString			= [formatter stringFromDate:[NSDate date]];
    NSString* uuid = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    return [NSString stringWithFormat:@"%@-%@", uuid, resultString];
}

@end
