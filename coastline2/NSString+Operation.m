//
//  NSString+Operation.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSString+Operation.h"

@implementation NSString (Operation)

-(NSString*) trimString {
	NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	return [self stringByTrimmingCharactersInSet:whitespace];
}

-(NSArray*) divideStringByFirstString:(NSString*)gap {
	NSRange findRange = [self rangeOfString:gap];
	if (findRange.length == 0) {
		return @[gap];
	}
	
	NSString* firstString = [self substringToIndex:findRange.location];
	NSString* lastString = [self substringFromIndex:findRange.location+findRange.length];
	return @[firstString, lastString];
}

-(NSArray*) divideStringByLastString:(NSString*)gap {
	NSRange findRange = [self rangeOfString:gap options:NSBackwardsSearch];
	if (findRange.length == 0) {
		return @[gap];
	}
	
	NSString* firstString = [self substringToIndex:findRange.location];
	NSString* lastString = [self substringFromIndex:findRange.location+findRange.length];
	return @[firstString, lastString];
}

@end
