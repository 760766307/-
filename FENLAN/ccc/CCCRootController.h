//
//  CCCRootController.h
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCCell.h"

#import "JJGerenxinxiController.h"
#import "JJGuanyuController.h"
#import "JJXiugaiMimaController.h"




@interface CCCRootController : UIViewController







typedef void (^JJCCCBlock)(NSDictionary *dataDictionary);






@property (nonatomic,strong)JJCCCBlock block;


- (instancetype)initWithBlock:(JJCCCBlock)block;


@end
