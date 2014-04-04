//
//  NSFileManager+Finder.h
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Finder)

-(NSString*) fileForName:(NSString*)name inPath:(NSString*)path;

@end
