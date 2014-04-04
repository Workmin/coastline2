//
//  UIImage+Thumb.h
//  coastline
//
//  Created by WangYuanOu on 13-9-29.
//  Copyright (c) 2013年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Thumb)

-(UIImage*) thumbWithSize:(CGSize)size;

-(UIImage*) imageWithClip:(CGRect)rect;

@end
