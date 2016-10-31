//
//  JJWanchengModel.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/27.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJWanchengModel : NSObject

//:@"客户",
//":@"0",
//@"0",
//:@"故障类型",
//":@"0",
//@"0",
//:@"截止时间",
//":@"0",
//@"0",
//:@"完成时间",
//":@"0",
//@"0",
//:@"完成状态",
//":@"0",
//:@"备注",
//":@"0",
//@"0",
//:@"照片",
//@"0",

@property (nonatomic,copy)NSString *guzhangID;
@property (nonatomic,copy)NSString *kehu;
@property (nonatomic,copy)NSString *guzhangLeixing;
@property (nonatomic,copy)NSString *jiezhiShijian;
@property (nonatomic,copy)NSString *wanchengShijian;
@property (nonatomic,copy)NSString *wanchengZhuangtai;
@property (nonatomic,copy)NSString *beizhu;
@property (nonatomic,copy)NSArray *imageArray;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;



- (void)addImageWithImage:(UIImage *)image andImageFile:(NSString *)file;
- (void)addImageFileWithString:(NSString *)fileString andNameString:(NSString *)nameString;


- (void)removeImageWithImageIndex:(long)imageIndex;

- (NSArray *)getImageDataArray;




@end












