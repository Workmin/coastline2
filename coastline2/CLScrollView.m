//
//  CLScrollView.m
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLScrollView.h"
#import "UIView+Position.h"

#define KEYBOARD_HEIGHT 310

@implementation CLScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)touchesShouldCancelInContentView:(UIView *)view{
    return YES;
}

-(void) setPage:(int)page {
	if (self.contentSize.width <= self.frame.size.width) {
		[self setContentOffset:CGPointMake(0, page*self.frame.size.height) animated:YES];
	} else {
		[self setContentOffset:CGPointMake(page*self.frame.size.width, 0) animated:YES];
	}
}

-(int) page {
	if (self.contentSize.width <= self.frame.size.width) {
		return (self.contentOffset.y+self.frame.size.height/2)/self.frame.size.height;
	} else {
		return (self.contentOffset.x+self.frame.size.width/2)/self.frame.size.width;
	}
}

-(int) pageCount {
	if (self.contentSize.width <= self.frame.size.width) {
		return self.contentSize.height/self.frame.size.height;
	} else {
		return self.contentSize.width/self.frame.size.width;
	}
}

-(void) moveForTextField:(UITextField*)textField {
    CGPoint position = [textField positionOfAncestor:self];
    if (position.y > [[UIScreen mainScreen] bounds].size.height-KEYBOARD_HEIGHT) {
        CGPoint oldOffset = self.contentOffset;
        oldOffset.y -= position.y-[[UIScreen mainScreen] bounds].size.height+KEYBOARD_HEIGHT;
        [self setContentOffset:oldOffset animated:YES];
    } else if (position.y < 0) {
        CGPoint oldOffset = self.contentOffset;
        oldOffset.y += position.y;
        [self setContentOffset:oldOffset animated:YES];
    }
}

-(void) moveToEnd:(BOOL)animation {
    if (self.contentSize.height > self.frame.size.height+2) {
        [self setContentOffset:CGPointMake(0, self.contentSize.height-self.frame.size.height) animated:animation];
    } else if (self.contentSize.width > self.frame.size.width+2) {
        [self setContentOffset:CGPointMake(self.contentSize.width-self.frame.size.width, 0) animated:animation];
    }
}

@end
