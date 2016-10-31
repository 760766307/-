//
//  JJChaxunJieguoCell.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/25.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJChaxunJieguoCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *indexLabel;


- (void)changeDataWithDictionary:(NSDictionary *)dictionary;

@end
