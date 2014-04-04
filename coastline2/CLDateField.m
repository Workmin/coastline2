//
//  CLDateField.m
//  coastline
//
//  Created by wangyuanou on 14-1-13.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLDateField.h"
#import "CLText.h"

@implementation CLDateField {
	BOOL _busy;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		//self.delegate = self;
		//self.returnKeyType = UIReturnKeySend;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
	if ([self.text length] > 8) {
		self.text = [self.text substringToIndex:7];
	}
	
	NSMutableString* text = [self.text mutableCopy];
	if ([text length] > 6) {
		[text insertString:@"-" atIndex:6];
		[text insertString:@"-" atIndex:4];
	} else if ([text length] > 4) {
		[text insertString:@"-" atIndex:4];
	}
    
    CLText* textDraw = [[CLText alloc] init];
    textDraw.text = text;
    textDraw.font = [UIFont fontWithName:[CLText lightFontName]
                                    size:16];
    textDraw.alignment = NSTextAlignmentLeft;
    textDraw.color = [UIColor darkGrayColor];
    textDraw.frame = rect;
    [textDraw drawInContext:UIGraphicsGetCurrentContext()];
}

@end
