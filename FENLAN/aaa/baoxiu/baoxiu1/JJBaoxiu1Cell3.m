//
//  JJBaoxiu1Cell3.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiu1Cell3.h"

@implementation JJBaoxiu1Cell3

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.cellTag = 3;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.block) {
        self.block(@{@"text":textField.text});
    }
}


- (void)changeDataWithDictionary:(NSDictionary *)dictionary{}


- (void)changeDataWithModel:(JJBaoxiu1Model *)model{}


@end







