//
//  CLScrollView.h
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLScrollView : UIScrollView

@property(nonatomic) int page;

-(int) pageCount;

-(void) moveForTextField:(UITextField*)textField;

-(void) moveToEnd:(BOOL)animation;

@end
