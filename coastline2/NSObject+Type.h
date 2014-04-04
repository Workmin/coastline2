//
//  NSObject+Type.h
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Type)

-(BOOL) isInt;
-(BOOL) isFloat;
-(BOOL) isString;
-(BOOL) isArray;
-(BOOL) isDictionary;

@end
