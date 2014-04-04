//
//  UIButton+Resource.m
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIButton+Resource.h"
#import "UIImage+Resource.h"

@implementation UIButton (Resource)

+(UIButton*) buttonOfResource:(NSArray*)images {
    if ([images count] == 0) {
        return nil;
    }
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    unsigned long imageCount = [images count];
    
    if (imageCount == 1) {
        UIImage* normalImage = [UIImage imageWithBundle:nil file:images[0]];
        if (normalImage) {
            button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
            [button setImage:normalImage forState:UIControlStateNormal];
        }
    } else if (imageCount == 2) {
        UIImage* normalImage = [UIImage imageWithBundle:nil file:images[0]];
        if (normalImage) {
            button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
            [button setImage:normalImage forState:UIControlStateNormal];
        }
        
        UIImage* seletedImage = [UIImage imageWithBundle:nil file:images[1]];
        if (seletedImage) {
            [button setImage:seletedImage forState:UIControlStateSelected];
            [button setImage:seletedImage forState:UIControlStateHighlighted];
        }
    } else if (imageCount == 3) {
        UIImage* normalImage = [UIImage imageWithBundle:nil file:images[0]];
        if (normalImage) {
            button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
            [button setImage:normalImage forState:UIControlStateNormal];
        }
        
        UIImage* seletedImage = [UIImage imageWithBundle:nil file:images[1]];
        if (seletedImage) {
            [button setImage:seletedImage forState:UIControlStateSelected];
            [button setImage:seletedImage forState:UIControlStateHighlighted];
        }
        
        UIImage* disableImage = [UIImage imageWithBundle:nil file:images[2]];
        if (disableImage) {
            [button setImage:disableImage forState:UIControlStateDisabled];
        }
    } else {
        UIImage* normalImage = [UIImage imageWithBundle:nil file:images[0]];
        if (normalImage) {
            button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
            [button setImage:normalImage forState:UIControlStateNormal];
        }
        
        UIImage* seletedImage = [UIImage imageWithBundle:nil file:images[1]];
        if (seletedImage) {
            [button setImage:seletedImage forState:UIControlStateSelected];
        }
        
        UIImage* disableImage = [UIImage imageWithBundle:nil file:images[2]];
        if (disableImage) {
            [button setImage:disableImage forState:UIControlStateDisabled];
        }
        
        UIImage* highlightImage = [UIImage imageWithBundle:nil file:images[3]];
        if (highlightImage) {
            [button setImage:highlightImage forState:UIControlStateHighlighted];
        }
    }
    
    return button;
}

@end
