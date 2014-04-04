//
//  UIImageView+Resource.m
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIImageView+Resource.h"
#import "UIImage+Resource.h"

@implementation UIImageView (Resource)

+(UIImageView*) imageViewOfResource:(NSString*)image {
    UIImageView* imageView = [[UIImageView alloc] init];
    
    UIImage* imageInstance = [UIImage imageWithBundle:nil file:image];
    if (imageInstance) {
        imageView.frame = CGRectMake(0, 0, imageInstance.size.width, imageInstance.size.height);
        imageView.image = imageInstance;
    }
    
    return imageView;
}

@end
