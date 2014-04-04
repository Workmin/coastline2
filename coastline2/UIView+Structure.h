//
//  UIView+Structure.h
//  coastline2
//
//  Created by wangyuanou on 14-2-14.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Structure)

-(void) addSubviews:(NSArray*)subviews;
-(void) removeAllSubviews;
-(UIView*) findFirstResponder;

-(void) logUp;
-(void) logDown;
-(void) logThisWithFix:(NSString*)fix;

-(UIView*) lastViewWithTag:(int)tag;

@end
