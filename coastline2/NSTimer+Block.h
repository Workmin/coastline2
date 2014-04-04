//
//  NSTimer+Block.h
//  coastline
//
//  Created by wangyuanou on 14-2-7.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Block)

typedef void(^TimerAction)();

+(NSTimer*) scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
									 block:(TimerAction)block
									repeat:(BOOL)repeat;


@end
