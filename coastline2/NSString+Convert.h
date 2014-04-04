//
//  NSString+Convert.h
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum _DateFormat {
    DATE_FORMATE_DATE,
    DATE_FORMATE_TIME,
    DATE_FORMATE_DATETIME
} DateFormat;

@interface NSString (Convert)

+(NSString*) stringWithColor:(UIColor*)color;
-(UIColor*) colorValue;

-(int) intValueByHex;

-(NSString*) MD5Value;
-(NSString*) SH1Value;
-(NSString*) MD5Base64Value;
-(NSString*) SH1Base64Value;
-(NSString*) Base64Value;

+(NSString*) stringWithDate:(NSDate*)date format:(DateFormat)format;
+(NSString*) stringWithDate:(NSDate*)date;

-(NSDate*) dateValue;

+(NSString*) stringWithFont:(UIFont*)font;
-(UIFont*) fontValue;

+(NSString*) stringWithJSON:(id)JSONObject;
-(id) JSONValue;

+(NSString*) stringWithString:(NSString*)source count:(int)count;

@end
