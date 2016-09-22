//
//  JJTabbarController.m
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "JJTabbarController.h"

@interface JJTabbarController ()
{

    AAARootController *_aaaController;
    BBBRootController *_bbbController;
    CCCRootController *_cccController;

    UINavigationController *_aaaNC;
    UINavigationController *_bbbNC;
    UINavigationController *_cccNC;
    
}
@end

@implementation JJTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //    self.tabBar.barTintColor = [UIColor colorWithRed:0.83f green:0.89f blue:0.72f alpha:1.00f];
    
    
    self.tabBar.barTintColor = [UIColor colorWithRed:1.00f green:0.96f blue:0.80f alpha:1.00f];
    
    self.tabBar.tintColor = [UIColor colorWithRed:0.35f green:0.68f blue:0.72f alpha:1.00f];

    
    
    
    
    
    [self createViewControllers];
    
    
    
    
}
- (void)createViewControllers{
    _aaaController = [[AAARootController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
    }];
    _aaaController.title = @"首页";
    _aaaController.view.backgroundColor = BAISE;
    _aaaNC = [[UINavigationController alloc] initWithRootViewController:_aaaController];
    _aaaNC.tabBarItem.image = [UIImage imageNamed:@"icon_1_n"];
    _aaaNC.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_1_d"];
    _bbbController = [[BBBRootController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
    }];
    _bbbController.title = @"通知";
    _bbbController.view.backgroundColor = BAISE;
    _bbbNC = [[UINavigationController alloc] initWithRootViewController:_bbbController];
    _bbbNC.tabBarItem.image = [UIImage imageNamed:@"icon_2_n"];
    _bbbNC.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_2_d"];
    
    
    _cccController = [[CCCRootController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
    }];
    _cccController.title = @"设置";
    _cccController.view.backgroundColor = BAISE;
    _cccNC = [[UINavigationController alloc] initWithRootViewController:_cccController];
    _cccNC.tabBarItem.image = [UIImage imageNamed:@"icon_3_n"];
    _cccNC.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_3_d"];
    self.viewControllers = @[_aaaNC,_bbbNC,_cccNC];
    //    self.viewControllers = @[aaaController,bbbController,cccController];
}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
