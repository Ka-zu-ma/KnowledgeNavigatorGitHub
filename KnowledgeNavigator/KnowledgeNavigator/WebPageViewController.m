//
//  WebPageViewController.m
//  KnowledgeNavigator
//
//  Created by SDT-B004 on 2015/07/08.
//  Copyright (c) 2015年 SDT-B004. All rights reserved.
//

#import "WebPageViewController.h"
#import "MBProgressHUD.h"

@interface WebPageViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
- (IBAction)pageBack:(id)sender;
- (IBAction)pageNext:(id)sender;
@property (strong,nonatomic) MBProgressHUD *hud;
@end

@implementation WebPageViewController

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate=self;
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[[NSURL alloc]initWithString:_urlString]]];
    
    //[self.webView loadRequest:[NSURLRequest requestWithURL:[[NSURL alloc]initWithString:@"https://www.google.co.jp/"]]];

    
    UIBarButtonItem *refreshButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"refresh.png"] style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    
    self.navigationItem.rightBarButtonItem=refreshButton;
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    _toolBar.hidden=YES;
    
    _hud=[[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:_hud];
    _hud.labelText=@"ロード中です。";
}

-(void)viewDidAppear:(BOOL)animated{
    
    [_hud hide:YES afterDelay:2.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refresh{
    
    _hud=[[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:_hud];
    _hud.labelText=@"ロード中です。";
    [_hud show:YES];
    
    
    [self.webView reload];
    
}

#pragma mark - WebView Delegate

//リンククリックしたとき
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        
        //ツールバー表示
        _toolBar.hidden=NO;
    }
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    if ([_webView canGoBack]) {
        
        _backButton.enabled=YES;
    }else{
        
        _backButton.enabled=NO;
    }
    
    if ([_webView canGoForward]){
        
        _nextButton.enabled=YES;
    }else{
        _nextButton.enabled=NO;
    }
}


- (IBAction)pageBack:(id)sender {
    
    [_webView goBack];
}

- (IBAction)pageNext:(id)sender {
    
    [_webView goForward];
}
@end

