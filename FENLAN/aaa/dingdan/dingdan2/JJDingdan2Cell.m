//
//  JJDingdan2Cell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/26.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJDingdan2Cell.h"

@implementation JJDingdan2Cell
{
    UILabel *_content4Label;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BAISE;
    
    _typeLabel.layer.cornerRadius = 5;
    _typeLabel.layer.borderWidth = 0.6;
    _typeLabel.layer.borderColor = [UIColor colorWithRed:0.99f green:0.81f blue:0.22f alpha:1.00f].CGColor;
    _typeLabel.layer.masksToBounds = 1;
    _typeLabel.textColor = [UIColor colorWithRed:0.99f green:0.81f blue:0.22f alpha:1.00f];
    _typeLabel.text = @"未完成";

    
    _content4Label = [[UILabel alloc] initWithFrame:CGRectMake(81, 124, SIZE.width - 89, 21)];
    _content4Label.textColor = [UIColor colorWithRed:0.78f green:0.58f blue:0.00f alpha:1.00f];
    _content4Label.numberOfLines = 0;
    _content4Label.font = BOUNDINGFONT;
//    _content2Label.text = @"账号";
    [self addSubview:_content4Label];
}





- (void)changeDataWithDictionary:(NSDictionary *)dictionary{
    CGFloat labelHeight = [[JJExtern sharedJJ] boundingRectWithSize:CGSizeMake(SIZE.width - 89, MAXFLOAT) text:dictionary[@"nr"] font:BOUNDINGFONT].height;
    if (labelHeight > 21) {
        _content4Label.frame = CGRectMake(81, 124, SIZE.width - 89, labelHeight);
    }else{
        _content4Label.frame = CGRectMake(81, 124, SIZE.width - 89, 21);
    }
    

//    _typeLabel.hidden = 1;
    _titleLabel.text = dictionary[@"kh"];
    _content1Label.text = dictionary[@"bxtel"];
    _content2Label.text = dictionary[@"zzq"];
    _content3Label.text = dictionary[@"glx"];
    _content4Label.text = dictionary[@"nr"];
    
    
    
    
    
    
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
