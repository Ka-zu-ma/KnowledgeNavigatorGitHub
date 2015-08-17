//
//  TableViewController.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/09.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "WebPageViewController.h"

@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"tableViewCell"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    
    return cell;
    
}

#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];//選択状態解除
    
    WebPageViewController *viewController=[[WebPageViewController alloc]init];
    
    //viewController.urlString=
    
    [self.navigationController pushViewController:viewController animated:YES];
}



@end
