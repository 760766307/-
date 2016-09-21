//
//  BBBRootController.h
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBBCell.h"



@interface BBBRootController : UIViewController



typedef void (^JJBBBBlock)(NSDictionary *dataDictionary);






@property (nonatomic,strong)JJBBBBlock block;

- (instancetype)initWithBlock:(JJBBBBlock)block;

@end
