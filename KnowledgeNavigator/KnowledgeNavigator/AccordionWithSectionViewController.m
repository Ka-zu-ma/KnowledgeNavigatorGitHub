//
//  AccordionWithSectionTableViewController.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/09.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "AccordionWithSectionViewController.h"

@interface AccordionWithSectionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *accordionTableView;

@end

@implementation AccordionWithSectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _accordionTableView.delegate=self;
    _accordionTableView.dataSource=self;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

/*-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return cell;
}*/

@end
