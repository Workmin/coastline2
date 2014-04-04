//
//  CLSortedDirectionary.m
//  coastline2
//
//  Created by wangyuanou on 14-2-7.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLSortedDirectionary.h"

#define SD_KEY @"key"
#define SD_VALUE @"value"

@implementation CLSortedDirectionary {
	NSMutableArray* _objectList;
}

-(CLSortedDirectionary*) init {
	self = [super init];
	if (self) {
		_objectList = [[NSMutableArray alloc] init];
	}
	return self;
}

-(void) setValue:(id)anObject forKey:(int)key {
	unsigned long count = [_objectList count];
	if (count == 0) {
		[_objectList addObject:@{SD_KEY:[NSNumber numberWithInt:key],
			SD_VALUE:anObject}];
		return;
	}
	
	for (int i = 0; i < count; ++i) {
		NSDictionary* currentObject = [_objectList objectAtIndex:i];
		int currentKey = [currentObject[SD_KEY] intValue];
		if (key == currentKey) {
			[_objectList replaceObjectAtIndex:i withObject:@{SD_KEY:[NSNumber numberWithInt:key], SD_VALUE:anObject}];
			return;
		} else if (key < currentKey) {
			[_objectList insertObject:@{SD_KEY:[NSNumber numberWithInt:key],
								 SD_VALUE:anObject}
					   atIndex:i];
			return;
		}
	}
	[_objectList addObject:@{SD_KEY:[NSNumber numberWithInt:key],
					  SD_VALUE:anObject}];
}

-(void) removeValueOfKey:(int)key {
	unsigned long count = [_objectList count];
	for (int i = 0; i < count; ++i) {
		NSDictionary* currentObject = [_objectList objectAtIndex:i];
		int currentKey = [currentObject[SD_KEY] intValue];
		if (key == currentKey) {
			[_objectList removeObjectAtIndex:i];
		} else if (key > currentKey) {
			break;
		}
	}
}

-(id) valueOfKey:(int)key {
	unsigned long count = [_objectList count];
	for (int i = 0; i < count; ++i) {
		NSDictionary* currentObject = [_objectList objectAtIndex:i];
		int currentKey = [currentObject[SD_KEY] intValue];
		if (key == currentKey) {
			return currentObject[SD_VALUE];
		} else if (key < currentKey) {
			return nil;
		}
	}
	
	return nil;
}

-(int) previousKeyOfKey:(int)key {
	int count = (int)[_objectList count];
	for (int i = count-1; i >= 0; --i) {
		NSDictionary* currentObject = [_objectList objectAtIndex:i];
		int currentKey = [currentObject[SD_KEY] intValue];
		if (key > currentKey) {
			return currentKey;
		}
	}
	
	return -1;
}

-(int) nextKeyOfKey:(int)key {
	unsigned long count = [_objectList count];
	for (int i = 0; i < count; ++i) {
		NSDictionary* currentObject = [_objectList objectAtIndex:i];
		int currentKey = [currentObject[SD_KEY] intValue];
		if (key < currentKey) {
			return currentKey;
		}
	}
	
	return -1;
}

-(NSString*) description {
	return [_objectList description];
}


@end
