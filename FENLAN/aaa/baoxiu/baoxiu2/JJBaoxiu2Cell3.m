//
//  JJBaoxiu2Cell3.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/23.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiu2Cell3.h"

@implementation JJBaoxiu2Cell3

- (void)awakeFromNib {
    [super awakeFromNib];
    _contentTextField.userInteractionEnabled = 0;
    self.cellTag = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)changeDataWithDictionary:(NSDictionary *)dictionary{}


- (void)changeDataWithModel:(JJBaoxiu2Model *)model{
    _contentTextField.text = model.jiezhiShijian;
}




@end
