//
//  UIBezierPath+Items.m
//  coastline2
//
//  Created by wangyuanou on 14-1-21.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIBezierPath+Items.h"
#import "CLContext.h"

#define SHADOW_PANEL_CORNER_RADIUS 4
#define SHADOW_PANEL_OFFSET 2

@implementation UIBezierPath (Items)

+(UIBezierPath*) shadowPanelWithRect:(CGRect)rect color:(UIColor*)color {
    CGRect drawRect = CGRectMake(rect.origin.x, rect.origin.y,
                                 rect.size.width-2*SHADOW_PANEL_OFFSET,
                                 rect.size.height-2*SHADOW_PANEL_OFFSET);
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:drawRect];
    [[CLContext current] setShadowOffset:CGSizeMake(SHADOW_PANEL_OFFSET, SHADOW_PANEL_OFFSET)
                                    blur:SHADOW_PANEL_OFFSET
                                   color:[UIColor darkGrayColor]];
    [color setFill];
    return path;
}

+(UIBezierPath*) shadowRoundPanelWithRect:(CGRect)rect color:(UIColor*)color {
    CGRect drawRect = CGRectMake(rect.origin.x, rect.origin.y,
                                 rect.size.width-2*SHADOW_PANEL_OFFSET,
                                 rect.size.height-2*SHADOW_PANEL_OFFSET);
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:drawRect
                                                    cornerRadius:SHADOW_PANEL_CORNER_RADIUS];
    [[CLContext current] setShadowOffset:CGSizeMake(SHADOW_PANEL_OFFSET, SHADOW_PANEL_OFFSET)
                                    blur:SHADOW_PANEL_OFFSET
                                   color:[UIColor darkGrayColor]];
    [color setFill];
    return path;
}

+(UIBezierPath*) deleteSymbolAt:(CGPoint)point scale:(float)scale {
	CGRect rect = {point.x, point.y, 16*scale, 16*scale};
	UIBezierPath* symbol = [UIBezierPath bezierPathWithOvalInRect:rect];
	[symbol moveToPoint:CGPointMake(point.x+4*scale, point.y+4*scale)];
	[symbol addLineToPoint:CGPointMake(point.x+12*scale, point.y+12*scale)];
	[symbol moveToPoint:CGPointMake(point.x+4*scale, point.y+12*scale)];
	[symbol addLineToPoint:CGPointMake(point.x+12*scale, point.y+4*scale)];
	
	return symbol;
}

+(UIBezierPath*) lineSymbolAt:(CGPoint)point width:(float)width {
	UIBezierPath* symbol = [UIBezierPath bezierPath];
	[symbol moveToPoint:point];
	[symbol addLineToPoint:CGPointMake(point.x+width, point.y)];
	
	return symbol;
}

+(UIBezierPath*) lineSymbolAt:(CGPoint)point height:(float)height {
	UIBezierPath* symbol = [UIBezierPath bezierPath];
	[symbol moveToPoint:point];
	[symbol addLineToPoint:CGPointMake(point.x, point.y+height)];
	
	return symbol;
}

+(UIBezierPath*) backSymbolAt:(CGPoint)point scale:(float)scale {
	UIBezierPath* symbol = [UIBezierPath bezierPath];
	[symbol moveToPoint:CGPointMake(point.x+4*scale, point.y)];
	[symbol addLineToPoint:CGPointMake(point.x, point.y+4*scale)];
	[symbol addLineToPoint:CGPointMake(point.x+4*scale, point.y+8*scale)];
	[symbol moveToPoint:CGPointMake(point.x, point.y+4*scale)];
	[symbol addLineToPoint:CGPointMake(point.x+10*scale, point.y+4*scale)];
	
	return symbol;
}

@end
