//
//  CLInterface.h
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEFAULT_KEY_FIX @"DefParam_"

typedef void(^InterfaceResponse)(id response, NSError* error);

@interface CLInterface : NSObject

@property(nonatomic, strong) NSString* baseURL;

+(CLInterface*) shareInstance;

-(void) authWithUser:(NSString*)username password:(NSString*)password;

-(NSString*) post:(NSString*)app parameters:(NSDictionary*)parameters;
-(NSString*) get:(NSString*)app parameters:(NSDictionary*)parameters;

-(void) asyncPost:(NSString*)app parameters:(NSDictionary*)parameters response:(InterfaceResponse)response;
-(void) asyncGet:(NSString*)app parameters:(NSDictionary*)parameters response:(InterfaceResponse)response;

-(NSProgress*) dowload:(NSString*)url toFile:(NSString*)path;
-(NSProgress*) upload:(NSString*)url fromFile:(NSString*)path;

-(NSString*) parametersFromDictionary:(NSDictionary*)dictionary;

@end
