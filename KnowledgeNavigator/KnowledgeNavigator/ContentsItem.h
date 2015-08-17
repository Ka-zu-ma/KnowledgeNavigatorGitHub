//
//  ContentsItem.h
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/14.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentsItem : NSObject

@property (strong,nonatomic) NSString *category;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *link;
@property (strong,nonatomic) NSString *desCription;
@property (strong,nonatomic) NSString *pubDate;
@property (strong,nonatomic) NSString *image;

@end
