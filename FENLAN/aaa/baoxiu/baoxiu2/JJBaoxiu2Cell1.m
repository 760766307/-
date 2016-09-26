//
//  JJBaoxiu2Cell1.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/23.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiu2Cell1.h"

@implementation JJBaoxiu2Cell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _contentTextField.userInteractionEnabled = 0;
    self.cellTag = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)changeDataWithDictionary:(NSDictionary *)dictionary{}


- (void)changeDataWithModel:(JJBaoxiu2Model *)model{
    _contentTextField.text = model.kehu;
}



@end
