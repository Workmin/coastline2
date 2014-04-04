//
//  CLTimer.h
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLTimer : NSObject

-(CLTimer*) initWithTimeInterval:(NSTimeInterval)seconds
						  target:(id)target
						selector:(SEL)aSelector;

+(CLTimer*) timerWithTimeInterval:(NSTimeInterval)seconds
                           target:(id)target
                         selector:(SEL)aSelector;

-(void) stop;
-(void) resume;

@end
