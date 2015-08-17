//
//  LoadingContainer.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/07.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "LoadingContainer.h"
#import "LoadingMark.h"
#import "LoadingLabel.h"
#import <QuartzCore/QuartzCore.h>

@implementation LoadingContainer

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(UIView *)createLoadingContainer{
    
    UIView *LoadingContainer=[[UIView alloc]init];
    
    [[LoadingContainer layer] setCornerRadius:8.0f];
    [[LoadingContainer layer] setMasksToBounds:YES];
    [[LoadingContainer layer] setBorderColor:[[UIColor blackColor]CGColor]];
    
    [[LoadingMark createLoadingMark] startAnimating];
    
    [LoadingContainer addSubview:[LoadingMark createLoadingMark]];
    [LoadingContainer addSubview:[LoadingLabel createLoadingLabel]];
    NSLog(@"通った");
    return LoadingContainer;
}

@end
