//
//  JJBaoxiu1SuperCell.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JJBaoxiu1Model.h"



@interface JJBaoxiu1SuperCell : UITableViewCell





typedef void (^JJBaoxiu1CellBlock)(NSDictionary *cellDictionary);
@property (nonatomic,strong)JJBaoxiu1CellBlock block;


@property (nonatomic)int cellTag;


- (void)changeDataWithDictionary:(NSDictionary *)dictionary;


- (void)changeDataWithModel:(JJBaoxiu1Model *)model;






@end
