//
//  NSString+Paint.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSString+Paint.h"
#import "CLText.h"

@implementation NSString (Paint)

-(CGSize) sizeForFont:(UIFont*)font width:(float)width {
    CLText* text = [[CLText alloc] init];
    text.text = self;
    text.font = font;
    text.frame = CGRectMake(0, 0, width, 10000);
    
    float textHeight = [text textHeight];
    return CGSizeMake(width, textHeight);
}

@end
