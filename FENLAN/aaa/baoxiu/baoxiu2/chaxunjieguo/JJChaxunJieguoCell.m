//
//  JJChaxunJieguoCell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/25.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJChaxunJieguoCell.h"

@implementation JJChaxunJieguoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)changeDataWithDictionary:(NSDictionary *)dictionary{

#define GUZHANGCISHUMAX 4.0f
#define COLORMAX 0.92f
    
    
    _titleLabel.text = [NSString stringWithFormat:@"报修类别 : %@",dictionary[@"glx"]];
    _indexLabel.text = [NSString stringWithFormat:@"维修次数 : %@",dictionary[@"bxcs"]];

    CGFloat red = COLORMAX * [dictionary[@"bxcs"] floatValue];
    CGFloat green = COLORMAX / [dictionary[@"bxcs"] floatValue];
    _indexLabel.textColor = [UIColor colorWithRed:red green:green blue:0 alpha:1];


}


@end





