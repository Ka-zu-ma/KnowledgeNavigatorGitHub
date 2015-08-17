//
//  LaunchViewController.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/08.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "LaunchViewController.h"
#import "XMLParser.h"
#import "DAOOfMenu.h"
#import "MenuItem.h"
#import "MenuTableViewController.h"
#import "TopViewController.h"
#import "CreateFormatViewController.h"
#import "Directory.h"

@interface LaunchViewController ()

@property (strong,nonatomic) NSMutableArray *imageArray;
@property (strong,nonatomic) NSMutableArray *selectedImageArray;
//@property (strong,nonatomic) NSMutableArray *tableViewIconImageArray;

@property (strong,nonatomic) NSMutableArray *menuItemArray;

@property (strong,nonatomic) UITabBarController *tabBarController;
@property (strong,nonatomic) NSMutableArray *viewControllersInTabBarController;

@end

@implementation LaunchViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArray=[[NSMutableArray alloc]init];
    _selectedImageArray=[[NSMutableArray alloc]init];
    _menuItemArray=[[NSMutableArray alloc]init];
    
    //インジケーター作成
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    //現時点でのコードだとDBに同じデータが登録されてしまうためコメントアウト
    /*XMLParser *menuParser=[[XMLParser alloc]init];
    [menuParser ParseMenu];*/
    
    
    _imageArray=[DAOOfMenu selectFromMenuTable:_imageArray sql:@"SELECT title, category, pubDate, image, format, tabNo, selectedImage, description, sortOrder FROM menutable WHERE image IS NOT NULL;"];
    
    
    _selectedImageArray=[DAOOfMenu selectFromMenuTable:_selectedImageArray sql:@"SELECT title, category, pubDate, image, format, tabNo, selectedImage, description, sortOrder FROM menutable WHERE selectedImage IS NOT NULL;"];
    
    _menuItemArray=[DAOOfMenu selectFromMenuTable:_menuItemArray sql:@"SELECT title, category, pubDate, image, format, tabNo, selectedImage, description, sortOrder FROM menutable WHERE selectedImage IS NOT NULL;"];
    
    for (int i=0 ; i<_imageArray.count ;i++) {
        
        MenuItem *menuItem=_imageArray[i];
        
        if (i<3) {
            
            [Directory createNewDirectoryPath:@"TOP画面表示用画像"];
            [Directory createNewDirectory:@"TOP画面表示用画像"];
            [Directory saveData:menuItem.image directoryName:@"TOP画面表示用画像" fileName:[NSString stringWithFormat:@"TOP画像%d",i+1]];
        }else{
            
            [Directory createNewDirectoryPath:@"TabBarIconImage"];
            [Directory createNewDirectory:@"TabBarIconImage"];
        
            [Directory saveData:menuItem.image directoryName:@"TabBarIconImage" fileName:menuItem.title];
        }
    //[super createNewDirectoryAndSaveData:@"TOP画面表示用画像" url:menuItem.image fileName:[NSString stringWithFormat:@"TOP画像%d",i+1]];
        
    }
    /*for (int j=3; j<7; j++) {
        
        MenuItem *menuItem=_imageArray[j];
        
        [super createNewDirectoryPath:@"TabBarIconImage"];
        [super createNewDirectory:@"TabBarIconImage"];
        
        [super saveData:menuItem.image directoryName:@"TabBarIconImage" fileName:menuItem.title];
        
    }*/
    
    for (int i=0; i<_selectedImageArray.count; i++) {
        
        MenuItem *menuItem=_selectedImageArray[i];
        
        [Directory createNewDirectoryPath:@"TabBarIconSelectedImage"];
        [Directory createNewDirectory:@"TabBarIconSelectedImage"];
        
        [Directory saveData:menuItem.selectedImage directoryName:@"TabBarIconSelectedImage" fileName:menuItem.title];
    }
    
    
    /*XMLParser *contentsParser=[[XMLParser alloc]init];
    [contentsParser ParseContents];*/
    
    for (int i=0; i<_menuItemArray.count; i++) {
        
        MenuItem *menuItem=_menuItemArray[i];
        int tabNo=menuItem.tabNo.intValue;
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    MenuTableViewController *menuViewController=[[MenuTableViewController alloc]init];
    menuViewController.title=@"Menu";
    menuViewController.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"Menu" image:[UIImage imageNamed:@"menu.png"] selectedImage:[UIImage imageNamed:@"menu.png"]];
    
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:menuViewController];
    
    _viewControllersInTabBarController=[[NSMutableArray alloc]init];
    [_viewControllersInTabBarController addObject:navigationController];
    

    _tabBarController=[[UITabBarController alloc]init];
    


    
    _tabBarController.tabBar.barTintColor=[UIColor redColor];
    
    /*UINavigationController *onenaviController=[[UINavigationController alloc]initWithRootViewController:[CreateFormatViewController createFormatViewController:3]];
    UINavigationController *twonaviController=[[UINavigationController alloc]initWithRootViewController:[CreateFormatViewController createFormatViewController:5]];
    UINavigationController *threenaviController=[[UINavigationController alloc]initWithRootViewController:[CreateFormatViewController createFormatViewController:4]];
    UINavigationController *fournaviController=[[UINavigationController alloc]initWithRootViewController:[CreateFormatViewController createFormatViewController:1]];
    _viewControllersInTabBarController=@[onenaviController,twonaviController,threenaviController,fournaviController,navigationController];*/
    
    [_tabBarController setViewControllers:_viewControllersInTabBarController animated:NO];
    
    TopViewController *viewController=[[TopViewController alloc]init];
    [_viewControllersInTabBarController[0] pushViewController:viewController animated:NO];
    
    [self presentViewController:_tabBarController animated:NO completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*-(void)createViewControllersInTabBarController{
    
    
    
}*/


@end
