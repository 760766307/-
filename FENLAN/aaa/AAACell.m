//
//  AAACell.m
//  请假APP
//
//  Created by 杨剑 on 16/9/8.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "AAACell.h"

@implementation AAACell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BAISE;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//_zhanghaoTextField.layer.cornerRadius = 6;
//_zhanghaoTextField.layer.borderWidth = 0.6;
//_zhanghaoTextField.layer.borderColor = BAISE.CGColor;
//_zhanghaoTextField.layer.masksToBounds = 1;




- (void)changeDataWithDictionary:(NSDictionary *)dictionary{
    
//    @"stuname":@"记录",
//    @"stupic":@"http://images.missyuan.com/attachments/day_110518/20110518_11f578129597b680746e022z3P11111a.jpg",
//    @"imageName":@"jilu",
//    @"roleid":@"1",
//    @"isLeave":@"1"
    
    _titleLabel.text = dictionary[@"title"];
    _titleImageView.image = [UIImage imageNamed:dictionary[@"imagename"]];

    
    
    
}










@end
















