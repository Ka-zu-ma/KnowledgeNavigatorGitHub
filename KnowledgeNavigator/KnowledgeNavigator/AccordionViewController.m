//
//  AccordionTableViewController.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/09.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "AccordionViewController.h"
#import "TableViewCell.h"
#import "WebPageViewController.h"

@interface AccordionViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *accordionTableView;
@property (strong,nonatomic) NSMutableArray *headerStateArray;
@property (strong,nonatomic) NSMutableArray *childItemArray;

@end

@implementation AccordionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _accordionTableView.delegate=self;
    _accordionTableView.dataSource=self;
    
    _headerStateArray=[[NSMutableArray alloc]init];
    
    
    UINib *nib=[UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.accordionTableView registerNib:nib forCellReuseIdentifier:@"tableViewCell"];
    
    /*for (int i=0; i < self.menuItemArray.count; i++) {
        
        [_headerStateArray addObject:@"NO"];//YES:展開されている、NO:しまわれている
    }*/
    
    for (int i=0; i < 10; i++) {
        
        [_headerStateArray addObject:@"NO"];//YES:展開されている、NO:しまわれている
    }
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    //return self.menuItemArray.count;
    return 10;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([_headerStateArray[section] isEqualToString:@"YES"]) {
        
        //return _childItemArray.count;
        return 3;
        
    }else{
        return 0;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 64.0f;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    
    //cell.textLabel.text=
    
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UITableViewHeaderFooterView *headerView=[[UITableViewHeaderFooterView alloc]init];
    headerView.contentView.frame=CGRectMake(0, 0, [[UIScreen mainScreen]applicationFrame].size.width, 43.5);
    headerView.contentView.backgroundColor=[UIColor clearColor];
    
    UIView *yellowView=[[UIView alloc]init];
    yellowView.frame=CGRectMake(0, 0, 10, 43.5);
    yellowView.backgroundColor=[UIColor yellowColor];
    [headerView addSubview:yellowView];
    
    UIView *lightgrayView=[[UIView alloc]init];
    lightgrayView.backgroundColor=[UIColor lightGrayColor];
    lightgrayView.frame=CGRectMake(10, 0, [[UIScreen mainScreen]applicationFrame].size.width - 10, 43.5);
    
    UILabel *label=[[UILabel alloc]init];
    label.textColor=[UIColor whiteColor];
    label.frame=CGRectMake(10, 0, [[UIScreen mainScreen]applicationFrame].size.width - 10, 43.5);
    [lightgrayView addSubview:label];
    
    [headerView.contentView addSubview:lightgrayView];
    
    headerView.userInteractionEnabled=YES;
    
    
    UITapGestureRecognizer *tapGestureRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSection:)];
    
    [headerView addGestureRecognizer:tapGestureRecognizer];
    
    return headerView;
}

-(void)tapSection:(UITapGestureRecognizer *)sender{
    
    NSIndexPath *indexPath = [self.accordionTableView indexPathForRowAtPoint:[sender locationInView:self.accordionTableView]];
    
    NSLog(@"%ld",(long)indexPath.section);
    
    [self.accordionTableView beginUpdates];
    
    //sectionが展開されていればしまう、sectionがしまわれていれば展開する
    if ([_headerStateArray[indexPath.section] isEqual:@"YES"]) {
            
        _headerStateArray[indexPath.section]=@"NO";
        
    }else{
        
        _headerStateArray[indexPath.section]=@"YES";
    }
    
    [self.accordionTableView endUpdates];
    
    
    
}

#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.accordionTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    WebPageViewController *viewController=[[WebPageViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

/*-(void)expandItemAtSection:(int)section{
    
    //section中身展開
    
    NSMutableArray *indexPaths=[[NSMutableArray alloc]init];
    
    for (int i=0; i<[_childItemArray[section] count]; i++) {
        
        
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:1]];
    }
    
    [self.accordionTableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}

-(void)collapseSubItemsAtSection:(int)section{
    
    //section中身しまう
    
    NSMutableArray *indexPaths=[[NSMutableArray alloc]init];
    
    for (int i=0; [_childItemArray[section] count]; i++) {
        
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:1]];
    }
    
    [self.accordionTableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}*/

@end
