//
//  NSTimer+Block.m
//  coastline
//
//  Created by wangyuanou on 14-2-7.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSTimer+Block.h"

@implementation NSTimer (Block)

+(NSTimer*) scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval
									 block:(TimerAction)block
									repeat:(BOOL)repeat {
	NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
													  target:self
													selector:@selector(timerSelector:)
													userInfo:block
													 repeats:repeat];
	
	return timer;
}

+(void) timerSelector:(NSTimer*)timer {
	if (timer.userInfo) {
		TimerAction block = timer.userInfo;
		block();
	}
}

@end
