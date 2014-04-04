//
//  UIImage+Resource.m
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIImage+Resource.h"
#import "NSFileManager+Finder.h"

@implementation UIImage (Resource)

+(UIImage*) imageWithBundle:(NSString*)bundle file:(NSString*)name {
    NSBundle* bundleInstance = nil;
    if (bundle) {
        bundleInstance = [NSBundle bundleWithPath:bundle];
    } else {
        bundleInstance = [NSBundle mainBundle];
    }
    
    NSString* filePath = [bundleInstance bundlePath];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString* fullPath = [fileManager fileForName:name inPath:filePath];
    if (fullPath) {
        return [UIImage imageWithContentsOfFile:fullPath];
    }
    
    return nil;
}

+(UIImage*) imageWithFile:(NSString*)name {
    return [UIImage imageWithBundle:nil file:name];
}

@end
