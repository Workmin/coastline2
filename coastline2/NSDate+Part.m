//
//  NSDate+Part.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSDate+Part.h"

@implementation NSDate (Part)

-(NSString*) year {
	NSDateFormatter* formatter		= [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
	NSString* resultString			= [formatter stringFromDate:self];
	return resultString;
}

-(NSString*) month {
	NSDateFormatter* formatter		= [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"MM"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
	NSString* resultString			= [formatter stringFromDate:self];
	return resultString;
}

-(NSString*) day {
	NSDateFormatter* formatter		= [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"dd"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
	NSString* resultString			= [formatter stringFromDate:self];
	return resultString;
}

-(NSString*) hour {
	NSDateFormatter* formatter		= [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"HH"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
	NSString* resultString			= [formatter stringFromDate:self];
	return resultString;
}

-(NSString*) min {
	NSDateFormatter* formatter		= [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"mm"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
	NSString* resultString			= [formatter stringFromDate:self];
	return resultString;
}

-(NSString*) sec {
	NSDateFormatter* formatter		= [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"ss"];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
	NSString* resultString			= [formatter stringFromDate:self];
	return resultString;
}

@end
