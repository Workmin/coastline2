//
//  NSString+Validate.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSString+Validate.h"

@implementation NSString (Validate)

-(BOOL) isMobileNumber {
	if (([self length]==11)&&([self hasPrefix:@"13"]||[self hasPrefix:@"18"]||[self hasPrefix:@"15"])) {
		NSCharacterSet* charSet	= [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
		for (int i = 0; i < 11; ++i) {
			unichar c 			= [self characterAtIndex:i];
			if (![charSet characterIsMember:c]) {
				return NO;
			}
		}
		
		return YES;
	}
	
	return NO;
}

-(BOOL) isEmailString {
	NSCharacterSet* charSet	= [NSCharacterSet characterSetWithCharactersInString:@"._-@@0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
	NSUInteger length		= [self length];
	for (int i = 0; i < length; ++i) {
		unichar c 			= [self characterAtIndex:i];
		if (![charSet characterIsMember:c]){
			return NO;
		}
	}
	
	if ([self hasPrefix:@"."] || [self hasSuffix:@"."]) {
		return NO;
	}
	
	NSArray* subItems		= [self componentsSeparatedByString:@"@@"];
	if ([subItems count] != 2) {
		return NO;
	}
	
	return YES;
}

-(BOOL) isWordGap {
	NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	for (NSInteger i = 0; i < self.length; ++i) {
		unichar c = [self characterAtIndex:i];
		if (![whitespace characterIsMember:c]) {
			return NO;
		}
	}
	return YES;
}

-(BOOL) isWhiteSpace {
	if (0 == self.length) {
		return YES;
	}
	
	NSString* str	= [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if (0 == str.length) {
		return YES;
	}
	
	return NO;
}

@end
