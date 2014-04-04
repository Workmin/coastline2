//
//  UIView+Screen.h
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screen)

@property(nonatomic) float left;
@property(nonatomic) float right;
@property(nonatomic) float top;
@property(nonatomic) float bottom;
@property(nonatomic) float width;
@property(nonatomic) float height;
@property(nonatomic) float middleH;
@property(nonatomic) float middleV;

-(void) inset:(UIEdgeInsets)inset ofView:(UIView*)view;

@end




CGRect RectSetLeft(CGRect* rect, float x);
CGRect RectSetTop(CGRect* rect, float y);
CGRect RectSetWidth(CGRect* rect, float width);
CGRect RectSetHeight(CGRect* rect, float height);
CGRect RectSetRight(CGRect* rect, float x);
CGRect RectSetBottom(CGRect* rect, float y);
CGRect RectSetMiddleH(CGRect* rect, float x);
CGRect RectSetMiddleV(CGRect* rect, float y);

float RectGetLeft(CGRect rect);
float RectGetRight(CGRect rect);
float RectGetBottom(CGRect rect);
float RectGetTop(CGRect rect);
float RectGetWidth(CGRect rect);
float RectGetHeight(CGRect rect);
float RectGetMiddleH(CGRect rect);
float RectGetMideleV(CGRect rect);


