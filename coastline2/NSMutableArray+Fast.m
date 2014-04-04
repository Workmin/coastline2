//
//  NSMutableArray+Fast.m
//  coastline2
//
//  Created by wangyuanou on 14-1-28.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSMutableArray+Fast.h"

@implementation NSMutableArray (Fast)

-(void) replaceObjectWithSameId:(NSString*)idKey dictionary:(NSDictionary*)value {
	for (int i = 0; i < [self count]; ++i) {
		NSDictionary* item = self[i];
		if (![item isKindOfClass:[NSDictionary class]]){
			return;
		}
		
		NSString* idValue = item[idKey];
		NSString* newIdValue = value[idKey];
		if ([idValue isEqualToString:newIdValue]) {
			[self replaceObjectAtIndex:i withObject:value];
		}
	}
}

@end
