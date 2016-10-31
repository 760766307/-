//
//  JJChaxunJieguoController.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/25.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JJBaoxiuXiangqingController.h"

#import "JJChaxunJieguoCell.h"

@interface JJChaxunJieguoController : UIViewController

@property (nonatomic,strong)NSArray *dataArray;
- (instancetype)initWithGuzhangLiebiaoArray:(NSArray *)array;

@end
