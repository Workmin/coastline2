//
//  UIImage+Thumb.m
//  coastline
//
//  Created by WangYuanOu on 13-9-29.
//  Copyright (c) 2013年 mixbus. All rights reserved.
//

#import "UIImage+Thumb.h"

@implementation UIImage (Thumb)

-(UIImage*) thumbWithSize:(CGSize)size {
	float pnw = size.width;
	float pnh = size.height;
	float imw = self.size.width;
	float imh = self.size.height;
	float cpw = 0;
	float cph = 0;
	float cpx = 0;
	float cpy = 0;
	if (imw/imh <= pnw/pnh) {
		cpw = pnw;
		cph = cpw*imh/imw;
		cpx = 0;
		cpy = (pnh-cph)/2;
	} else {
		cph = pnh;
		cpw = cph*imw/imh;
		cpy = 0;
		cpx = (pnw-cpw)/2;
	}
	
	//NSLog(@"pnw:%f pnh%f imw:%f imh:%f cpw:%f cph:%f cpx:%f cpy:%f", pnw, pnh, imw, imh, cpw, cph, cpx, cpy);
	UIGraphicsBeginImageContext(size);
	[self drawInRect:CGRectMake(cpx, cpy, cpw, cph)];
	UIImage* thumbImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return thumbImage;
}

-(UIImage*) imageWithClip:(CGRect)rect {
	CGImageRef sourceImageRef = [self CGImage];
	CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, rect);
    //CGContextSetInterpolationQuality -- 设置图片插值算法图片质量
	UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
	CGImageRelease(newImageRef);
	return newImage;
}

@end
