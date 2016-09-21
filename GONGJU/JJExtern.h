//
//  JJExtern.h
//  ZNW_YHB
//
//  Created by 杨剑 on 15/12/24.
//  Copyright © 2015年  apple. All rights reserved.
//http://learning.sohu.com/20160818/n464777063.shtml
//http://www.oschina.net/ios/codingList/413/ios-menu
#import <Foundation/Foundation.h>

//#import "LeftSlideViewController.h"
//#import "MainPageViewController.h"
#import "JJTabbarController.h"


//#import "JJCehuaController.h"
//#import "LeftSortsViewController.h"


#define SIZE [UIScreen mainScreen].bounds.size

#define BAISE [UIColor colorWithRed:0.98f green:0.97f blue:0.96f alpha:1.00f]

#import <UIKit/UIKit.h>



@interface JJExtern : NSObject


@property (nonatomic,strong)NSString *differentString;


@property (nonatomic,copy)NSString *serverURLString;//服务器的url




//@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
//@property (strong, nonatomic) UINavigationController *mainNavigationController;
@property (strong, nonatomic) JJTabbarController *tabbarController;


@property (nonatomic,copy)NSString *schoolid;//学校的id
@property (nonatomic,copy)NSString *schoolname;//学校的姓名
@property (nonatomic,copy)NSString *schoolURLString;//学校的url

@property (nonatomic,copy)NSString *username;//账号
@property (nonatomic,copy)NSString *userpassword;//密码
@property (nonatomic,copy)NSString *resultcode;//返回码（-1：无权登录；0：用户名或密码错；1：登录成功）
@property (nonatomic,copy)NSString *userid;//唯一标识
@property (nonatomic,copy)NSString *role;//角色
@property (nonatomic,copy)NSString *name;//姓名
@property (nonatomic,copy)NSString *nianji;//年级
@property (nonatomic,copy)NSString *banji;//班级
@property (nonatomic,copy)NSString *classid;//班级id


+ (JJExtern *)sharedJJ;
- (CGSize)boundingRectWithSize:(CGSize)size text:(NSString *)text font:(UIFont *)font;


@end












