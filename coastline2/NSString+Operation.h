//
//  NSString+Operation.h
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Operation)

-(NSString*) trimString;

-(NSArray*) divideStringByFirstString:(NSString*)gap;
-(NSArray*) divideStringByLastString:(NSString*)gap;

@end
