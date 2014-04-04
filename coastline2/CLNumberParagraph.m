//
//  CLNumberParagraph.m
//  coastline2
//
//  Created by wangyuanou on 14-2-7.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLNumberParagraph.h"
#import "CLSortedDirectionary.h"
#import "NSString+Convert.h"
#import "UIColor+Description.h"

#define KEY_RATE 1000.0

@implementation CLNumberParagraph {
	CLSortedDirectionary* _papragraph;
}

-(CLNumberParagraph*) init {
	self = [super init];
	if (self) {
		_papragraph = [[CLSortedDirectionary alloc] init];
	}
	return self;
}

-(void) addNumber:(float)value atPoint:(float)point {
	[_papragraph setValue:[NSNumber numberWithFloat:value]
				   forKey:point*KEY_RATE];
}

-(void) addColor:(UIColor*)value atPoint:(float)point {
	[_papragraph setValue:[NSString stringWithColor:value]
				   forKey:point*KEY_RATE];
}

-(void) addSize:(CGSize)value atPoint:(float)point {
	[_papragraph setValue:NSStringFromCGSize(value)
				   forKey:point*KEY_RATE];
}

-(void) addRect:(CGRect)value atPoint:(float)point {
	[_papragraph setValue:NSStringFromCGRect(value)
				   forKey:point*KEY_RATE];
}

-(void) addPoint:(CGPoint)value atPoint:(float)point {
	[_papragraph setValue:NSStringFromCGPoint(value)
				   forKey:point*KEY_RATE];
}

-(void) addString:(NSString*)value atPoint:(float)point {
    [_papragraph setValue:value forKey:point*KEY_RATE];
}

-(void) removeValueAtPoint:(float)point {
	[_papragraph removeValueOfKey:point*KEY_RATE];
}

-(NSString*) valueOfPoint:(float)pointC {
    int point = pointC*KEY_RATE;
	NSString* value = [_papragraph valueOfKey:point];
	if (nil != value) {
		return value;
	}
	
	int prevPoint = [_papragraph previousKeyOfKey:point];
	int nextPoint = [_papragraph nextKeyOfKey:point];
	
	if (prevPoint >= 0) {
		if (nextPoint >= 0) {
			//
		} else {
			value = [_papragraph valueOfKey:prevPoint];
			if (nil != value) {
				return value;
			}
		}
	} else {
		if (nextPoint >= 0) {
			value = [_papragraph valueOfKey:nextPoint];
			if (nil != value) {
				return value;
			}
		}
	}
	
	return nil;
}

-(float) numberOfPoint:(float)pointC {
    int point = pointC*KEY_RATE;
	NSNumber* value = [_papragraph valueOfKey:point];
	if (nil != value) {
		return [value floatValue];
	}
	
	int prevPoint = [_papragraph previousKeyOfKey:point];
	int nextPoint = [_papragraph nextKeyOfKey:point];
	
	if (prevPoint >= 0) {
		if (nextPoint >= 0) {
			float startData = [[_papragraph valueOfKey:prevPoint] floatValue];
			float endData = [[_papragraph valueOfKey:nextPoint] floatValue];
			return [self middleNumberOfStart:prevPoint
									  middle:point
										 end:nextPoint
								   startData:startData
									 endData:endData];
		} else {
			value = [_papragraph valueOfKey:prevPoint];
			if (nil != value) {
				return [value floatValue];
			}
		}
	} else {
		if (nextPoint >= 0) {
			value = [_papragraph valueOfKey:nextPoint];
			if (nil != value) {
				return [value floatValue];
			}
		}
	}
	
	return -2;
}

-(UIColor*) colorOfPoint:(float)pointC {
    int point = pointC*KEY_RATE;
	NSString* value = [_papragraph valueOfKey:point];
	if (nil != value) {
		return [value colorValue];
	}
	
	int prevPoint = [_papragraph previousKeyOfKey:point];
	int nextPoint = [_papragraph nextKeyOfKey:point];
	
	if (prevPoint >= 0) {
		if (nextPoint >= 0) {
			UIColor* startColor = [[_papragraph valueOfKey:prevPoint] colorValue];
			UIColor* endColor = [[_papragraph valueOfKey:nextPoint] colorValue];
			CGFloat startRed,startGreen,startBlue,startAlpha;
			CGFloat endRed,endGreen,endBlue,endAlpha;
			[startColor getRed:&startRed green:&startGreen blue:&startBlue alpha:&startAlpha];
			[endColor getRed:&endRed green:&endGreen blue:&endBlue alpha:&endAlpha];
			float redChannel = [self middleNumberOfStart:prevPoint
									  middle:point
										 end:nextPoint
								   startData:startRed
									 endData:endRed];
			float greenChannel = [self middleNumberOfStart:prevPoint
													middle:point
													   end:nextPoint
												 startData:startGreen
												   endData:endGreen];
			float blueChannel = [self middleNumberOfStart:prevPoint
												   middle:point
													  end:nextPoint
												startData:startBlue
												  endData:endBlue];
			float alpahChannel = [self middleNumberOfStart:prevPoint
													middle:point
													   end:nextPoint
												 startData:startAlpha
												   endData:endAlpha];
			return [UIColor colorWithRed:redChannel
								   green:greenChannel
									blue:blueChannel
								   alpha:alpahChannel];
		} else {
			value = [_papragraph valueOfKey:prevPoint];
			if (nil != value) {
				return [value colorValue];
			}
		}
	} else {
		if (nextPoint >= 0) {
			value = [_papragraph valueOfKey:nextPoint];
			if (nil != value) {
				return [value colorValue];
			}
		}
	}

	return nil;
}

-(CGSize) sizeOfPoint:(float)pointC {
    int point = pointC*KEY_RATE;
	NSString* value = [_papragraph valueOfKey:point];
	if (nil != value) {
		return CGSizeFromString(value);
	}
	
	int prevPoint = [_papragraph previousKeyOfKey:point];
	int nextPoint = [_papragraph nextKeyOfKey:point];
	
	if (prevPoint >= 0) {
		if (nextPoint >= 0) {
			NSString* startData = [_papragraph valueOfKey:prevPoint];
			NSString* endData = [_papragraph valueOfKey:nextPoint];
			CGSize startSize = CGSizeFromString(startData);
			CGSize endSize = CGSizeFromString(endData);
			float width = [self middleNumberOfStart:prevPoint
									  middle:point
										 end:nextPoint
								   startData:startSize.width
									 endData:endSize.width];
			float height = [self middleNumberOfStart:prevPoint
											  middle:point
												 end:nextPoint
										   startData:startSize.height
											 endData:endSize.height];
			return CGSizeMake(width, height);
		} else {
			value = [_papragraph valueOfKey:prevPoint];
			if (nil != value) {
				return CGSizeFromString(value);
			}
		}
	} else {
		if (nextPoint >= 0) {
			value = [_papragraph valueOfKey:nextPoint];
			if (nil != value) {
				return CGSizeFromString(value);
			}
		}
	}
	
	return CGSizeZero;
}

-(CGRect) rectOfPoint:(float)pointC {
    int point = pointC*KEY_RATE;
	NSString* value = [_papragraph valueOfKey:point];
	if (nil != value) {
		return CGRectFromString(value);
	}
	
	int prevPoint = [_papragraph previousKeyOfKey:point];
	int nextPoint = [_papragraph nextKeyOfKey:point];
	
	if (prevPoint >= 0) {
		if (nextPoint >= 0) {
			NSString* startData = [_papragraph valueOfKey:prevPoint];
			NSString* endData = [_papragraph valueOfKey:nextPoint];
			CGRect startRect = CGRectFromString(startData);
			CGRect endRect = CGRectFromString(endData);
			float x = [self middleNumberOfStart:prevPoint
											 middle:point
												end:nextPoint
										  startData:startRect.origin.x
											endData:endRect.origin.x];
			float y = [self middleNumberOfStart:prevPoint
											  middle:point
												 end:nextPoint
										   startData:startRect.origin.y
											 endData:endRect.origin.y];
			float width = [self middleNumberOfStart:prevPoint
										 middle:point
											end:nextPoint
									  startData:startRect.size.width
										endData:endRect.size.width];
			float height = [self middleNumberOfStart:prevPoint
											 middle:point
												end:nextPoint
										  startData:startRect.size.height
											endData:endRect.size.height];
			return CGRectMake(x, y, width, height);
		} else {
			value = [_papragraph valueOfKey:prevPoint];
			if (nil != value) {
				return CGRectFromString(value);
			}
		}
	} else {
		if (nextPoint >= 0) {
			value = [_papragraph valueOfKey:nextPoint];
			if (nil != value) {
				return CGRectFromString(value);
			}
		}
	}
	
	return CGRectZero;
}

-(CGPoint) pointOfPoint:(float)pointC {
    int point = pointC*KEY_RATE;
	NSString* value = [_papragraph valueOfKey:point];
	if (nil != value) {
		return CGPointFromString(value);
	}
	
	int prevPoint = [_papragraph previousKeyOfKey:point];
	int nextPoint = [_papragraph nextKeyOfKey:point];
	
	if (prevPoint >= 0) {
		if (nextPoint >= 0) {
			NSString* startData = [_papragraph valueOfKey:prevPoint];
			NSString* endData = [_papragraph valueOfKey:nextPoint];
			CGPoint startPoint = CGPointFromString(startData);
			CGPoint endPoint = CGPointFromString(endData);
			float width = [self middleNumberOfStart:prevPoint
											 middle:point
												end:nextPoint
										  startData:startPoint.x
											endData:endPoint.x];
			float height = [self middleNumberOfStart:prevPoint
											  middle:point
												 end:nextPoint
										   startData:startPoint.y
											 endData:endPoint.y];
			return CGPointMake(width, height);
		} else {
			value = [_papragraph valueOfKey:prevPoint];
			if (nil != value) {
				return CGPointFromString(value);
			}
		}
	} else {
		if (nextPoint >= 0) {
			value = [_papragraph valueOfKey:nextPoint];
			if (nil != value) {
				return CGPointFromString(value);
			}
		}
	}
	
	return CGPointZero;
}

-(NSString*) stringOfPoint:(float)pointC {
    int point = pointC*KEY_RATE;
	NSString* value = [_papragraph valueOfKey:point];
	if (nil != value) {
		return value;
	}
    
    int prevPoint = [_papragraph previousKeyOfKey:point];
    if (prevPoint >= 0) {
        return [_papragraph valueOfKey:prevPoint];
    }
    
    int nextPoint = [_papragraph nextKeyOfKey:point];
    if (nextPoint >= 0) {
        return [_papragraph valueOfKey:nextPoint];
    }
    
    return nil;
}

-(float) middleNumberOfStart:(float)start middle:(float)middle end:(float)end
				   startData:(float)startData endData:(float)endData {
	return (endData-startData)*(middle-start)/(end-start)+startData;
}

-(NSString*) description {
	return [_papragraph description];
}

@end
