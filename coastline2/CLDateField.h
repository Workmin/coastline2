//
//  CLDateField.h
//  coastline
//
//  Created by wangyuanou on 14-1-13.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CLDateFieldDelegate <NSObject>

-(BOOL) completeDateField:(NSString*)dateString;

@end

@interface CLDateField : UITextField<UITextFieldDelegate>

@property(nonatomic, strong) id<CLDateFieldDelegate> dateDelegate;

@end
