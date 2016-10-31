//
//  JJWancheng1Cell.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/27.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JJWanchengSuperCell.h"

@interface JJWancheng1Cell : JJWanchengSuperCell


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UITextField *contentEditView;

@property (weak, nonatomic) IBOutlet UIButton *contentButton;

@end
