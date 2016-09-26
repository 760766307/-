//
//  JJBaoxiu1Model.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiu1Model.h"

@implementation JJBaoxiu1Model

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        
        
        _kehu = @"";
        _kehuid = @"";
        _kehutel = @"";
        
        _guzhanglev = @"";
        _guzhangPID = @"";
        _guzhangID = @"";
        _guzhangCode = @"";
        _guzhangjbn = @"";
        _guzhangName = @"";
        _guzhangHasChild = @"";
        _guzhangparent = @"";
        _guzhangLeixing = @"";
        
        _guzhanglev = @"1";
        _guzhangPID = @"0";
        _guzhangID = @"1";
        _guzhangCode = @"0";
        _guzhangjbn = @"一级";
        _guzhangName = @"出入校";
        _guzhangHasChild = @"1";
        _guzhangparent = @"0";
        _guzhangLeixing = @"一级 - 出入校";

 

        
        
        
        
        _baoxiuRen = @"";
        _baoxiuDianhua = @"";
        _qiXian = @"";
        _baoxiuNeirong = @"";
        
        
        
        
        
    }
    return self;
}

- (void)setGuzhangjbn:(NSString *)guzhangjbn{
    _guzhangjbn = guzhangjbn;
    _guzhangLeixing = [NSString stringWithFormat:@"%@ - %@",_guzhangjbn,_guzhangName];


}


- (void)setGuzhangName:(NSString *)guzhangName{
    _guzhangName = guzhangName;
    _guzhangLeixing = [NSString stringWithFormat:@"%@ - %@",_guzhangjbn,_guzhangName];
}


@end
