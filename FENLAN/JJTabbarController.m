//
//  JJTabbarController.m
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "JJTabbarController.h"

@interface JJTabbarController ()

@end

@implementation JJTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];

    //    self.tabBar.barTintColor = [UIColor colorWithRed:0.83f green:0.89f blue:0.72f alpha:1.00f];
    self.tabBar.tintColor = [UIColor colorWithRed:0.35f green:0.68f blue:0.72f alpha:1.00f];

    
    
    [self createViewControllers];
    
    
    
    
}

- (void)createViewControllers{
    
    AAARootController *aaaController = [[AAARootController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
        
    }];
    UINavigationController *aaaNC = [[UINavigationController alloc] initWithRootViewController:aaaController];
    aaaController.title = @"消息";
    aaaNC.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
    aaaNC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_message_center_selected"];
    aaaController.view.backgroundColor = BAISE;
    
    //BBBRootBossController.h
    BBBRootController *bbbController = [[BBBRootController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
        
    }];
    UINavigationController *bbbNC = [[UINavigationController alloc] initWithRootViewController:bbbController];
    bbbController.title = @"通讯录";
    bbbNC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    bbbNC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected"];
    bbbController.view.backgroundColor = BAISE;
    
    
    
//    BBBRootBossController *bbbBossController = [[BBBRootBossController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
//    }];
//    UINavigationController *bbbBossNC = [[UINavigationController alloc] initWithRootViewController:bbbBossController];
//    bbbBossController.title = @"通讯录";
//    bbbBossNC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
//    bbbBossNC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected"];
//    bbbBossController.view.backgroundColor = BAISE;    
    
    
    CCCRootController *cccController = [[CCCRootController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
        
    }];
    UINavigationController *cccNC = [[UINavigationController alloc] initWithRootViewController:cccController];
    cccController.title = @"我的";
    cccNC.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
    cccNC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
    cccController.view.backgroundColor = BAISE;

    self.viewControllers = @[aaaNC,bbbNC,cccNC];


}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
