//
//  CCCCell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "CCCCell.h"

@implementation CCCCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BAISE;
    self.titleLabel.textColor = [UIColor colorWithRed:0.08f green:0.33f blue:0.20f alpha:1.00f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
