//
//  UIView+Position.h
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Position)

-(CGPoint) positionOfAncestor:(UIView*)view;

-(CGPoint) positionOfParent;


-(float) sightYInScrollView:(UIScrollView*)container;
-(void) scrollToSightY:(float)y inScrollView:(UIScrollView*)container;

-(float) YInView:(UIView*)superView;

@end


