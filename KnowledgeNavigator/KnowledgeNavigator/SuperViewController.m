//
//  SuperViewController.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/13.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(UIBarButtonItem *)createLeftBarButtonItem{
    
    UIBarButtonItem *homeButton=[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"home.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(tapToEYKnowledge)];
    
    return homeButton;
}*/

//子クラスでオーバーライド EYナレッジナビゲーターへの遷移
-(void)tapToEYKnowledge{
    
}


@end
