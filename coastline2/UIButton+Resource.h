//
//  UIButton+Resource.h
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Resource)

/*
 images list
    0 - normal
    0 - normal 1 - selected/highlight
    0 - normal 1 - selected/highlight 2 - disabled
    0 - normal 1 - selected 2 -disabled 3 - highlight
 */
+(UIButton*) buttonOfResource:(NSArray*)images;

@end
