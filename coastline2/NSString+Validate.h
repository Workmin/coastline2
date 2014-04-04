//
//  NSString+Validate.h
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validate)

-(BOOL) isMobileNumber;
-(BOOL) isEmailString;

-(BOOL) isWordGap;
-(BOOL) isWhiteSpace;

@end
