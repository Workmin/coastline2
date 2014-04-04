//
//  CLNumberParagraph.h
//  coastline2
//
//  Created by wangyuanou on 14-2-7.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CLNumberParagraph : NSObject

-(CLNumberParagraph*) init;

-(void) removeValueAtPoint:(float)point;

-(void) addNumber:(float)value atPoint:(float)point;
-(void) addColor:(UIColor*)value atPoint:(float)point;
-(void) addSize:(CGSize)value atPoint:(float)point;
-(void) addRect:(CGRect)value atPoint:(float)point;
-(void) addPoint:(CGPoint)value atPoint:(float)point;
-(void) addString:(NSString*)value atPoint:(float)point;

-(float) numberOfPoint:(float)point;
-(UIColor*) colorOfPoint:(float)point;
-(CGSize) sizeOfPoint:(float)point;
-(CGRect) rectOfPoint:(float)point;
-(CGPoint) pointOfPoint:(float)point;
-(NSString*) stringOfPoint:(float)point;

-(NSString*) description;

@end
