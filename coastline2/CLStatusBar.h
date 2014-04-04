//
//  CLStatusBar.h
//  coastline
//
//  Created by WangYuanOu on 13-7-17.
//  Copyright (c) 2013年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLStatusBar : UIView

+ (void)showWithStatus:(NSString*)status;
+ (void)showErrorWithStatus:(NSString*)status;
+ (void)showSuccessWithStatus:(NSString*)status;
+ (void)dismiss;

@end
