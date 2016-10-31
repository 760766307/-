//
//  HeaderView.m
//  a01克莱克神View
//
//  Created by pro on 15-8-8.
//  Copyright (c) 2015年 杨剑. All rights reserved.
//

#import "AAAHeaderView.h"

@implementation AAAHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _label = [[UILabel alloc] initWithFrame:self.frame];
        _label.backgroundColor = [UIColor orangeColor];
        _label.textAlignment = 1;
        [self addSubview:_label];
    }
    return self;
}

@end
