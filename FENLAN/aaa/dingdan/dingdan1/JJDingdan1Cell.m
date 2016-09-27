//
//  JJDingdan1Cell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/26.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJDingdan1Cell.h"

@implementation JJDingdan1Cell
{
    UILabel *_content4Label;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    _content4Label = [[UILabel alloc] initWithFrame:CGRectMake(81, 124, SIZE.width - 89, 21)];
    _content4Label.textColor = [UIColor colorWithRed:0.78f green:0.58f blue:0.00f alpha:1.00f];
    _content4Label.numberOfLines = 0;
    _content4Label.font = [UIFont systemFontOfSize:15];
    [self addSubview:_content4Label];
    
}











- (void)changeDataWithDictionary:(NSDictionary *)dictionary{
    CGFloat labelHeight = [[JJExtern sharedJJ] boundingRectWithSize:CGSizeMake(SIZE.width - 89, MAXFLOAT) text:dictionary[@"nr"] font:BOUNDINGFONT].height;
    if (labelHeight > 21) {
        _content4Label.frame = CGRectMake(81, 124, SIZE.width - 89, labelHeight);
    }else{
        _content4Label.frame = CGRectMake(81, 124, SIZE.width - 89, 21);
    }

    _typeLabel.hidden = 1;
    _titleLabel.text = dictionary[@"kh"];
    _content1Label.text = dictionary[@"bxtel"];
    _content2Label.text = dictionary[@"zzq"];
    _content3Label.text = dictionary[@"glx"];
    _content4Label.text = dictionary[@"nr"];

    
    
    
    
    
    
}




//    "nr":"服务器错误",
//    "kh":"1",
//    "bxtel":"110",
//    "zzq":"2016年08月03日 09:16",
//    "glx":"主板问题 "

//    "nr":"服务器故障",
//    "kh":"衡中",
//    "bxtel":"115689",
//    "zzq":"aaaaaaa",
//    "glx":"网络问题"







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}





@end






