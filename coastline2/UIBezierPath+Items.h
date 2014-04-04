//
//  UIBezierPath+Items.h
//  coastline2
//
//  Created by wangyuanou on 14-1-21.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (Items)

+(UIBezierPath*) shadowPanelWithRect:(CGRect)rect color:(UIColor*)color;
+(UIBezierPath*) shadowRoundPanelWithRect:(CGRect)rect color:(UIColor*)color;
+(UIBezierPath*) deleteSymbolAt:(CGPoint)point scale:(float)scale;
+(UIBezierPath*) lineSymbolAt:(CGPoint)point width:(float)width;
+(UIBezierPath*) lineSymbolAt:(CGPoint)point height:(float)height;
+(UIBezierPath*) backSymbolAt:(CGPoint)point scale:(float)scale;

@end
