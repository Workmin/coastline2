//
//  UIViewController+Screen.h
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Screen)

-(UIImage*) screenImage;
-(UIImage*) screenImageFast;

-(float) left;
-(float) right;
-(float) top;
-(float) bottom;
-(float) height;
-(float) width;

@end
