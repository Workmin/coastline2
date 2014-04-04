//
//  CLViewController.h
//  coastline2
//
//  Created by wangyuanou on 14-1-28.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLViewController : UIViewController

typedef void(^BackEvent)();

-(void) present:(UIViewController*)controller back:(BackEvent)event;
-(void) navigate:(UIViewController*)controller back:(BackEvent)event;

@end
