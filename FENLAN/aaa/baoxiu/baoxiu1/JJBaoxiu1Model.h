//
//  JJBaoxiu1Model.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JJBaoxiu1Model : NSObject

//客户信息
@property (nonatomic,copy)NSString *kehu;
@property (nonatomic,copy)NSString *kehuid;
@property (nonatomic,copy)NSString *kehutel;

//故障类型
@property (nonatomic,copy)NSString *guzhanglev;
@property (nonatomic,copy)NSString *guzhangPID;
@property (nonatomic,copy)NSString *guzhangID;
@property (nonatomic,copy)NSString *guzhangCode;
@property (nonatomic,copy)NSString *guzhangjbn;
@property (nonatomic,copy)NSString *guzhangName;
@property (nonatomic,copy)NSString *guzhangHasChild;
@property (nonatomic,copy)NSString *guzhangparent;
@property (nonatomic,copy)NSString *guzhangLeixing;
@property (nonatomic,copy)NSString *guzhangSection;
//section//

@property (nonatomic,copy)NSString *baoxiuRen;
@property (nonatomic,copy)NSString *baoxiuDianhua;
@property (nonatomic,copy)NSString *qiXian;
@property (nonatomic,copy)NSString *baoxiuNeirong;


@end







