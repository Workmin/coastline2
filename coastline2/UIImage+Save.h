//
//  UIImage+Save.h
//  coastline
//
//  Created by WangYuanOu on 13-10-29.
//  Copyright (c) 2013年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Save)

-(void) save;

-(NSData*) pngData;
-(NSData*) jpgDataOfQuality:(float)quality;

@end
