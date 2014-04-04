//
//  NSObject+Block.h
//  coastline2
//
//  Created by wangyuanou on 14-2-7.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Block)

+(void)perform:(void(^)())block1 completion:(void (^)())block2;

@end
