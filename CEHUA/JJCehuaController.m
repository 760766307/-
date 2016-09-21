//
//  JJCehuaController.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/21.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJCehuaController.h"

@interface JJCehuaController ()

@end

@implementation JJCehuaController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主界面";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame = CGRectMake(0, 0, 20, 18);
    [menuBtn setBackgroundImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
    [menuBtn addTarget:self action:@selector(openOrCloseLeftList) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuBtn];
}

- (void) openOrCloseLeftList
{
//    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([JJExtern sharedJJ].LeftSlideVC.closed){
        [[JJExtern sharedJJ].LeftSlideVC openLeftView];
    }else{
        [[JJExtern sharedJJ].LeftSlideVC closeLeftView];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
//    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[JJExtern sharedJJ].LeftSlideVC setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
//    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[JJExtern sharedJJ].LeftSlideVC setPanEnabled:YES];
}

@end




