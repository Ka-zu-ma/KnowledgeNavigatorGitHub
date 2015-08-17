//
//  DatabaseOfMetadata.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/01.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "DAOOfMenu.h"
#import "CommonMethodOfDatabase.h"
#import "MenuItem.h"

@implementation DAOOfMenu

+(void)createMenuTable{
    
    FMDatabase *db=[CommonMethodOfDatabase getDatabaseFile];
    [db open];
    [db executeUpdate:@"CREATE TABLE IF NOT EXISTS menutable (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, category TEXT, pubDate TEXT, image TEXT ,format TEXT, tabNo TEXT, selectedImage TEXT, description TEXT, sortOrder TEXT);"];
    [db close];

}

+(void)insertMenuTable:(NSString *)title category:(NSString *)category pubDate:(NSString *)pubDate image:(NSString *)image format:(NSString *)format tabNo:(NSString *)tabNo selectedImage:(NSString *)selectedImage description:(NSString *)description sortOrder:(NSString *)sortOrder{
    
    FMDatabase *db=[CommonMethodOfDatabase getDatabaseFile];
    [db open];
    
    [db beginTransaction];
    
    BOOL isSucceeded = YES;
    
    if(![db executeUpdate:@"INSERT INTO menutable (title,category,pubDate,image,format,tabNo, selectedImage,description,sortOrder) VALUES  (?, ?, ?, ?, ?, ?, ?, ?, ?);",title,category,pubDate,image,format,tabNo,selectedImage,description,sortOrder]){
        
        isSucceeded = NO;
    }
    
    if (isSucceeded) {
        
        [db commit];
    }else{
        
        [db rollback];
    }
    
    [db close];
    
    
}

+(NSMutableArray *)selectFromMenuTable:(NSMutableArray *)array sql:(NSString *)sql {
    
    FMDatabase *db=[CommonMethodOfDatabase getDatabaseFile];
    [db open];
    
    [db beginTransaction];
    
    BOOL isSucceeded = YES;

    FMResultSet *results = [db executeQuery:sql];
    while ([results next]) {
        
        MenuItem *menuItem = [[MenuItem alloc] init];
        menuItem.title = [results stringForColumn:@"title"];
        menuItem.category = [results stringForColumn:@"category"];
        menuItem.pubDate = [results stringForColumn:@"pubDate"];
        menuItem.image = [results stringForColumn:@"image"];
        menuItem.format = [results stringForColumn:@"format"];
        menuItem.tabNo = [results stringForColumn:@"tabNo"];
        menuItem.selectedImage = [results stringForColumn:@"selectedImage"];
        menuItem.desCription = [results stringForColumn:@"description"];
        menuItem.sortOrder = [results stringForColumn:@"sortOrder"];
        
        [array addObject:menuItem];
    }
    if (isSucceeded) {
        [db commit];
    }else{
        [db rollback];
    }

    [db close];
    //引数に入れた配列を戻り値で返している
    return array;
}

+(NSString *)selectTopImageFromMenuTable:(NSString *)topImageName{
    
   NSString *topImageString;
    
    FMDatabase *db=[CommonMethodOfDatabase getDatabaseFile];
    [db open];
    
    [db beginTransaction];
    
    BOOL isSucceeded = YES;
    
    FMResultSet *results=[db executeQuery:@"SELECT image FROM menutable WHERE title = ?;",topImageName];
    
    while ([results next]) {
        
        topImageString=[results stringForColumn:@"image"];
    }
    
    if (isSucceeded) {
        [db commit];
    }else{
        [db rollback];
    }
    
    [db close];
    
    return topImageString;
}

@end
