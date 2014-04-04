//
//  Define.h
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Define : NSObject

@end

#ifndef SINGLETON_INSTANCE
#define SINGLETON_INSTANCE static dispatch_once_t once;static id sharedInstance;dispatch_once(&once, ^{sharedInstance = [[self alloc] init];});return sharedInstance
#endif

#ifndef STR
#define STR NSString stringWithFormat
#endif

#ifndef EVENT
#define EVENT(Button, Selector) [Button addTarget:self action:@selector(Selector) forControlEvents:UIControlEventTouchUpInside]
#endif

#ifndef TAP
#define TAP(View, Selector) { UITapGestureRecognizer* tapGestureRecognizer=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Selector)]; [View addGestureRecognizer:tapGestureRecognizer]; }
#endif

#define ARC4RANDOM_MAX      0x100000000

CGRect _R(float x, float y, float w, float h);
CGPoint _P(float x, float y);
CGSize _S(float w, float h);
UIEdgeInsets _I(float left, float top, float right, float bottom);

CGRect _(float x, float y, float w, float h);

float randNumber(float max);

double angle(double v);

