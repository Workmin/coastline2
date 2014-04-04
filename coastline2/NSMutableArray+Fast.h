//
//  NSMutableArray+Fast.h
//  coastline2
//
//  Created by wangyuanou on 14-1-28.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Fast)

//每个数组元素都是字典类型. 找到字典中某个key对应值相同的元素, 并且替换
-(void) replaceObjectWithSameId:(NSString*)idKey dictionary:(NSDictionary*)value;

@end
