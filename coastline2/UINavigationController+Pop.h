//
//  UINavigationController+Pop.h
//  coastline2
//
//  Created by 王渊鸥 on 14-4-17.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Pop)

-(void) popToPrevLayer:(unsigned int)upLayer animation:(BOOL)animation;
-(BOOL) popToPrevLayer:(unsigned int)upLayer withCheck:(Class)classType animation:(BOOL)animation;

@end
