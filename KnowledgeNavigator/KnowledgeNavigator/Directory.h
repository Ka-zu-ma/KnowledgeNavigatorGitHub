//
//  Directory.h
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/14.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Directory : NSObject

+(NSString *)getCachesDirectoryPath;
+(NSString *)createNewDirectoryPath:(NSString *)directoryName;
+(void)createNewDirectory:(NSString *)directoryName;
+(void)saveData:(NSString *)urlString directoryName:(NSString *)directoryName fileName:(NSString *)fileName;
+(NSData *)getData:(NSString *)directoryName fileNameString:(NSString *)fileNameString;

@end
