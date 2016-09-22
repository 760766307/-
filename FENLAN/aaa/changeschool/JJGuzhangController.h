//
//  JJGuzhangController.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJGuzhangController : UIViewController





typedef void (^JJGuzhangBlock)(NSDictionary *guzhangDictionary);

@property (nonatomic,strong)JJGuzhangBlock block;


- (instancetype)initWithBlock:(JJGuzhangBlock)block;






@end
