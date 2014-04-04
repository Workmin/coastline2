//
//  UIColor+Description.m
//  coastline2
//
//  Created by wangyuanou on 14-2-8.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIColor+Description.h"
#import "NSString+Convert.h"
#import "KGNoise.h"

@implementation UIColor (Description)

-(NSString*) description {
    return [NSString stringWithColor:self];
}

+(UIColor*) loveColor {
	return [UIColor colorWithRed:46/255.0 green:46/255.0 blue:46/255.0 alpha:1];
}

-(UIColor*) darkerColor {
    CGFloat red, green, blue, alpha;
    if (![self getRed:&red green:&green blue:&blue alpha:&alpha]) {
		CGFloat fwhite;
		[self getWhite:&fwhite alpha:&alpha];
		red = fwhite;
		green = red;
		blue = red;
	}
    
    CGFloat distanceRed = (1-red)/4;
    CGFloat distanceGreen = (1-green)/4;
    CGFloat distanceBlue = (1-blue)/4;
    
    return [UIColor colorWithRed:red-distanceRed
                           green:green-distanceGreen
                            blue:blue-distanceBlue
                           alpha:alpha];
}

-(UIColor*) lighterColor {
    CGFloat red, green, blue, alpha;
    if (![self getRed:&red green:&green blue:&blue alpha:&alpha]) {
		CGFloat fwhite;
		[self getWhite:&fwhite alpha:&alpha];
		red = fwhite;
		green = red;
		blue = red;
	}
    
    CGFloat distanceRed = (1-red)/4;
    CGFloat distanceGreen = (1-green)/4;
    CGFloat distanceBlue = (1-blue)/4;
    
    return [UIColor colorWithRed:red+distanceRed
                           green:green+distanceGreen
                            blue:blue+distanceBlue
                           alpha:alpha];
}

-(UIColor*) noiseWithRate:(float)rate {
    return [self colorWithNoiseWithOpacity:rate];
}

@end
