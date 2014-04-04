//
//  NSNull+Safe.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSNull+Safe.h"

@implementation NSNull (Safe)

-(unsigned int) length {
	return 0;
}

-(unsigned int) count {
	return 0;
}

-(int) intValue {
	return 0;
}

-(float) floatValue {
	return 0;
}

-(id) valueForKey:(NSString *)key {
    return nil;
}

- (id)objectAtIndex:(NSUInteger)index {
    return nil;
}

- (id)objectForKey:(id)aKey {
    return nil;
}

@end
