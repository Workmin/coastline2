//
//  CLAnimation.h
//  coastline2
//
//  Created by wangyuanou on 14-2-8.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLNumberParagraph.h"

@interface CLAnimation : NSObject

typedef void(^AnimationDrawBlock)(NSDictionary* numberParagraphs, float progress);

-(CLAnimation*) init;

-(CLNumberParagraph*) numberParagraphForId:(NSString*)identifier;

-(void) animationByDuration:(NSTimeInterval)duration withBlock:(AnimationDrawBlock)block;

@property(nonatomic) float progress;//0.0-1.0

@end




@interface CLAnimationTimer : NSObject

@property(nonatomic, strong) NSDate* finishTime;
@property(nonatomic, strong) AnimationDrawBlock drawBlock;
@property(nonatomic) NSTimeInterval duration;

@end
