//
//  UIResponder+Enum.m
//  coastline2
//
//  Created by 王渊鸥 on 14-4-15.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "UIResponder+Enum.h"

@implementation UIResponder (Enum)

+(void) resignAll:(NSArray*)responders {
    for (UIResponder* item in responders) {
        if ([item isFirstResponder]) {
            [item resignFirstResponder];
            return;
        }
    }
}

@end
