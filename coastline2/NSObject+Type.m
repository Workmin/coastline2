//
//  NSObject+Type.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSObject+Type.h"

@implementation NSObject (Type)

-(BOOL) isInt {
    if ([self isKindOfClass:[NSNumber class]]) {
        return YES;
    } else if ([self isKindOfClass:[NSString class]]) {
        //
    }
    
    return NO;
}

-(BOOL) isFloat {
	return ([self isKindOfClass:[NSString class]]||[self isKindOfClass:[NSNumber class]]);
}

-(BOOL) isString {
	return [self isKindOfClass:[NSString class]];
}

-(BOOL) isArray {
	return [self isKindOfClass:[NSArray class]];
}

-(BOOL) isDictionary {
	return [self isKindOfClass:[NSDictionary class]];
}

@end
