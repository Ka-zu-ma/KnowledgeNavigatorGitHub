//
//  TitleLabel.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/06/29.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "TitleLabel.h"

@implementation TitleLabel
+(UILabel *)createTitleLabel:titleLabelName{
    
    //UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectZero];//(0,0)で大きさ、長さが0
    UILabel *titleLabel=[[UILabel alloc]init];
    titleLabel.textColor=[UIColor blackColor];
    titleLabel.text=titleLabelName;
    titleLabel.font=[UIFont fontWithName:@"Gujarati Sangam MN" size:15];
    [titleLabel sizeToFit];
    return titleLabel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
