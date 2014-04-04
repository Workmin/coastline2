//
//  CLAnimationView.m
//  coastline2
//
//  Created by wangyuanou on 14-2-8.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLAnimationView.h"

@implementation CLAnimationView {
	CLAnimation* _animation;
	NSDictionary* _numberParagraphs;
	AnimationDrawBlock _drawBlock;
	float _progress;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		_animation = [[CLAnimation alloc] init];
    }
    return self;
}

-(id) init {
	self = [super init];
	if (self) {
		_animation = [[CLAnimation alloc] init];
	}
	return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self) {
		_animation = [[CLAnimation alloc] init];
	}
	return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
	if (_drawBlock) {
		_drawBlock(_numberParagraphs, _progress);
	}
}


-(CLNumberParagraph*) numberParagraphForId:(NSString*)identifier {
	return [_animation numberParagraphForId:identifier];
}

-(void) animationByDuration:(NSTimeInterval)duration withBlock:(AnimationDrawBlock)block {
	[_animation animationByDuration:duration
						  withBlock:^(NSDictionary *numberParagraphs, float progress) {
							  if (nil == _numberParagraphs) {
								  _numberParagraphs = numberParagraphs;
							  }
							  _progress = progress;
							  _drawBlock = block;
							  [self setNeedsDisplay];
						  }];
}

@end
