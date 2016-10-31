//
//  JJBaoxiuXiangqingCell.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/28.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>
#define JJBAOXIU2FONT [UIFont systemFontOfSize:15]

@interface JJBaoxiuXiangqingCell : UITableViewCell



@property (weak, nonatomic) IBOutlet UILabel *kehuLabel;


@property (weak, nonatomic) IBOutlet UILabel *guzhangLeixingLabel;


@property (weak, nonatomic) IBOutlet UILabel *kaishiShijianLabel;


@property (weak, nonatomic) IBOutlet UILabel *jieshuShijianLabel;


@property (weak, nonatomic) IBOutlet UILabel *zuizhongQixianLabel;

@property (weak, nonatomic) IBOutlet UILabel *baoxiuRenLabel;





- (void)changeDataWithDictionary:(NSDictionary *)dictionary;


@end
