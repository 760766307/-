//
//  CCCCell.h
//  请假APP
//
//  Created by 杨剑 on 16/9/7.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCCCell : UITableViewCell







typedef void (^JJCCCCellBlock)(long buttonTag,NSDictionary *dictionary);


@property (nonatomic,strong)JJCCCCellBlock block;







@property (weak, nonatomic) IBOutlet UILabel *contentLabel1;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel2;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel3;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel4;


- (void)changeDataWithDictionary:(NSDictionary *)dictionary;







@end
