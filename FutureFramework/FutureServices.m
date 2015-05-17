//
//  FutureServices.m
//  FutureFramework
//
//  Created by Josue Hernandez on 5/16/15.
//  Copyright (c) 2015 Josue Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FutureServices.h"

#import "AFHTTPRequestOperationManager.h"
#import <CommonCrypto/CommonDigest.h>

#define MAX_ATTEMPTS 4

@implementation FutureServices{
}

#pragma Metodo que me permite leer todas las URL que estan almacenadas en httpWebServices.plist
//Importante -> Es necesario que el archivo .plist que se creee debe estar en el proyecto no en el FrameWork
+(NSString *)getURL:(NSString *)name{
    
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"httpWebServices"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"httpWebServices" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    
    NSError *err;
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListWithData:plistXML options:NSPropertyListMutableContainersAndLeaves format:&format
                                          error:&err];

    NSLog(@" %@ - %@", [temp objectForKey:@"URL_BASE"], [temp objectForKey:name]);
    
    return [NSString stringWithFormat:@"%@%@", [temp objectForKey:@"URL_BASE"], [temp objectForKey:name]];
}



+ (void)getWsUrl:(NSString *)pathWS sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure{
    
    [FutureServices getWsUrl:pathWS sucess:completion failure:failure withTryCount:0];
}

+ (NSString *)convertIntoMD5:(NSString *) string{
    const char *cStr = [string UTF8String];
    unsigned char digest[16];
    
    CC_MD5( cStr, (int)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *resultString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [resultString appendFormat:@"%02x", digest[i]];
    return  resultString;
}


+ (void)getWsUrl:(NSString *)pathWS sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure withTryCount:(NSInteger)tries{
    
    NSString *url = [FutureServices getURL:pathWS];
    
    __block NSInteger attempts = tries;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:url parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             completion(responseObject);
             
             //NSString *hashStr = [self convertIntoMD5:[operation.request.URL description]];
             NSArray *paths = NSSearchPathForDirectoriesInDomains
             (NSDocumentDirectory, NSUserDomainMask, YES);
             NSString *documentsDirectory = [paths objectAtIndex:0];
             
             
             
             
             if([pathWS isEqualToString:@"login"]){
                 
                 NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                       documentsDirectory,pathWS];
                 NSError *jsonError = nil;
                 
                 NSData *TheData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                                   options:0
                                                                     error:&jsonError];
                 
                 
                 
                 if (!jsonError)
                 {
                     
                     
                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];
                     
                     if (![[NSFileManager defaultManager] createFileAtPath:fileName
                                                                  contents:TheData
                                                                attributes:nil])
                     {
                         NSLog(@"Error was code: %d - message: %s", errno, strerror(errno));
                     }
                 }
                 else {
                     [[NSFileManager defaultManager] createFileAtPath:fileName
                                                             contents:TheData
                                                           attributes:nil];
                 }
                 
             }
             
             
             
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             attempts++;
             
             
             if([pathWS isEqualToString:@"login"]){
                 
                 if (attempts == MAX_ATTEMPTS) {
                     // NSString *hashStr = [self convertIntoMD5:[operation.request.URL description]];
                     
                     NSArray *paths = NSSearchPathForDirectoriesInDomains
                     (NSDocumentDirectory, NSUserDomainMask, YES);
                     NSString *documentsDirectory = [paths objectAtIndex:0];
                     
                     //make a file name to write the data to using the documents directory:
                     NSString *fileName = [NSString stringWithFormat:@"%@/%@.json",
                                           documentsDirectory,pathWS];
                     
                     NSError *errorr =nil;
                     
                     NSString *jsonFilePath =fileName;
                     
                     NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath options:kNilOptions error:&errorr];
                     
                     if (!errorr) {
                         id responseObject =[NSJSONSerialization JSONObjectWithData:jsonData
                                                                            options: NSJSONReadingMutableContainers
                                                                              error: &errorr];
                         if (!errorr) {
                             completion(responseObject);
                         } else {
                             failure(error);
                         }
                         
                     } else {
                         failure(error);
                     }
                     
                     failure(error);
                 } else {
                     NSLog(@"Here we go again!!");
                     [FutureServices getWsUrl:pathWS sucess:completion failure:failure withTryCount:attempts];
                 }
             }else{
                 
                
             }
         }];
}


@end