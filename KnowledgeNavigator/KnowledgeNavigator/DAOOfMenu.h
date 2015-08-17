//
//  DatabaseOfMetadata.h
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/01.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DAOOfMenu : NSObject

+(void)insertMenuTable:(NSString *)title category:(NSString *)category pubDate:(NSString *)pubDate image:(NSString *)image format:(NSString *)format tabNo:(NSString *)tabNo selectedImage:(NSString *)selectedImage description:(NSString *)description sortOrder:(NSString *)sortOrder;
+(void)createMenuTable;
+(NSString *)selectTopImageFromMenuTable:(NSString *)topImageName;
+(NSMutableArray *)selectFromMenuTable:(NSMutableArray *)array sql:(NSString *)sql;
@end
