//
//  CLStatusBar.m
//  coastline
//
//  Created by WangYuanOu on 13-7-17.
//  Copyright (c) 2013年 mixbus. All rights reserved.
//

#import "CLStatusBar.h"

@interface CLStatusBar ()

@property (nonatomic, strong, readonly) UIWindow *overlayWindow;
@property (nonatomic, strong, readonly) UIView *topBar;
@property (nonatomic, strong) UILabel *stringLabel;

@end

@implementation CLStatusBar

@synthesize topBar, overlayWindow, stringLabel;

+ (CLStatusBar*)sharedView {
    static dispatch_once_t once;
    static CLStatusBar *sharedView;
    dispatch_once(&once, ^ { sharedView = [[CLStatusBar alloc] initWithFrame:[[UIScreen mainScreen] bounds]]; });
    return sharedView;
}

+ (void)showSuccessWithStatus:(NSString*)status
{
    [CLStatusBar showWithStatus:status];
    [CLStatusBar performSelector:@selector(dismiss) withObject:self afterDelay:2.0 ];
}

+ (void)showWithStatus:(NSString*)status {
    [[CLStatusBar sharedView] showWithStatus:status barColor:[UIColor blackColor] textColor:[UIColor colorWithRed:191.0/255.0 green:191.0/255.0 blue:191.0/255.0 alpha:1.0]];
}

+ (void)showErrorWithStatus:(NSString*)status {
    [[CLStatusBar sharedView] showWithStatus:status barColor:[UIColor colorWithRed:97.0/255.0 green:4.0/255.0 blue:4.0/255.0 alpha:1.0] textColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [CLStatusBar performSelector:@selector(dismiss) withObject:self afterDelay:2.0 ];
}

+ (void)dismiss {
    [[CLStatusBar sharedView] dismiss];
}

- (id)initWithFrame:(CGRect)frame {
	
    if ((self = [super initWithFrame:frame])) {
		self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor clearColor];
		self.alpha = 0;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

- (void)showWithStatus:(NSString *)status barColor:(UIColor*)barColor textColor:(UIColor*)textColor{
    if(!self.superview)
        [self.overlayWindow addSubview:self];
    [self.overlayWindow setHidden:NO];
    [self.topBar setHidden:NO];
    self.topBar.backgroundColor = barColor;
    NSString *labelText = status;
    CGRect labelRect = CGRectZero;
    CGFloat stringWidth = 0;
    CGFloat stringHeight = 0;
    if(labelText) {
        CGSize stringSize = [labelText sizeWithFont:self.stringLabel.font constrainedToSize:CGSizeMake(self.topBar.frame.size.width, self.topBar.frame.size.height)];
        stringWidth = stringSize.width;
        stringHeight = stringSize.height;
        
        labelRect = CGRectMake((self.topBar.frame.size.width / 2) - (stringWidth / 2), 0, stringWidth, stringHeight);
    }
    self.stringLabel.frame = labelRect;
    self.stringLabel.alpha = 0.0;
    self.stringLabel.hidden = NO;
    self.stringLabel.text = labelText;
    self.stringLabel.textColor = textColor;
    [UIView animateWithDuration:0.4 animations:^{
        self.stringLabel.alpha = 1.0;
    }];
    [self setNeedsDisplay];
}

- (void) dismiss
{
    [UIView animateWithDuration:0.4 animations:^{
        self.stringLabel.alpha = 0.0;
    } completion:^(BOOL finished) {
        [topBar removeFromSuperview];
        topBar = nil;
        
        [overlayWindow removeFromSuperview];
        overlayWindow = nil;
    }];
}

- (UIWindow *)overlayWindow {
    if(!overlayWindow) {
        overlayWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        overlayWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        overlayWindow.backgroundColor = [UIColor clearColor];
        overlayWindow.userInteractionEnabled = NO;
        overlayWindow.windowLevel = UIWindowLevelStatusBar;
    }
    return overlayWindow;
}

- (UIView *)topBar {
    if(!topBar) {
        topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, overlayWindow.frame.size.width, 20.0)];
        [overlayWindow addSubview:topBar];
    }
    return topBar;
}

- (UILabel *)stringLabel {
    if (stringLabel == nil) {
        stringLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		stringLabel.textColor = [UIColor colorWithRed:191.0/255.0 green:191.0/255.0 blue:191.0/255.0 alpha:1.0];
		stringLabel.backgroundColor = [UIColor clearColor];
		stringLabel.adjustsFontSizeToFitWidth = YES;
#if __IPHONE_OS_VERSION_MIN_REQUIRED < 60000
        stringLabel.textAlignment = UITextAlignmentCenter;
#else
        stringLabel.textAlignment = NSTextAlignmentCenter;
#endif
		stringLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
		stringLabel.font = [UIFont boldSystemFontOfSize:14.0];
		stringLabel.shadowColor = [UIColor blackColor];
		stringLabel.shadowOffset = CGSizeMake(0, -1);
        stringLabel.numberOfLines = 0;
    }
    
    if(!stringLabel.superview)
        [self.topBar addSubview:stringLabel];
    
    return stringLabel;
}

@end
