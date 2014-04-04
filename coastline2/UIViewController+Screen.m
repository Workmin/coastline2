//
//  UIViewController+Screen.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIViewController+Screen.h"

@implementation UIViewController (Screen)

-(UIImage*) screenImage {
    CALayer* layer = self.view.layer;
	UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 2.0);
	CGContextRef context = UIGraphicsGetCurrentContext();
	[layer renderInContext:context];
	UIImage* viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return viewImage;
}

-(UIImage*) screenImageFast {
    CALayer* layer = self.view.layer;
	UIGraphicsBeginImageContext(self.view.bounds.size);
	CGContextRef context = UIGraphicsGetCurrentContext();
	[layer renderInContext:context];
	UIImage* viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return viewImage;
}

-(float) left {
    return self.view.frame.origin.x;
}

-(float) right {
    return [self left]+[self width];
}

-(float) top {
    return self.view.frame.origin.y;
}

-(float) bottom {
    return [self top]+[self height];
}

-(float) height {
    return self.view.frame.size.height;
}

-(float) width {
    return self.view.frame.size.width;
}

@end
