//
//  UINavigationController+Pop.m
//  coastline2
//
//  Created by 王渊鸥 on 14-4-17.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UINavigationController+Pop.h"
#import "NSArray+Logical.h"

@implementation UINavigationController (Pop)

-(void) popToPrevLayer:(unsigned int)upLayer animation:(BOOL)animation {
    NSArray* controllerLayers = self.viewControllers;
    UIViewController* controller = [controllerLayers objectAtReservedIndex:upLayer];
    if (controller) {
        [self popToViewController:controller animated:animation];
    }
}

-(BOOL) popToPrevLayer:(unsigned int)upLayer withCheck:(Class)classType animation:(BOOL)animation {
    NSArray* controllerLayers = self.viewControllers;
    UIViewController* controller = [controllerLayers objectAtReservedIndex:upLayer+1];
    if ([controller isKindOfClass:classType]) {
        [self popToViewController:controller animated:animation];
        return YES;
    } else {
        return NO;
    }
}

@end
