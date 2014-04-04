//
//  NSString+Convert.m
//  coastline2
//
//  Created by wangyuanou on 14-1-25.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "NSString+Convert.h"
#import <CommonCrypto/CommonDigest.h>
#import "GTMBase64.h"
#import "../SBJson/SBJSON.h"

@implementation NSString (Convert)

+(NSString*) stringWithColor:(UIColor*)color {
	CGFloat fred, fgreen, fblue, falpha;
	int red = 0, green=0, blue = 0, alpha = 0;
    if ([color getRed:&fred green:&fgreen blue:&fblue alpha:&falpha]) {
		red = fred*255;
		green = fgreen*255;
		blue = fblue*255;
		alpha = falpha*255;
	} else {
		CGFloat fwhite;
		[color getWhite:&fwhite alpha:&falpha];
		red = fwhite*255;
		green = red;
		blue = red;
		alpha = falpha*255;
	}
	NSString* resultString			= [NSString stringWithFormat:@"%02x%02x%02x%02x", red, green, blue, alpha];
	
	return resultString;
}

-(UIColor*) colorValue {
    CGFloat components[4]			= {0.0, 0.0, 0.0, 1.0};
	if ([self length] == 6) {
		NSRange redRange, greenRange, blueRange;
		redRange.location			= 0;
		redRange.length				= 2;
		greenRange.location			= 2;
		greenRange.length			= 2;
		blueRange.location			= 4;
		blueRange.length			= 2;
		
		NSString* redString			= [self substringWithRange:redRange];
		NSString* greenString		= [self substringWithRange:greenRange];
		NSString* blueString		= [self substringWithRange:blueRange];
		
		components[0]				= [redString intValueByHex]/255.0;
		components[1]				= [greenString intValueByHex]/255.0;
		components[2]				= [blueString intValueByHex]/255.0;
	} else if ([self length] == 8) {
		NSRange redRange, greenRange, blueRange, alphaRange;
		redRange.location			= 0;
		redRange.length				= 2;
		greenRange.location			= 2;
		greenRange.length			= 2;
		blueRange.location			= 4;
		blueRange.length			= 2;
		alphaRange.location			= 6;
		alphaRange.length			= 2;
		
		NSString* redString			= [self substringWithRange:redRange];
		NSString* greenString		= [self substringWithRange:greenRange];
		NSString* blueString		= [self substringWithRange:blueRange];
		NSString* alphaString		= [self substringWithRange:alphaRange];
		
		int redInt					= [redString intValueByHex];
		int greenInt				= [greenString intValueByHex];
		int blueInt					= [blueString intValueByHex];
		int alphaInt				= [alphaString intValueByHex];
		
		components[0]				= redInt/255.0;
		components[1]				= greenInt/255.0;
		components[2]				= blueInt/255.0;
		components[3]				= alphaInt/255.0;
	} else {
		return nil;
	}
	
	return [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:components[3]];
}

-(int) intValueByHex {
    static const unichar hexChar[]	= {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
	
	NSString* lowcaseString	= [self lowercaseString];
	int result				= 0;
	for (int i = 0; i < [lowcaseString length]; ++i) {
		result				*= 16;
		unichar pointChar	= [lowcaseString characterAtIndex:i];
		for (int j = 0; j < 16; ++j) {
			if (pointChar == hexChar[j]) {
				result		+= j;
				break;
			}
		}
	}
	
	return result;
}

-(NSString*) MD5Value {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

-(NSString*) SH1Value {
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

-(NSString*) MD5Base64Value {
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
    
    NSData * base64 = [[NSData alloc]initWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
    base64 = [GTMBase64 encodeData:base64];
    
    NSString * output = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
    return output;
}

-(NSString*) SH1Base64Value {
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSData * base64 = [[NSData alloc]initWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
    base64 = [GTMBase64 encodeData:base64];
    
    NSString * output = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
    return output;
}

-(NSString*) Base64Value {
    NSData * data = [self dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    data = [GTMBase64 encodeData:data];
    NSString * output = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return output;
}

+(NSString*) stringWithDate:(NSDate*)date format:(DateFormat)format {
    NSDateFormatter* formatter		= [[NSDateFormatter alloc] init];
    if (format == DATE_FORMATE_DATE) {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    } else if (format == DATE_FORMATE_TIME) {
        [formatter setDateFormat:@"HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
	[formatter setTimeZone:[NSTimeZone localTimeZone]];
	NSString* resultString			= [formatter stringFromDate:date];
	
	return resultString;
}

+(NSString*) stringWithDate:(NSDate*)date {
    return [NSString stringWithDate:date format:DATE_FORMATE_DATE];
}

-(NSDate*) dateValue {
    NSDateFormatter* formatter		= [[NSDateFormatter alloc] init];
    unsigned long length = [self length];
    if (length == 8) {
        [formatter setDateFormat:@"HH:mm:ss"];
    } else if (length == 10) {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    } else {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
	[formatter setTimeZone:[NSTimeZone localTimeZone]];
	NSDate* result					= [formatter dateFromString:self];
	
	return result;
}

+(NSString*) stringWithFont:(UIFont*)font {
    NSString* reference				= [NSString stringWithFormat:@"%@^%f",
									   font.fontName, font.pointSize];
	return reference;
}

-(UIFont*) fontValue {
    NSArray* partList				= [self componentsSeparatedByString:@"^"];
	if ([partList count] != 2) {
		return nil;
	}
	
	UIFont* font					= [UIFont fontWithName:[partList objectAtIndex:0]
									   size:[[partList objectAtIndex:1] intValue]];
	return font;
}

+(NSString*) stringWithJSON:(id)JSONObject {
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    return [writer stringWithObject:JSONObject];
}

-(id) JSONValue {
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    return [parser objectWithString:self];
}

+(NSString*) stringWithString:(NSString*)source count:(int)count {
    NSMutableString* result = [[NSMutableString alloc] init];
    for (int i = 0; i < count; ++i) {
        [result appendString:source];
    }
    
    return result;
}

@end
