//
//  DatabaseOfFree.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/01.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "DAOOfContents.h"
#import "CommonMethodOfDatabase.h"

@implementation DAOOfContents

+(void)createContentsTable{
    
    FMDatabase *db=[CommonMethodOfDatabase getDatabaseFile];
    [db open];
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS contentstable (id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, title TEXT, link TEXT, description TEXT, pubDate TEXT, image TEXT);"];
    [db close];
    
}

+(void)insertContentsTable:(NSString *)category title:(NSString *)title link:(NSString *)link description:(NSString *)description pubDate:(NSString *)pubDate image:(NSString *)image{
    
    FMDatabase *db=[CommonMethodOfDatabase getDatabaseFile];
    [db open];
    
    [db beginTransaction];
    
    BOOL isSucceeded = YES;
    
    if(![db executeUpdate:@"INSERT INTO contentstable (category,title,link,description,pubDate,image) VALUES  (?, ?, ?, ?, ?, ?);",category,title,link,description,pubDate,image]){
        
        isSucceeded = NO;
    }
    
    if (isSucceeded) {
        
        [db commit];
    }else{
        
        [db rollback];
    }
    
    [db close];
}



@end
