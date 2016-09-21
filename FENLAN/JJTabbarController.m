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
    self.tabBar.tintColor = [UIColor colorWithRed:0.35f green:0.68f blue:0.72f alpha:1.00f];

    
    
    [self createViewControllers];
    
    
    
    
}
//dispatch_async(dispatch_get_global_queue(0, 0), ^{
//    // 处理耗时操作的代码块...
//    
//    //通知主线程刷新
//    dispatch_async(dispatch_get_main_queue(), ^{
//        //回调或者说是通知主线程刷新，
//    });
//});
- (void)createViewControllers{
    dispatch_async(dispatch_get_main_queue(), ^{
        _aaaController = [[AAARootController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
        }];
        _aaaNC = [[UINavigationController alloc] initWithRootViewController:_aaaController];
        _aaaController.title = @"消息";
        _aaaNC.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
        _aaaNC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_message_center_selected"];
        _aaaController.view.backgroundColor = BAISE;
        
        _bbbController = [[BBBRootController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
        }];
        _bbbNC = [[UINavigationController alloc] initWithRootViewController:_bbbController];
        _bbbController.title = @"通讯录";
        _bbbNC.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
        _bbbNC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_home_selected"];
        _bbbController.view.backgroundColor = BAISE;
        
        
        _cccController = [[CCCRootController alloc] initWithBlock:^(NSDictionary *dataDictionary) {
        }];
        _cccNC = [[UINavigationController alloc] initWithRootViewController:_cccController];
        _cccController.title = @"我的";
        _cccNC.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
        _cccNC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
        _cccController.view.backgroundColor = BAISE;
        self.viewControllers = @[_aaaNC,_bbbNC,_cccNC];
        //    self.viewControllers = @[aaaController,bbbController,cccController];
    });

}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
