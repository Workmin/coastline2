//
//  CLText.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLText.h"

@implementation CLText

-(float) textHeight {
    UIFont* textFont = _font;
    if (nil == textFont) {
        textFont = [UIFont fontWithName:[CLText lightFontName]
                                   size:13];
    }
	NSDictionary* titleFontAttributes = @{NSFontAttributeName:textFont};
	
    CGSize size = CGSizeMake(_frame.size.width, 10000);
	CGRect rect = [_text boundingRectWithSize:size
                                      options:0
                                   attributes:titleFontAttributes
                                      context:nil];
    
    return rect.size.height;
}

-(void) drawInContext:(CGContextRef)context {
    CGRect textFrame = _frame;
    if (self.verticalAlignment == VerticalAlignmentBottom) {
        textFrame.origin.y += textFrame.size.height-[self textHeight];
    } else if (self.verticalAlignment == VerticalAlignmentMiddle) {
        textFrame.origin.y += (textFrame.size.height-[self textHeight])/2;
    }
    NSMutableParagraphStyle* titleStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
	[titleStyle setAlignment: _alignment];
    UIFont* textFont = _font;
    if (nil == textFont) {
        textFont = [UIFont fontWithName:[CLText lightFontName]
                                   size:13];
    }
    UIColor* textColor = _color;
    if (nil == textColor) {
        textColor = [UIColor darkGrayColor];
    }
	NSDictionary* titleFontAttributes = @{NSFontAttributeName:textFont,
										  NSForegroundColorAttributeName:textColor,
										  NSParagraphStyleAttributeName:titleStyle};
    [_text drawInRect:textFrame withAttributes:titleFontAttributes];
}

+(NSString*) lightFontName {
    return @"HelveticaNeue-Light";
}

+(NSString*) boldFontName {
    return @"HelveticaNeue-Bold";
}

@end
