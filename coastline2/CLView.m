//
//  CLView.m
//  coastline2
//
//  Created by wangyuanou on 14-1-20.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLView.h"

@implementation CLView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    if (_drawBlock) {
        _drawBlock(rect.size);
    }
}

@end
