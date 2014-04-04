//
//  CLText.h
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface CLText : NSObject

@property(nonatomic, strong) NSString* text;
@property(nonatomic, strong) UIFont* font;
@property(nonatomic) CGRect frame;
@property(nonatomic) NSTextAlignment alignment;
@property(nonatomic) VerticalAlignment verticalAlignment;
@property(nonatomic, strong) UIColor* color;

-(float) textHeight;
-(void) drawInContext:(CGContextRef)context;

+(NSString*) lightFontName;
+(NSString*) boldFontName;

@end
