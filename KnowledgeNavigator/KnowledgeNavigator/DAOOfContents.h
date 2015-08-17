//
//  DatabaseOfFree.h
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/01.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAOOfContents : NSObject
+(void)createContentsTable;
+(void)insertContentsTable:(NSString *)category title:(NSString *)title link:(NSString *)link description:(NSString *)description pubDate:(NSString *)pubDate image:(NSString *)image;
@end
