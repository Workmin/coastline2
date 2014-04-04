//
//  CLTimer.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLTimer.h"

@implementation CLTimer {
    NSTimer* _timer;
    NSDate* _startTime;
    NSTimeInterval _totalTime;
    id _target;
    SEL _aSelector;
}

-(CLTimer*) initWithTimeInterval:(NSTimeInterval)seconds
						  target:(id)target
						selector:(SEL)aSelector {
    self = [super init];
    if (self) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:seconds
                                                  target:target
                                                selector:aSelector
                                                userInfo:nil
                                                 repeats:NO];
        _totalTime = seconds;
        _startTime = [NSDate date];
        _target = target;
        _aSelector = aSelector;
    }
    return self;
}

+(CLTimer*) timerWithTimeInterval:(NSTimeInterval)seconds
                           target:(id)target
                         selector:(SEL)aSelector {
    return [[CLTimer alloc] initWithTimeInterval:seconds target:target selector:aSelector];
}

-(void) stop {
    NSDate* currentTime = [NSDate date];
    NSTimeInterval distance = [currentTime timeIntervalSinceDate:_startTime];
    _totalTime -= distance;
    [_timer invalidate];
    _timer = nil;
}

-(void) resume {
    if ((_totalTime > 0)&&(nil == _timer)) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:_totalTime
                                                  target:_target
                                                selector:_aSelector
                                                userInfo:nil
                                                 repeats:NO];
        _startTime = [NSDate date];
    }
}

@end
