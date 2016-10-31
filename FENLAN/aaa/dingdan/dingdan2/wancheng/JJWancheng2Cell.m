//
//  JJWancheng2Cell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/27.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJWancheng2Cell.h"

@implementation JJWancheng2Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _contentEditView.layer.borderWidth = 0.4;
    _contentEditView.layer.borderColor = [UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)textViewDidEndEditing:(UITextView *)textView{
    if (self.block) {
        self.block(self.celltag,@{@"text":textView.text});
    }
}

- (void)changeDataWithModel:(JJWanchengModel *)model andIndexPath:(NSIndexPath *)indexPath{
    _contentEditView.text = model.beizhu;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){//判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        [textView endEditing:1];
        return NO;//这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    return YES;
}
- (void)changeTypeWithDictionary:(NSDictionary *)typeDictionary{
}


@end












