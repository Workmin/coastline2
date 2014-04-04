//
//  CLControl.m
//  coastline2
//
//  Created by wangyuanou on 14-1-20.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLControl.h"

@implementation CLControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addTarget:self action:@selector(updateControlState:)
	   forControlEvents:UIControlEventTouchDown|UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    if ((UIControlStateSelected == self.state)||(UIControlStateHighlighted == self.state)) {
        if (_selectedDraw) {
            _selectedDraw(rect.size);
        } else if (_normalDraw) {
            _normalDraw(rect.size);
        }
    } else if (UIControlStateDisabled == self.state) {
        if (_disabledDraw) {
            _disabledDraw(rect.size);
        } else if (_normalDraw) {
            _normalDraw(rect.size);
        }
    } else {
        if (_normalDraw) {
            _normalDraw(rect.size);
        }
    }
}

-(void) updateControlState:(id)sender {
	[self setNeedsDisplay];
}

@end
