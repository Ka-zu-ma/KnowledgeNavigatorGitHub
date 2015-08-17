//
//  MenuItem.h
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/08.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *pubDate;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *format;
@property (strong, nonatomic) NSString *tabNo;
@property (strong, nonatomic) NSString *selectedImage;
@property (strong, nonatomic) NSString *desCription;
@property (strong, nonatomic) NSString *sortOrder;

@end
