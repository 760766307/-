//
//  JJDownload.m
//  请假APP
//
//  Created by 杨剑 on 16/9/8.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "JJDownload.h"

@implementation JJDownload


+ (instancetype)jj{
    JJDownload *download = [[JJDownload alloc] init];
    return download;
}


- (void)downloadDataWithURLString:(NSString *)urlString andDictionary:(NSDictionary *)dictionary andSuccessBlock:(JJDownloadSuccessBlock)successBlock andErrorBlock:(JJDownloadErrorBlock)errorBlock{
    // 请求的参数
    // 初始化Manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误，因为我们要获取text/plain类型数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    manager.requestSerializer.timeoutInterval = 8;
    // post请求
    [manager POST:urlString parameters:dictionary constructingBodyWithBlock:^(id _Nonnull formData) {
        // 拼接data到请求体，这个block的参数是遵守AFMultipartFormData协议的。
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 这里可以获取到目前的数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        // 请求成功，解析数据
//        NSLog(@"%@", responseObject);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"%@", dic);
        successBlock(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        NSLog(@"%@", [error localizedDescription]);
        //  errorBlock(0,nil);
        errorBlock(0,nil);
    }];
        
    
//    return 1;


}
//- (NSData *)convertJsonParameters:(NSObject *)paramModelOrDic{
////     model->dictionary->nsdata->jsonStr->utf8Str
//    NSDictionary *paramDic = [NSDictionary dictionary];
////    if ([paramModelOrDic isKindOfClass:[NSDictionary class]]) {
////                paramDic =@{Root:(NSDictionary *)paramModelOrDic};
//        paramDic =(NSDictionary *)paramModelOrDic;
////    }
////    else{
////        //        paramDic =@{Root:[(DataSuperLS *)paramModelOrDic toDictionary]};
////        paramDic =[(DataSuperLS *)paramModelOrDic toDictionary];
////        
////    }
//    
//    NSData * paramJsonData = [NSJSONSerialization dataWithJSONObject:paramModelOrDic options:NSJSONWritingPrettyPrinted error:nil];
//    NSString * paramJsonStr = [[NSString alloc]initWithData:paramJsonData encoding:NSUTF8StringEncoding];
//    
//    paramJsonStr = [paramJsonStr stringByReplacingOccurrencesOfString:@" " withString:@""];
//    paramJsonStr = [paramJsonStr stringByReplacingOccurrencesOfString:@"\t" withString:@""];
//    paramJsonStr = [paramJsonStr stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
//    paramJsonStr = [paramJsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    paramJsonStr = [paramJsonStr stringByReplacingOccurrencesOfString:@"~>$<★○●" withString:@" "];
//    
//    return [paramJsonStr dataUsingEncoding:NSUTF8StringEncoding];
//}


@end

#if 0

// 请求的参数
NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"20131129", @"date", @"1", @"startRecord", @"5", @"len", @"1234567890", @"udid", @"Iphone", @"terminalType", @"213", @"cid", nil];
// 初始化Manager
AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
// 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误，因为我们要获取text/plain类型数据
manager.responseSerializer = [AFHTTPResponseSerializer serializer];
manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/plain",@"charset=utf-8", nil];

[manager POST:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?" parameters:dic constructingBodyWithBlock:^(id _Nonnull formData) {
    // 拼接data到请求体，这个block的参数是遵守AFMultipartFormData协议的。
} progress:^(NSProgress * _Nonnull uploadProgress) {
    // 这里可以获取到目前的数据请求的进度
} success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
    // 请求成功，解析数据
    NSLog(@"%@", responseObject);
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
    NSLog(@"%@", dic);
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    // 请求失败
    NSLog(@"%@", [error localizedDescription]);
}];
#else
#endif

//   h ttp://10.10.50.246:92/SchInfo.aspx?action=login&username=13722812531&pwd=123456






