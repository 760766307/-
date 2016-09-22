//
//  AAARootController.h
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAACoCell.h"
#import "AAAHeaderView.h"



@interface AAARootController : UIViewController



typedef void (^JJAAABlock)(NSDictionary *dataDictionary);






@property (nonatomic,strong)JJAAABlock block;





- (instancetype)initWithBlock:(JJAAABlock)block;


@end
