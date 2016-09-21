//
//  JJDownload.h
//  请假APP
//
//  Created by 杨剑 on 16/9/8.
//  Copyright © 2016年 杨剑. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AFNetworking.h"


@interface JJDownload : NSObject

typedef void (^JJDownloadSuccessBlock)(NSDictionary *dataDictionary);

typedef void (^JJDownloadErrorBlock)(int CanBeConnected,NSDictionary *dataDictionary);




+ (instancetype)jj;



- (void)downloadDataWithURLString:(NSString *)urlString andDictionary:(NSDictionary *)dictionary andSuccessBlock:(JJDownloadSuccessBlock)successBlock andErrorBlock:(JJDownloadErrorBlock)errorBlock;





@end
