//
//  EYKnowledgeNavigatorViewController.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/06/29.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "TopViewController.h"
#import "TitleLabel.h"
#import "Directory.h"
#import "MenuTableViewController.h"
#import "EYKnowledgeCell.h"
#import "DAOOfMenu.h"
#import "LoadingContainer.h"
#import "WebPageViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TopViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *eyKnowledgeTableView;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (strong,nonatomic) NSMutableArray *temporaryData; //一時的に貯めておく用のデータ

@property (strong,nonatomic) NSString *titleString;
@property (strong,nonatomic) NSString *categoryString;
@property (strong,nonatomic) NSString *pubDateString;
@property (strong,nonatomic) NSString *imageString;

@property BOOL titleTarget;
@property BOOL categoryTarget;
@property BOOL pubDateTarget;
@property BOOL imageTarget;

@end

@implementation TopViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*NSArray *viewControllers=@[[[UINavigationController alloc]initWithRootViewController:[[FormatOneViewController alloc]init]],[[UINavigationController alloc]initWithRootViewController:[[PublicationViewController alloc]init]],[[UINavigationController alloc]initWithRootViewController:[[InformationSensorViewController alloc]init]],[[UINavigationController alloc]initWithRootViewController:[[ViewPointViewController alloc]init]],[[UINavigationController alloc]initWithRootViewController:[[MenuViewController alloc]init]]];
    
    UITabBarController *tabBarController=[[UITabBarController alloc]init];
    [tabBarController setViewControllers:viewControllers animated:NO];*/

    _eyKnowledgeTableView.delegate=self;
    _eyKnowledgeTableView.dataSource=self;
    
    //あとでViewControllerから切り分ける
    //枠の用意
    /*UIView *loadingContainer=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 140, 110)];
    
    //ラベル用意
    UILabel *loadingLabel=[[UILabel alloc]init];
    loadingLabel.text=@"ロード中です。";
    loadingLabel.textColor=[UIColor whiteColor];
    loadingLabel.font=[UIFont boldSystemFontOfSize:13];
    CGRect frame=loadingLabel.frame;
    frame.size=CGSizeMake(110, 20);
    
    loadingLabel.center=CGPointMake(loadingLabel.frame.size.width/2,120);
    
    [loadingContainer addSubview:loadingLabel];
    
    
    
    UIActivityIndicatorView *loadingMark=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    loadingMark.frame=CGRectMake(loadingContainer.frame.size.width/2,5,100,100);
    
    [loadingContainer addSubview:loadingMark];
    
    loadingContainer.backgroundColor=[UIColor darkGrayColor];
    
    [[loadingContainer layer] setCornerRadius:8.0f];
    [[loadingContainer layer] setMasksToBounds:YES];
    [[loadingContainer layer] setBorderColor:[[UIColor blackColor]CGColor]];
    
    CGRect rect=self.view.frame;
    loadingContainer.center=CGPointMake(rect.size.width/2, rect.size.height/2);
    
    [self.view addSubview:loadingContainer];
    //loadingContainer.hidden=YES;
    
    [loadingMark startAnimating];*/

    
    
    /*[LoadingContainer createLoadingContainer].frame=CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2, 200, 200);
    [self.view addSubview:[LoadingContainer createLoadingContainer]];*/
    
    
    _pageControl.numberOfPages=3;
    _pageControl.currentPageIndicatorTintColor=[UIColor yellowColor];
    _pageControl.pageIndicatorTintColor=[UIColor grayColor];

    self.navigationItem.titleView=[TitleLabel createTitleLabel:@"EYナレッジナビゲーター"];
    [self.navigationItem setHidesBackButton:YES];
    
    [self.eyKnowledgeTableView registerNib:[UINib nibWithNibName:@"EYKnowledgeCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    _topImageView.animationImages=@[[UIImage imageWithData:[Directory getData:@"TOP画面表示用画像" fileNameString:@"TOP画像1"]],[UIImage imageWithData:[Directory getData:@"TOP画面表示用画像" fileNameString:@"TOP画像2"]],[UIImage imageWithData:[Directory getData:@"TOP画面表示用画像" fileNameString:@"TOP画像3"]]];
    
    _topImageView.animationDuration=9.0f;
    _pageControl.currentPage=2;//2にすると左端からcurrentpageが始まる
   
    [_topImageView startAnimating];
    
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(moveCurrentPage) userInfo:nil repeats:YES];
    
    [timer fire];
    
    
    //_topImageView.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[DatabaseOfMenu selectTopImageFromMenuTable:@"Top画像1"]]]];//これだとシングルスレッドで読み込むので、その間他の処理が止まり固まったように見えてしまう
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSTimer Method

-(void)moveCurrentPage{
    
    if (_pageControl.currentPage==0) {
        
        _pageControl.currentPage=1;
       
        return;
    }
    
    if (_pageControl.currentPage==1) {
        
        _pageControl.currentPage=2;
        
        return;
    }
    
    if (_pageControl.currentPage==2) {
        
        _pageControl.currentPage=0;
        
        return;
    }
}


#pragma mark - TableView Datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EYKnowledgeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UITableViewHeaderFooterView *tableHeaderView=[[UITableViewHeaderFooterView alloc]init];
    tableHeaderView.contentView.frame=CGRectMake(0, 0, [[UIScreen mainScreen]applicationFrame].size.width, 44);
    tableHeaderView.backgroundColor=[UIColor lightGrayColor];
    
    UIView *lightGrayView=[[UIView alloc]init];
    lightGrayView.frame=CGRectMake(10, 0, [[UIScreen mainScreen]applicationFrame].size.width - 10, 44);
    lightGrayView.backgroundColor=[UIColor lightGrayColor];
    [tableHeaderView.contentView addSubview:lightGrayView];
    
    UILabel *label=[[UILabel alloc]init];
    label.text=@"New";
    label.textColor=[UIColor whiteColor];
    label.frame=CGRectMake(10, 0, [[UIScreen mainScreen]applicationFrame].size.width - 10, 44);
    [lightGrayView addSubview:label];
    
    UIView *yellowView=[[UIView alloc]init];
    yellowView.frame=CGRectMake(0, 0, 10, 44);
    yellowView.backgroundColor=[UIColor yellowColor];
    [tableHeaderView.contentView addSubview:yellowView];
    
    return tableHeaderView;
}

#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    WebPageViewController *viewController=[[WebPageViewController alloc]init];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

@end
