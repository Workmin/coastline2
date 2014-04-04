//
//  NSFileManager+Finder.m
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSFileManager+Finder.h"

@implementation NSFileManager (Finder)

-(NSString*) fileForName:(NSString*)name inPath:(NSString*)path {
    NSString* extension = [name pathExtension];
    if ([extension length] > 0) {
        NSString* fullPath = [NSString stringWithFormat:@"%@/%@", path, name];
        if ([self fileExistsAtPath:fullPath]) {
            return fullPath;
        } else {
            return nil;
        }
    } else {
        NSString* fullPath = [NSString stringWithFormat:@"%@/%@@2x.png", path, name];
        if ([self fileExistsAtPath:fullPath]) {
            return fullPath;
        }
        
        fullPath = [NSString stringWithFormat:@"%@/%@.png", path, name];
        if ([self fileExistsAtPath:fullPath]) {
            return fullPath;
        }
        
        fullPath = [NSString stringWithFormat:@"%@/%@@2x.jpg", path, name];
        if ([self fileExistsAtPath:fullPath]) {
            return fullPath;
        }
        
        fullPath = [NSString stringWithFormat:@"%@/%@.jpg", path, name];
        if ([self fileExistsAtPath:fullPath]) {
            return fullPath;
        }
        
        return nil;
    }
}

@end
