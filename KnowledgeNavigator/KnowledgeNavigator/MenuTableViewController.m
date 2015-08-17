//
//  MenuViewController.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/06/29.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "MenuTableViewController.h"
#import "TopViewController.h"
#import "TableViewCell.h"

@interface MenuTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;

@end

@implementation MenuTableViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _menuTableView.delegate=self;
    _menuTableView.dataSource=self;
    
    //self.navigationItem.titleView=[TitleLabel createTitleLabel:@"Menu"];
    self.title=@"Menu";
    
    //self.navigationItem.leftBarButtonItem=[super createLeftBarButtonItem];
    
    [self.menuTableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"tableViewCell"];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.tintColor = [UIColor yellowColor];
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapToKnowledge{
    
    TopViewController *viewController=[[TopViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

#pragma mark TableView Datasource;

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor darkGrayColor];
    cell.textLabel.textColor=[UIColor whiteColor];
    
    return cell;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UITableViewHeaderFooterView *headerView=[[UITableViewHeaderFooterView alloc]init];
    headerView.contentView.frame=CGRectMake(0, 44, [[UIScreen mainScreen]applicationFrame].size.width, 44);
    
    UIView *yellowView=[[UIView alloc]init];
    yellowView.backgroundColor=[UIColor yellowColor];
    yellowView.frame=CGRectMake(0, 0, 10, 44);
    [headerView.contentView addSubview:yellowView];
    
    UIView *lightgrayView=[[UIView alloc]init];
    lightgrayView.backgroundColor=[UIColor lightGrayColor];
    lightgrayView.frame=CGRectMake(10, 0, [[UIScreen mainScreen]applicationFrame].size.width - 10, 44);
    
    UILabel *label=[[UILabel alloc]init];
    label.tintColor=[UIColor whiteColor];
    label.frame=CGRectMake(10, 0, [[UIScreen mainScreen]applicationFrame].size.width - 10, 44);
    [lightgrayView addSubview:label];
    
    [headerView.contentView addSubview:lightgrayView];
    
    
    return headerView;
}

#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.menuTableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
