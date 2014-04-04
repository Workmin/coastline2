//
//  UIControl+Block.h
//  coastline2
//
//  Created by wangyuanou on 14-2-7.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Block)

- (void)event:(UIControlEvents)event withBlock:(void(^)(id sender))block;
- (void)removeEvent:(UIControlEvents)event;

@end
