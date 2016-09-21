//
//  CCCCell.m
//  请假APP
//
//  Created by 杨剑 on 16/9/7.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "CCCCell.h"

@implementation CCCCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BAISE;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _contentLabel1.text = [JJExtern sharedJJ].name;
    _contentLabel2.text = [JJExtern sharedJJ].role;
    if ([[JJExtern sharedJJ].role intValue] == 2) {
        _contentLabel2.text = @"老师";
    }else if ([[JJExtern sharedJJ].role intValue] == 5) {
        _contentLabel2.text = @"年级主任";
    } else {
        _contentLabel2.text = @"校级管理员";
    }
    _contentLabel3.text = [JJExtern sharedJJ].nianji;
    _contentLabel4.text = [JJExtern sharedJJ].banji;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)buttonClick:(UIButton *)sender {
    if (_block) {
        _block(sender.tag,nil);
    }
}






- (void)changeDataWithDictionary:(NSDictionary *)dictionary{
//    @"title":@"关于",
//    @"content":@"张三",
//    @"imageName":@"http://345.jpg",
//    @"content2": @"3"

//    _titleLabel.text = dictionary[@"title"];
//    _titleImageView.image = [UIImage imageNamed:dictionary[@"imageName"]];
    

    
}



@end











