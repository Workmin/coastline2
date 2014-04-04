//
//  CLAnimationView.h
//  coastline2
//
//  Created by wangyuanou on 14-2-8.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLAnimation.h"

@interface CLAnimationView : UIView

-(CLNumberParagraph*) numberParagraphForId:(NSString*)identifier;

-(void) animationByDuration:(NSTimeInterval)duration withBlock:(AnimationDrawBlock)block;

@end
