//
//  JJWanchengSuperCell.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/27.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJWanchengModel.h"
@interface JJWanchengSuperCell : UITableViewCell


typedef void (^JJWanchengCellBlock)(long celltag,NSDictionary *cellDictionary);
@property (nonatomic,strong)JJWanchengCellBlock block;
@property (nonatomic)long celltag;
- (void)changeDataWithModel:(JJWanchengModel *)model andIndexPath:(NSIndexPath *)indexPath;
- (void)changeTypeWithDictionary:(NSDictionary *)typeDictionary;
- (void)setCelltag:(long)celltag andBlock:(JJWanchengCellBlock)block;
@end






