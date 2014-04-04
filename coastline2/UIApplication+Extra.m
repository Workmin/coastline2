//
//  UIApplication+Extra.m
//  coastline2
//
//  Created by wangyuanou on 14-2-14.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIApplication+Extra.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation UIApplication (Extra)

+(NSString*) scheme {
	return [[NSBundle mainBundle] bundleIdentifier];
}

+(NSString*) version {
	return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+(NSString*) value:(NSString*)key {
	return [[NSBundle mainBundle] objectForInfoDictionaryKey:key];
}

+(void) vibrate {
	AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
