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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
