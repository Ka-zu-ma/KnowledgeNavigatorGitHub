//
//  loadingMark.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/07.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "LoadingMark.h"

@implementation LoadingMark

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(UIActivityIndicatorView *)createLoadingMark{
    
    UIActivityIndicatorView *loadingMark=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    loadingMark.color=[UIColor redColor];
    
    return loadingMark;
    
}
@end
