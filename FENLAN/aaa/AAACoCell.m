//
//  AAACoCell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "AAACoCell.h"

@implementation AAACoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 6;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor colorWithRed:0.85f green:0.84f blue:0.84f alpha:1.00f].CGColor;
    self.layer.masksToBounds = 1;

    self.backgroundColor = BAISE;
    // Initialization code
}

@end
