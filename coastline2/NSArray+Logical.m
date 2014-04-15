//
//  NSArray+Logical.m
//  coastline2
//
//  Created by 王渊鸥 on 14-4-12.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSArray+Logical.h"

@implementation NSArray (Logical)

-(BOOL) include:(id)object {
    for (id item in self) {
        if ([item isEqual:object]) {
            return YES;
        }
    }
    return NO;
}

@end
