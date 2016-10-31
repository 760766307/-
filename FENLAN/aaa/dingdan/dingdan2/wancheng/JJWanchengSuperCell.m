//
//  JJWanchengSuperCell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/27.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJWanchengSuperCell.h"

@implementation JJWanchengSuperCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = BAISE;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCelltag:(long)celltag andBlock:(JJWanchengCellBlock)block{
    self.celltag = celltag;
    self.block = block;
}

- (void)changeDataWithModel:(JJWanchengModel *)model andIndexPath:(NSIndexPath *)indexPath{

}

- (void)changeTypeWithDictionary:(NSDictionary *)typeDictionary{


}


@end




