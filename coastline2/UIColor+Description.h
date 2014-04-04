//
//  UIColor+Description.h
//  coastline2
//
//  Created by wangyuanou on 14-2-8.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Description)

-(NSString*) description;

+(UIColor*) loveColor;

-(UIColor*) darkerColor;
-(UIColor*) lighterColor;

-(UIColor*) noiseWithRate:(float)rate;

@end
