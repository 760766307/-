//
//  JJBaoxiu1Cell1.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiu1Cell1.h"

@implementation JJBaoxiu1Cell1

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.cellTag = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buttonClick:(UIButton *)sender {
    if (self.block) {
        self.block(nil);
    }
}

- (void)changeDataWithDictionary:(NSDictionary *)dictionary{
    
}


- (void)changeDataWithModel:(JJBaoxiu1Model *)model{
    _contentTextField.text = model.kehu;
}



@end
