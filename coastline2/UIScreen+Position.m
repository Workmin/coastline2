//
//  UIScreen+Position.m
//  coastline2
//
//  Created by wangyuanou on 14-2-2.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIScreen+Position.h"

@implementation UIScreen (Position)

+(float) width {
    return [UIScreen mainScreen].bounds.size.width;
}

+(float) height {
    return [UIScreen mainScreen].bounds.size.height;
}

@end
