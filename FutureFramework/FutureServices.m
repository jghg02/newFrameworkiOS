//
//  FutureServices.m
//  FutureFramework
//
//  Created by Josue Hernandez on 5/16/15.
//  Copyright (c) 2015 Josue Hernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FutureServices.h"

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
    if (!temp) {
        
    }
    NSLog(@" %@ - %@", [temp objectForKey:@"URL_BASE"], [temp objectForKey:name]);
    
    return [NSString stringWithFormat:@"%@%@", [temp objectForKey:@"URL_BASE"], [temp objectForKey:name]];
}


@end