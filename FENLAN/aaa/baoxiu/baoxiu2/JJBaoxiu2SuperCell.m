//
//  JJBaoxiu2SuperCell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/23.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiu2SuperCell.h"

@implementation JJBaoxiu2SuperCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BAISE;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _cellTag = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)changeDataWithDictionary:(NSDictionary *)dictionary{}


- (void)changeDataWithModel:(JJBaoxiu2Model *)model{}


@end


