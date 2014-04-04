//
//  CLSortedDirectionary.h
//  coastline2
//
//  Created by wangyuanou on 14-2-7.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLSortedDirectionary : NSObject

-(CLSortedDirectionary*) init;

-(void) setValue:(id)anObject forKey:(int)key;
-(void) removeValueOfKey:(int)key;
-(id) valueOfKey:(int)key;
-(int) previousKeyOfKey:(int)key;
-(int) nextKeyOfKey:(int)key;

-(NSString*) description;

@end
