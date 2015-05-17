//
//  FutureServices.h
//  FutureFramework
//
//  Created by Josue Hernandez on 5/16/15.
//  Copyright (c) 2015 Josue Hernandez. All rights reserved.
//

#ifndef FutureFramework_FutureServices_h
#define FutureFramework_FutureServices_h


#endif

@interface FutureServices : NSObject

+(NSString *)getURL:(NSString *)name;
+(void)getWsUrl:(NSString *)pathWS sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure;

@end
