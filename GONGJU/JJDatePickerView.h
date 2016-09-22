//
//  JJDatePickerView.h
//  请假APP
//
//  Created by 杨剑 on 16/9/9.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJDatePickerView : UIButton


typedef void (^JJDatePickerBlock)(NSDictionary *dictionary);


@property (nonatomic,strong)JJDatePickerBlock block;


- (instancetype)initWithViewController:(UIViewController *)viewController andJJDatePickerBlock:(JJDatePickerBlock)block;

- (instancetype)initWithViewController:(UIViewController *)viewController;


- (void)begin;

- (void)end;







@end
