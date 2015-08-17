//
//  CreateFormatViewController.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/13.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "CreateFormatViewController.h"
#import "DateViewController.h"
#import "AccordionWithSectionViewController.h"
#import "AccordionViewController.h"
#import "SearchViewController.h"
#import "InformationViewController.h"
#import "TableViewController.h"


@implementation CreateFormatViewController

//使いまわしたいクラスのインスタンスを返す

+(SuperViewController *)createFormatViewController:(int)format{
    
    if (format == 1) {
        
        DateViewController *dateViewController=[[DateViewController alloc]init];
    
        return dateViewController;
    }
    if (format == 2) {
        
        AccordionViewController *acViewController=[[AccordionViewController alloc]init];
        
        return acViewController;
    }
    
    if (format == 3) {
        
        AccordionWithSectionViewController *acSectionViewController=[[AccordionWithSectionViewController alloc]init];
        
        return acSectionViewController;
    }
    if (format == 4) {
        
        InformationViewController *infoViewController=[[InformationViewController alloc]init];
        
        return infoViewController;
    }
    if (format == 5) {
        
        TableViewController *tableViewController=[[TableViewController alloc]init];
        
        return tableViewController;
    }
    if (format == 6) {
        
        SearchViewController *searchViewController=[[SearchViewController alloc]init];
        
        return searchViewController;
    }
    
    SuperViewController *superViewController=[[SuperViewController alloc]init];
    return superViewController;
}
@end
