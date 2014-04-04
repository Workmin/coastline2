//
//  UIDevice+Sound.m
//  coastline2
//
//  Created by wangyuanou on 14-3-30.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIDevice+Sound.h"
#import <AVFoundation/AVFoundation.h>

@implementation UIDevice (Sound)

+(void) playSound:(NSString*)soundFile {
    static SystemSoundID soundId = 0;
    if (0 == soundId) {
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundId);
    }
    AudioServicesPlaySystemSound(soundId);
}

@end
