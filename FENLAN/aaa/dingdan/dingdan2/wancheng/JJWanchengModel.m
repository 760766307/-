//
//  JJWanchengModel.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/27.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJWanchengModel.h"

@implementation JJWanchengModel


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
{
    self = [super init];
    if (self) {
        
        _guzhangID = dictionary[@"id"];
        
        _kehu = dictionary[@"kh"];
        _guzhangLeixing = dictionary[@"glx"];
        _jiezhiShijian = dictionary[@"zzq"];
        
        _wanchengShijian = @"";
        _wanchengZhuangtai = @"";
        _beizhu = @"";
        _imageArray = @[];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _guzhangID          = @"";
        _kehu               = @"";
        _guzhangLeixing     = @"";
        _jiezhiShijian      = @"";
        _wanchengShijian    = @"";
        _wanchengZhuangtai  = @"";
        _beizhu             = @"";
        _imageArray           = @[];
    }
    return self;
}




- (void)addImageWithImage:(UIImage *)image andImageFile:(NSString *)file{
    NSDictionary *imageDictionary = @{@"image":image,
                                      @"file":file,
                                      @"name":@"",
                                      };
    NSMutableArray *imageMutableArray = [[NSMutableArray alloc] initWithArray:_imageArray];
    [imageMutableArray addObject:imageDictionary];
    _imageArray = imageMutableArray;
}

- (void)addImageFileWithString:(NSString *)fileString andNameString:(NSString *)nameString{
    NSDictionary *imageDictionary = @{@"image":@"",
                                      @"file":fileString,
                                      @"name":nameString,
                                      };
    NSMutableArray *imageMutableArray = [[NSMutableArray alloc] initWithArray:_imageArray];
    [imageMutableArray addObject:imageDictionary];
    _imageArray = imageMutableArray;
}

- (void)removeImageWithImageIndex:(long)imageIndex{
    
    [[NSFileManager defaultManager] removeItemAtPath:_imageArray[imageIndex][@"file"] error:nil];
    
    NSMutableArray *imageMutableArray = [[NSMutableArray alloc] initWithArray:_imageArray];
    [imageMutableArray removeObjectAtIndex:imageIndex];
    _imageArray = imageMutableArray;
}

- (NSArray *)getImageDataArray{
    NSMutableArray *imageDataArray = [[NSMutableArray alloc] init];
    for ( int i = 0; i < _imageArray.count; i ++) {
        
        
        
        
//        NSData *imageData = UIImageJPEGRepresentation([UIImage imageWithContentsOfFile:_imageArray[i][@"file"]],1);
//        NSData *base64Data = [imageData base64EncodedDataWithOptions:NSDataBase64Encoding64CharacterLineLength];
//        NSString *string = [[NSString stringWithFormat:@"%@",base64Data] stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSDictionary *dic = @{
//                              @"urlname":@"images",
                              @"urlname":[NSString stringWithFormat:@"image%d",i],
                              @"file":_imageArray[i][@"file"],
                              @"name":_imageArray[i][@"name"],
                              @"type":@"3",
                              };
        NSLog(@"~~~~~~~~~~~~~~\n\n \n\n ~~~~~~~~~~~~~~~~~~~~%@   \n\n {{{}}}",dic);
        [imageDataArray addObject:dic];
    }
    
    NSLog(@"%ld",(unsigned long)_imageArray.count);
    
    return imageDataArray;
}



@end


















