//
//  JJBaoxiu1Cell6.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiu1Cell6.h"

@implementation JJBaoxiu1Cell6

- (void)awakeFromNib {
    [super awakeFromNib];
    self.cellTag = 6;

    _contentTextField.layer.borderWidth = 0.4;
    _contentTextField.layer.borderColor = [UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (void)textViewDidBeginEditing:(UITextView *)textView{
//    if (_endBlock) {
//        _endBlock(textView.text);
//    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (self.block) {
        self.block(@{@"text":textView.text});
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){//判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        [textView endEditing:1];
        return NO;//这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    return YES;
}


- (void)changeDataWithDictionary:(NSDictionary *)dictionary{}


- (void)changeDataWithModel:(JJBaoxiu1Model *)model{
    _contentTextField.text = model.baoxiuNeirong;
}



@end







