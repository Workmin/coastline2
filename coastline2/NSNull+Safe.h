//
//  NSNull+Safe.h
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Safe)

-(unsigned int) length;
-(unsigned int) count;

-(int) intValue;
-(float) floatValue;

- (id)valueForKey:(NSString *)key;
- (id)objectAtIndex:(NSUInteger)index;
- (id)objectForKey:(id)aKey;

@end
