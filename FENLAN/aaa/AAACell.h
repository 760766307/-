//
//  AAACell.h
//  请假APP
//
//  Created by 杨剑 on 16/9/8.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAACell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;












- (void)changeDataWithDictionary:(NSDictionary *)dictionary;





@end
