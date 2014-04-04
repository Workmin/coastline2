//
//  UIImage+Resource.h
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resource)

+(UIImage*) imageWithBundle:(NSString*)bundle file:(NSString*)name;
+(UIImage*) imageWithFile:(NSString*)name;

@end
