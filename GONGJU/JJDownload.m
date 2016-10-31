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
        NSLog(@"%@", responseObject);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        
        id x = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
                
        NSLog(@"%@",x);
        
        successBlock(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        NSLog(@"%@", [error localizedDescription]);
        //  errorBlock(0,nil);
        errorBlock(0,nil);
    }];

}

//[formData appendPartWithFileData:imageData name:@"headimage" fileName:@"1.png" mimeType:@"image/png"];

//data是需要上传的文件，name是后台规定好的参数名
//[formData appendPartWithFileData:imageData name:@"headimage" fileName:@"1.png" mimeType:@"image/png"];
//mimeType文件类型:@“image/png" @"image/jpeg" @"text/html" @"text/json" @"text/xml"等


/*
 
 type 
 1@"text/json"
 2@"text/html"
 3@"text/xml"
 4@"image/jpeg"
 5@“image/png"
 
 */



- (void)downloadDataWithURLString:(NSString *)urlString andDictionary:(NSDictionary *)dictionary andFileArray:(NSArray *)fileArray andUploadingBlock:(JJDownloadUploadingBlock)uploadingBlock andSuccessBlock:(JJDownloadSuccessBlock)successBlock andErrorBlock:(JJDownloadErrorBlock)errorBlock{
    // 请求的参数
    // 初始化Manager
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误，因为我们要获取text/plain类型数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    manager.requestSerializer.timeoutInterval = 8;
    // post请求
    [manager POST:urlString parameters:dictionary constructingBodyWithBlock:^(id _Nonnull formData) {

//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        NSString *str = [formatter stringFromDate:[NSDate date]];
//        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
//        NSDictionary *dataDict = @{@"file":fileData};
//        
//        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        
//        [manager POST:url parameters:dataDict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//            [formData appendPartWithFileData:fileData name:@"myfiles" fileName:fileName mimeType:@"image/jpeg"];
//        } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            dataBk(responseObject);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            faileBk(error);
//        }];
        
//        NSData *imageData = UIImageJPEGRepresentation([UIImage imageWithContentsOfFile:_imageArray[i][@"file"]],1);
        for (int i = 0; i < fileArray.count; i ++) {
            [formData appendPartWithFileData:UIImageJPEGRepresentation([UIImage imageWithContentsOfFile:fileArray[i][@"file"]],1)
                                        name:fileArray[i][@"urlname"]
                                    fileName:fileArray[i][@"name"]
                                    mimeType:@[@"text/json", @"text/html", @"text/xml", @"image/jpeg", @"image/png"][[fileArray[i][@"type"] intValue]]];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 这里可以获取到目前的数据请求的进度
        
        NSLog(@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
        // 回到主队列刷新UI,用户自定义的进度条
        dispatch_async(dispatch_get_main_queue(), ^{
//            self.progressView.progress = 1.0 *
//            uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
            uploadingBlock(@{@"percentage":[NSString stringWithFormat:@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount]});

        });
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        // 请求成功，解析数据
        NSLog(@"%@", responseObject);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        
        id x = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        
        NSLog(@"%@",x);
        
        successBlock(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        NSLog(@"%@", [error localizedDescription]);
        //  errorBlock(0,nil);
        errorBlock(0,nil);
    }];
    
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






