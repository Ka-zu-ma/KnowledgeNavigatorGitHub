//
//  LoadingLabel.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/07.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "LoadingLabel.h"

@implementation LoadingLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+(UILabel *)createLoadingLabel{
    
    UILabel *loadingLabel=[[UILabel alloc]init];
    loadingLabel.text=@"ロード中です。";
    loadingLabel.textColor=[UIColor whiteColor];
    loadingLabel.font=[UIFont boldSystemFontOfSize:17];
    
    return loadingLabel;
}
@end
