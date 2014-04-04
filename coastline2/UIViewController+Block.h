//
//  UIViewController+Block.h
//  coastline2
//
//  Created by wangyuanou on 14-2-7.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Block)

-(void)receiveObject:(void(^)(id object))sendObject;
-(void)sendObject:(id)object;

-(void)receiveObject:(void(^)(id object))sendObject withIdentifier:(NSString *)identifier;
-(void)sendObject:(id)object withIdentifier:(NSString *)identifier;

@end
