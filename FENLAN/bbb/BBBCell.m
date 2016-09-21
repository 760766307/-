//
//  BBBCell.m
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//




#import "AFNetworking.h"
#import "AFImageDownloader.h"





#import "BBBCell.h"

@implementation BBBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BAISE;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)changeDataWithDictionary:(NSDictionary *)dictionary{

    _titleLabel.text = dictionary[@"stuname"];
//    _titleImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dictionary[@"stupic"]]]];
    _titleImageView.image = [UIImage imageNamed:@"dengdaitubiao"];

    [[[AFImageDownloader alloc] init] downloadImageForURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:dictionary[@"stupic"]]] success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        _titleImageView.image = responseObject;
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        _titleImageView.image = [UIImage imageNamed:@"errorImage"];
    }];



}





@end
