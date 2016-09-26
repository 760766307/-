//
//  JJBaoxiu2SuperCell.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/23.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JJBaoxiu2Model.h"

@interface JJBaoxiu2SuperCell : UITableViewCell





typedef void (^JJBaoxiu2CellBlock)(NSDictionary *cellDictionary);
@property (nonatomic,strong)JJBaoxiu2CellBlock block;


@property (nonatomic)int cellTag;


- (void)changeDataWithDictionary:(NSDictionary *)dictionary;


- (void)changeDataWithModel:(JJBaoxiu2Model *)model;




@end
