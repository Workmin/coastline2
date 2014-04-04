//
//  UIView+Position.m
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIView+Position.h"

@implementation UIView (Position)

-(CGPoint) positionOfAncestor:(UIView*)view {
    UIView* pointView = self;
    CGPoint point = {0,0};
    while (pointView != view) {
        if ([pointView isKindOfClass:[UIWindow class]]) {
            return self.frame.origin;
        }
        
        CGPoint positionToParent = [self positionOfParent];
        point = CGPointMake(point.x+positionToParent.x, point.y+positionToParent.y);
        
        pointView = pointView.superview;
    }
    return point;
}

-(CGPoint) positionOfParent {
    if ([self.superview isKindOfClass:[UIScrollView class]]) {
        UIScrollView* container = (UIScrollView*)self.superview;
        return CGPointMake(self.frame.origin.x-container.contentOffset.x,
                           self.frame.origin.y-container.contentOffset.y);
    } else {
        return self.frame.origin;
    }
}

-(float) sightYInScrollView:(UIScrollView*)container {
	float yPosition = [self YInView:container];
	return yPosition - container.contentOffset.y;
}

-(void) scrollToSightY:(float)y inScrollView:(UIScrollView*)container {
	float yPosition = [self YInView:container];
	NSLog(@"yPosition:%f", yPosition);
	CGPoint offset = CGPointMake(container.contentOffset.x, yPosition-y);
	[container setContentOffset:offset animated:YES];
}

-(float) YInView:(UIView*)superView {
	UIView* currentView = self;
	float y = 0;
	while (currentView != superView) {
		y += currentView.frame.origin.y;
		currentView = currentView.superview;
	}
	
	return y;
}

@end





