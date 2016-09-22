//
//  JJChangeController.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJChangeController : UIViewController



typedef void (^JJChangeSchoolBlock)(NSDictionary *changeSchoolDictionary);

@property (nonatomic,strong)JJChangeSchoolBlock block;


- (instancetype)initWithBlock:(JJChangeSchoolBlock)block;


@end
