//
//  JJGuanyuController.m
//  请假APP
//
//  Created by 杨剑 on 16/9/13.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "JJGuanyuController.h"

@interface JJGuanyuController ()

@end

@implementation JJGuanyuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BAISE;
    self.automaticallyAdjustsScrollViewInsets = 0;

    _guanyuTextView.text = @"这里是鑫考教育这里是鑫考教育这里是鑫考教育\n这里是鑫考教育\n这里是鑫考教育\n这里是鑫考教育这里是鑫考教育\n这里是鑫考教育这里是鑫考教育这里是鑫考教育\n这里是鑫考教育这里是鑫考教育这里是鑫考教育这里是鑫考教育\n这里是鑫考教育";

}
- (IBAction)buttonClick:(UIButton *)sender {
    
    if (sender.tag == 101) {
        
        
        NSURL *requestURL = [[NSURL alloc] initWithString:@"http://www.baidu.com"];
        [[UIApplication sharedApplication] openURL:requestURL];
        
        
        
        
    }
    if (sender.tag == 102) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"联系方式" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"拨打电话:13143631807" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *telString = @"tel:13143631807";
//            NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",tel];
            UIWebView * callWebview = [[UIWebView alloc] init];
            [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:telString]]];
            [self.view addSubview:callWebview];
            return ;
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"复制微信:y760766307" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIPasteboard *pab = [UIPasteboard generalPasteboard];
            NSString *string = @"y760766307";
            [pab setString:string];
            if (pab == nil) {
                [self showHint:@"复制失败"];
                
            }else{
                [self showHint:@"复制成功"];
            }
            
            return ;
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"复制QQ:760766307" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIPasteboard *pab = [UIPasteboard generalPasteboard];
            NSString *string = @"760766307";
            [pab setString:string];
            if (pab == nil) {
                [self showHint:@"复制失败"];
                
            }else{
                [self showHint:@"复制成功"];
            }
            
            return ;
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"复制邮箱:760766307@qq.com" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIPasteboard *pab = [UIPasteboard generalPasteboard];
            NSString *string = @"760766307@qq.com";
            [pab setString:string];
            if (pab == nil) {
                [self showHint:@"复制失败"];
                
            }else{
                [self showHint:@"复制成功"];
            }
            return ;
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];

        [self presentViewController:alert animated:true completion:nil];
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
