//
//  CLContext.h
//  coastline2
//
//  Created by wangyuanou on 14-1-20.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


typedef enum _Direction {
    DIRECTION_LEFT,
    DIRECTION_RIGHT,
    DIRECTION_UP,
    DIRECTION_DOWN,
    DIRECTION_LEFT_UP,
    DIRECTION_LEFT_DOWN,
    DIRECTION_RIGHT_UP,
    DIRECTION_RIGHT_DOWN
} Direction;

@class CLContext;

typedef void (^DrawBlock)(CGSize size);

@interface CLContext : NSObject

@property(nonatomic) CGPoint currentPoint;

-(CGContextRef) CGContext;

-(CLContext*) initWithCGContext:(CGContextRef)context;
+(CLContext*) current;

-(void) setPaintMode;
-(void) setClearMode;
-(void) setLineWidth:(float)lineWidth;
-(void) setFontWithName:(NSString*)fontName size:(float)fontSize;
-(void) setThickFontWithSize:(float)fontSize;
-(void) setNormalFontwithSize:(float)fontSize;
-(void) setBoldFontWithSize:(float)fontSize;
-(void) setShadowOffset:(CGSize)offset blur:(float)blur color:(UIColor*)color;

-(void) to:(Direction)direction length:(float)length;
-(void) lineTo:(Direction)direction length:(float)length;

-(void) save;
-(void) restore;

+(UIImage*) imageFromPaint:(DrawBlock)drawBlock size:(CGSize)size;

@end
