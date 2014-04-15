//
//  CLInterface.m
//  coastline2
//
//  Created by wangyuanou on 14-1-23.
//  Copyright (c) 2014年 mixbus. All rights reserved.
//

#import "CLInterface.h"
#import "AFNetworking.h"
#import "Define.h"
#import "UIApplication+Extra.h"

@implementation CLInterface {
    AFHTTPSessionManager* _sessionManager;
    NSDictionary* _defaultParameters;
}

+(CLInterface*) shareInstance {
    SINGLETON_INSTANCE;
}

-(CLInterface*) init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration* configure = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configure];
		_sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _defaultParameters = [[NSMutableDictionary alloc] init];
        NSDictionary* dictionary = [[NSBundle mainBundle] infoDictionary];
        for (NSString* key in dictionary.allKeys) {
            if ([key hasPrefix:DEFAULT_KEY_FIX]) {
                NSString* parameterKey = [key substringFromIndex:[DEFAULT_KEY_FIX length]];
                NSString* parameterValue = [dictionary valueForKey:key];
                [_defaultParameters setValue:parameterValue forKey:parameterKey];
            }
        }
    }
    return self;
}

-(void) authWithUser:(NSString*)username password:(NSString*)password {
	[_sessionManager.requestSerializer clearAuthorizationHeader];
	[_sessionManager.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:password];
}

-(NSString*) post:(NSString*)app parameters:(NSDictionary*)parameters_ {
    NSMutableDictionary* parameters = [parameters_ mutableCopy];
    [parameters addEntriesFromDictionary:_defaultParameters];
    NSString* url = [_baseURL stringByAppendingPathComponent:app];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSString* mixParameters = [self parametersFromDictionary:parameters];
    NSData* data = [mixParameters dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    
    NSURLResponse* response = nil;
    NSData* received = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:nil];
    if (received) {
		NSString* response = [[NSString alloc] initWithData:received
                                                   encoding:NSUTF8StringEncoding];
		return response;
	} else {
		NSLog(@"ERROR: sync post error");
		return nil;
	}
}

-(NSString*) get:(NSString*)app parameters:(NSDictionary*)parameters_ {
    NSMutableDictionary* parameters = [parameters_ mutableCopy];
    [parameters addEntriesFromDictionary:_defaultParameters];
    NSString* url = [_baseURL stringByAppendingPathComponent:app];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSString* mixParameters = [self parametersFromDictionary:parameters];
    NSData* data = [mixParameters dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPMethod:@"GET"];
    [request setHTTPBody:data];
    
    NSURLResponse* response = nil;
    NSData* received = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:&response
                                                         error:nil];
    if (received) {
		NSString* response = [[NSString alloc] initWithData:received
                                                   encoding:NSUTF8StringEncoding];
		return response;
	} else {
		NSLog(@"ERROR: sync get error");
		return nil;
	}
}

-(void) asyncPost:(NSString*)app parameters:(NSDictionary*)parameters_ response:(InterfaceResponse)response {
    NSMutableDictionary* parameters = [parameters_ mutableCopy];
    [parameters addEntriesFromDictionary:_defaultParameters];
    NSString* url = [_baseURL stringByAppendingPathComponent:app];
    NSURLSessionDataTask* task = [_sessionManager POST:url
                                            parameters:parameters
                                               success:^(NSURLSessionDataTask *task, id responseObject) {
                                                   if (response) {
                                                       response(responseObject, nil);
                                                   }
                                               } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                   if (response) {
                                                       response(nil, error);
                                                   }
                                               }];
    [task resume];
}

-(void) asyncGet:(NSString*)app parameters:(NSDictionary*)parameters_ response:(InterfaceResponse)response {
    NSMutableDictionary* parameters = [parameters_ mutableCopy];
    [parameters addEntriesFromDictionary:_defaultParameters];
    NSString* url = [_baseURL stringByAppendingPathComponent:app];
    NSURLSessionDataTask* task = [_sessionManager GET:url
                                           parameters:parameters
                                              success:^(NSURLSessionDataTask *task, id responseObject) {
                                                  NSLog(@"response : %@", responseObject);
                                                  if (response) {
                                                      response(responseObject, nil);
                                                  }
                                              } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                  if (response) {
                                                      response(nil, error);
                                                  }
                                              }];
    [task resume];
}

-(NSProgress*) dowload:(NSString*)url toFile:(NSString*)path {
    NSProgress* progress = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionDownloadTask* task = [_sessionManager downloadTaskWithRequest:request
                                                                     progress:&progress
                                                                  destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                                                                      return [NSURL URLWithString:path];
                                                                  } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                                                                      //
                                                                  }];
    [task resume];
    
    return progress;
}

-(NSProgress*) upload:(NSString*)url fromFile:(NSString*)path {
    NSProgress* progress = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionUploadTask* task = [_sessionManager uploadTaskWithRequest:request
                                                                 fromFile:[NSURL URLWithString:path]
                                                                 progress:&progress
                                                        completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                                            //
                                                        }];
    [task resume];
    
    return progress;
}

-(NSString*) parametersFromDictionary:(NSDictionary*)dictionary {
    NSArray* keys = [dictionary allKeys];
	NSString* mixParameters = @"";
	for (NSString* key in keys) {
		if (![key isKindOfClass:[NSString class]]) {
			NSLog(@"ERROR: dictionary not for parameters key");
			return nil;
		}
		
		NSString* value = dictionary[key];
		if (![value isKindOfClass:[NSString class]]) {
			NSLog(@"ERROR: dictionary not for parameters value");
			return nil;
		}
		
		if (mixParameters.length == 0) {
			mixParameters = [NSString stringWithFormat:@"%@=%@", key, value];
		} else {
			mixParameters = [NSString stringWithFormat:@"%@&%@=%@", mixParameters, key, value];
		}
	}
	
	return mixParameters;
}

@end
