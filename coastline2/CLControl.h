//
//  CLControl.h
//  coastline2
//
//  Created by wangyuanou on 14-1-20.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLView.h"

@interface CLControl : UIControl

@property(nonatomic, strong) DrawBlock normalDraw;
@property(nonatomic, strong) DrawBlock selectedDraw;
@property(nonatomic, strong) DrawBlock disabledDraw;

@end
