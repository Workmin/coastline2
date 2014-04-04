//
//  UIApplication+Extra.h
//  coastline2
//
//  Created by wangyuanou on 14-2-14.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extra)

+(NSString*) scheme;
+(NSString*) version;
+(NSString*) value:(NSString*)key;

+(void) vibrate;

@end
