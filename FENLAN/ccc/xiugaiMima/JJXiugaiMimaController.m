//
//  JJXiugaiMimaController.m
//  鑫考报修
//
//  Created by 杨剑 on 16/10/6.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJXiugaiMimaController.h"

@interface JJXiugaiMimaController ()

@end

@implementation JJXiugaiMimaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    if ([_textField1.text isEqualToString:_textField2.text]) {
        [self showHudInView:self.view hint:@"Loading"];
        
        
//        action=repass
//        Utel  用户名
//        Nupass   新密码

        NSDictionary *request = @{@"action"     :@"repass",
                                  @"Utel"        :[JJExtern sharedJJ].username,
                                  @"Nupass"        :_textField1.text,
                                  };

        JJDownload *jj = [JJDownload jj];
        [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
            [self hideHud];
            NSLog(@"%@",dataDictionary);
            
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"恭喜!" message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.navigationController popViewControllerAnimated:1];
                return ;
            }]];
            [self presentViewController:alert animated:true completion:nil];
            
        } andErrorBlock:^(int CanBeConnected, NSDictionary *dataDictionary) {
            [self hideHud];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败,请检查网络连接." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }];
        
        
    }else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"重复输入密码与新密码不相同" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
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
