//
//  UIView+Structure.m
//  coastline2
//
//  Created by wangyuanou on 14-2-14.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIView+Structure.h"
#import "NSString+Convert.h"

@implementation UIView (Structure)

-(void) addSubviews:(NSArray*)subviews {
	NSUInteger count				= [subviews count];
	UIView* lastView		= self;
	for (int i = 0; i < count; ++i) {
		id item				= subviews[i];
		if ([item isKindOfClass:[UIView class]]) {
			[self addSubview:item];
			lastView		= item;
		} else if ([item isKindOfClass:[NSArray class]]) {
			[lastView addSubviews:item];
		}
	}
}

-(void) removeAllSubviews {
	for (UIView* view in self.subviews) {
		[view removeFromSuperview];
	}
}

-(UIView*) findFirstResponder {
	if ([self isFirstResponder])
        return self;
	
    for (UIView * subView in self.subviews)
    {
        UIView * fr = [subView findFirstResponder];
        if (fr != nil)
            return fr;
    }
	
    return nil;
}

-(void) logUp {
	UIView* currentView = self;
	int tab = 0;
	while (currentView != nil) {
		[currentView logThisWithFix:[NSString stringWithFormat:@"%i", tab]];
		tab++;
		currentView = currentView.superview;
	}
}

-(void) logDown {
	[self logThisWithFix:@""];
	[self logDownWithIndex:0];
}

-(void) logDownWithIndex:(int)index {
	NSArray* subViews = self.subviews;
	for (UIView* view in subViews) {
		[view logThisWithFix:[NSString stringWithString:@"\t" count:index+1]];
		[view logDownWithIndex:index+2];
	}
}

-(void) logThisWithFix:(NSString*)fix {
	NSString* className = NSStringFromClass([self class]);
	NSString* rect = NSStringFromCGRect(self.frame);
	NSLog(@"%@[%@]%@", fix, className, rect);
}

-(UIView*) lastViewWithTag:(int)tag {
	NSArray* subViews = self.subviews;
	int count = (int)[subViews count];
	for (int i = count-1; i >= 0; --i) {
		UIView* view = subViews[i];
		if (view.tag == tag) {
			return view;
		}
	}
	
	return nil;
}

@end
