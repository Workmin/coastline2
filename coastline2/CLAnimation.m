//
//  CLAnimation.m
//  coastline2
//
//  Created by wangyuanou on 14-2-8.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLAnimation.h"

@implementation CLAnimation {
	NSMutableDictionary* _numberParagraphList;
}


#pragma error test

-(CLAnimation*) init {
	self = [super init];
	if (self) {
		_numberParagraphList = [[NSMutableDictionary alloc] init];
	}
	return self;
}

-(CLNumberParagraph*) numberParagraphForId:(NSString*)identifier {
	CLNumberParagraph* paragraph = _numberParagraphList[identifier];
	if (nil == paragraph) {
		paragraph = [[CLNumberParagraph alloc] init];
		_numberParagraphList[identifier] = paragraph;
	}
	
	return paragraph;
}

-(void) animationByDuration:(NSTimeInterval)duration withBlock:(AnimationDrawBlock)block {
	CLAnimationTimer* animationTimer = [[CLAnimationTimer alloc] init];
	animationTimer.finishTime = [NSDate dateWithTimeIntervalSinceNow:duration];
	animationTimer.drawBlock = block;
	animationTimer.duration = duration;
	
	[NSTimer scheduledTimerWithTimeInterval:0.1
									 target:self
								   selector:@selector(timerSelector:)
								   userInfo:animationTimer
									repeats:YES];
}

-(void) timerSelector:(NSTimer*)timer {
	CLAnimationTimer* animationTimer = (CLAnimationTimer*)timer.userInfo;
	AnimationDrawBlock drawBlock = animationTimer.drawBlock;
	if (drawBlock) {
		NSTimeInterval duration = animationTimer.duration;
		NSTimeInterval leftLength = [animationTimer.finishTime timeIntervalSinceNow];
		_progress = (duration-leftLength)/duration;
		drawBlock(_numberParagraphList, _progress);
	}
	
	if ([[NSDate date] compare:animationTimer.finishTime] == NSOrderedDescending) {
		[timer invalidate];
	}
}

-(void) setProgress:(float)progress {
}

@end

@implementation CLAnimationTimer


@end
