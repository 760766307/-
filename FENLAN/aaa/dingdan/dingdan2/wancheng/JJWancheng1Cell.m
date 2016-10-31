//
//  JJWancheng1Cell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/27.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJWancheng1Cell.h"

@implementation JJWancheng1Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)contentButtonClick:(UIButton *)sender {
    
    if (self.block) {
        self.block(self.celltag,@{@"text":@""});
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.block) {
        self.block(self.celltag,@{@"text":textField.text});
    }
}

- (void)changeDataWithModel:(JJWanchengModel *)model andIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        _contentEditView.text = model.kehu;
    }else if (indexPath.row == 1) {
        _contentEditView.text = model.guzhangLeixing;
    }else if (indexPath.row == 2) {
        _contentEditView.text = model.jiezhiShijian;
    }else if (indexPath.row == 3) {
        _contentEditView.text = model.wanchengShijian;
    }else if (indexPath.row == 4) {
        _contentEditView.text = model.wanchengZhuangtai;
    }else{
        return;
    }
}

- (void)changeTypeWithDictionary:(NSDictionary *)typeDictionary{
    _titleLabel.text = [NSString stringWithFormat:@"%@:",typeDictionary[@"title"]];
    _contentButton.hidden = ![typeDictionary[@"button"] intValue];
    _contentEditView.enabled = [typeDictionary[@"edit"] intValue];
    _contentEditView.placeholder = typeDictionary[@"placeholder"];
    
    
    
    
}


@end










