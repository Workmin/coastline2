//
//  CLContext.m
//  coastline2
//
//  Created by wangyuanou on 14-1-20.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLContext.h"
#import <UIKit/UIKit.h>

@implementation CLContext {
    CGContextRef _currentContext;
}

-(CGContextRef) CGContext {
    return _currentContext;
}

-(CLContext*) initWithCGContext:(CGContextRef)context {
    self = [super init];
    if (self) {
        _currentContext = context;
    }
    
    return self;
}

+(CLContext*) current {
    return [[CLContext alloc] initWithCGContext:UIGraphicsGetCurrentContext()];
}

-(void) setPaintMode {
    CGContextSetBlendMode(_currentContext, kCGBlendModeNormal);
}

-(void) setClearMode {
    CGContextSetBlendMode(_currentContext, kCGBlendModeClear);
}

-(void) setLineWidth:(float)lineWidth {
    CGContextSetLineWidth(_currentContext, lineWidth);
}

-(void) setFontWithName:(NSString*)fontName size:(float)fontSize {
    CFStringRef fontNameRef = (CFStringRef)CFBridgingRetain(fontName);
    CGFontRef font = CGFontCreateWithFontName(fontNameRef);
    CGContextSetFont(_currentContext, font);
    CGFontRelease(font);
    CFRelease(fontNameRef);
    CGContextSetFontSize(_currentContext, fontSize);
}

-(void) setThickFontWithSize:(float)fontSize {
    [self setFontWithName:@"HelveticaNeue-Blod" size:fontSize];
}

-(void) setNormalFontwithSize:(float)fontSize {
    [self setFontWithName:@"HelveticaNeue-UltraLight" size:fontSize];
}

-(void) setBoldFontWithSize:(float)fontSize {
    [self setFontWithName:@"HelveticaNeue-Bold" size:fontSize];
}

-(void) setShadowOffset:(CGSize)offset blur:(float)blur color:(UIColor*)color {
    CGContextSetShadowWithColor(_currentContext, offset, blur, color.CGColor);
}

-(void) setCurrentPoint:(CGPoint)currentPoint {
    _currentPoint = currentPoint;
    
    CGContextMoveToPoint(_currentContext, currentPoint.x, currentPoint.y);
}

-(CGPoint) updatePoint:(CGPoint)point withDirection:(Direction)direction length:(float)length {
    switch (direction) {
        case DIRECTION_LEFT:
            return CGPointMake(point.x-length, point.y);
        case DIRECTION_RIGHT:
            return CGPointMake(point.x+length, point.y);
        case DIRECTION_UP:
            return CGPointMake(point.x, point.y-length);
        case DIRECTION_DOWN:
            return CGPointMake(point.x, point.y+length);
        case DIRECTION_LEFT_UP:
            return CGPointMake(point.x-length, point.y-length);
        case DIRECTION_LEFT_DOWN:
            return CGPointMake(point.x-length, point.y+length);
        case DIRECTION_RIGHT_UP:
            return CGPointMake(point.x+length, point.y-length);
        case DIRECTION_RIGHT_DOWN:
            return CGPointMake(point.x+length, point.y+length);
    }
    
    return point;
}

-(void) to:(Direction)direction length:(float)length {
    CGPoint newPoint = [self updatePoint:_currentPoint withDirection:direction length:length];
    
    [self setCurrentPoint:newPoint];
}

-(void) lineTo:(Direction)direction length:(float)length {
    CGPoint newPoint = [self updatePoint:_currentPoint withDirection:direction length:length];
    
    _currentPoint = newPoint;
    CGContextAddLineToPoint(_currentContext, _currentPoint.x, _currentPoint.y);
    
    CGContextStrokePath(_currentContext);
}

-(void) save {
    CGContextSaveGState(_currentContext);
}

-(void) restore {
    CGContextRestoreGState(_currentContext);
}

+(UIImage*) imageFromPaint:(DrawBlock)drawBlock size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CLContext* context = [CLContext current];
	[context save];
	drawBlock(size);
	[context restore];
	UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return image;
}

@end
