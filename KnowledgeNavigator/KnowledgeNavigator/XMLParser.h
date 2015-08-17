//
//  XMLParser.h
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/08.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject <NSXMLParserDelegate>
-(void)ParseMenu;
-(void)ParseContents;
@end
