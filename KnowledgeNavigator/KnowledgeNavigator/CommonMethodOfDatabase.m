//
//  CommonMethodOfDatabase.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/01.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "CommonMethodOfDatabase.h"


@implementation CommonMethodOfDatabase
+(FMDatabase *)getDatabaseFile{
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbPathString=paths[0];
    FMDatabase *db=[FMDatabase databaseWithPath:[dbPathString stringByAppendingPathComponent:@"KnowledgeNavigator.db"]];
    
    NSLog(@"DBファイルの場所:%@",[dbPathString stringByAppendingPathComponent:@"KnowledgeNavigator.db"]);
    return db;
}

@end
