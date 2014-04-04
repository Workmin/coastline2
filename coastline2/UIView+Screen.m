//
//  UIView+Screen.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIView+Screen.h"

@implementation UIView (Screen)

-(float) left {
    return self.frame.origin.x;
}

-(void) setLeft:(float)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

-(float) right {
    return self.frame.origin.x+self.frame.size.width;
}

-(void) setRight:(float)right {
    CGRect frame = self.frame;
    frame.origin.x = right-frame.size.width;
    self.frame = frame;
}

-(float) top {
    return self.frame.origin.y;
}

-(void) setTop:(float)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

-(float) bottom {
    return self.frame.origin.y+self.frame.size.height;
}

-(void) setBottom:(float)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom-frame.size.height;
    self.frame = frame;
}

-(float) width {
    return self.frame.size.width;
}

-(void) setWidth:(float)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(float) height {
    return self.frame.size.height;
}

-(void) setHeight:(float)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(float) middleH {
    return self.frame.origin.x+self.frame.size.width/2;
}

-(void) setMiddleH:(float)middleH {
    CGRect frame = self.frame;
    frame.origin.x = middleH-self.frame.size.width/2;
    self.frame = frame;
}

-(float) middleV {
    return self.frame.origin.y+self.frame.size.height/2;
}

-(void) setMiddleV:(float)middleV {
    CGRect frame = self.frame;
    frame.origin.y = middleV-self.frame.size.height/2;
    self.frame = frame;
}

-(void) inset:(UIEdgeInsets)inset ofView:(UIView*)view {
	self.frame = UIEdgeInsetsInsetRect(view.frame, inset);
}

@end



CGRect RectSetLeft(CGRect* rect, float x) {
    rect->origin.x = x;
    return *rect;
}

CGRect RectSetTop(CGRect* rect, float y) {
    rect->origin.y = y;
    return *rect;
}

CGRect RectSetWidth(CGRect* rect, float width) {
    rect->size.width = width;
    return *rect;
}

CGRect RectSetHeight(CGRect* rect, float height) {
    rect->size.height = height;
    return *rect;
}

CGRect RectSetRight(CGRect* rect, float x) {
    rect->origin.x = x-rect->size.width;
    return *rect;
}

CGRect RectSetBottom(CGRect* rect, float y) {
    rect->origin.y = y-rect->size.height;
    return *rect;
}

CGRect RectSetMiddleH(CGRect* rect, float x) {
    rect->origin.x = x-rect->size.width/2;
    return *rect;
}

CGRect RectSetMiddleV(CGRect* rect, float y) {
    rect->origin.y = y-rect->size.height/2;
    return *rect;
}

float RectGetLeft(CGRect rect) {
    return rect.origin.x;
}

float RectGetRight(CGRect rect) {
    return rect.origin.x+rect.size.width;
}

float RectGetBottom(CGRect rect) {
    return rect.origin.y+rect.size.height;
}

float RectGetTop(CGRect rect) {
    return rect.origin.y;
}

float RectGetWidth(CGRect rect) {
    return rect.size.width;
}

float RectGetHeight(CGRect rect) {
    return rect.size.height;
}

float RectGetMiddleH(CGRect rect) {
    return rect.origin.x+rect.size.width/2;
}

float RectGetMideleV(CGRect rect) {
    return rect.origin.y+rect.size.height/2;
}

