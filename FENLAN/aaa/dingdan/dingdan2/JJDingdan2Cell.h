//
//  JJDingdan2Cell.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/26.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>

# define BOUNDINGFONT [UIFont systemFontOfSize:15]

@interface JJDingdan2Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *content1Label;

@property (weak, nonatomic) IBOutlet UILabel *content2Label;
@property (weak, nonatomic) IBOutlet UILabel *content3Label;

- (void)changeDataWithDictionary:(NSDictionary *)dictionary;




@end


