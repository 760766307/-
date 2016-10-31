//
//  ViewController.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/21.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "ViewController.h"
#define XIA 30

@interface ViewController ()//<JPUSHRegisterDelegate>
{
    //    UITextField *_changeTextField;
    UITextField *_zhanghaoTextField;
    UITextField *_mimaTextField;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = BAISE;
    [self createUI];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //    _changeTextField.text = [JJExtern sharedJJ].schoolname;
    _zhanghaoTextField.text = [JJExtern sharedJJ].username;
    _mimaTextField.text = [JJExtern sharedJJ].userpassword;
}

- (void)viewDidAppear:(BOOL)animated{
    if ([JJExtern sharedJJ].        userid.length
        && !([JJExtern sharedJJ].   userid          == NULL)
        && [JJExtern sharedJJ].     username.length
        && !([JJExtern sharedJJ].   username        == NULL)
        && [JJExtern sharedJJ].     userpassword.length
        && !([JJExtern sharedJJ].   userpassword    == NULL)) {
        NSLog(@"%@",[JJExtern sharedJJ].urlString);
        NSLog(@"%@",[JJExtern sharedJJ].userid);
        
            [self logInWithZhanghao:[JJExtern sharedJJ].username andMima:[JJExtern sharedJJ].userpassword andHUDString:@"自动登录..."];
    }
}

- (void)createUI{
    
    
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    backgroundImageView.frame = CGRectMake(0, 0, SIZE.width, SIZE.height + 40);
    backgroundImageView.image = [UIImage imageNamed:@"shatan"];
    //    backgroundImageView.image = [UIImage imageNamed:@"shatan"];
    [self.view addSubview:backgroundImageView];
    
    
    //    // 设定位置和大小
    //    CGRect frame = CGRectMake(0,20,SIZE.width,SIZE.height);
    //    // 读取gif图片数据
    //    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"wangli" ofType:@"gif"]];
    //    // view生成
    //    UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
    //    webView.userInteractionEnabled = NO;//用户不可交互
    //    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:@"" baseURL:[NSURL URLWithString:@""]];
    //    [self.view addSubview:webView];
    
    
    
    UIImageView *titleImageView = [[UIImageView alloc] init];
    titleImageView.frame = CGRectMake((SIZE.width - 320) / 2, 50, 320, 80);
    titleImageView.image = [UIImage imageNamed:@"xinkaotitle"];
    [self.view addSubview:titleImageView];
    
    
    
    //    UILabel *changeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 120 + XIA, 47, 35)];
    //    changeLabel.textColor = [UIColor colorWithRed:0.07f green:0.15f blue:0.32f alpha:1.00f];
    //    //    changeLabel.textAlignment = 1;
    //    changeLabel.textColor = [UIColor colorWithRed:0.78f green:0.58f blue:0.00f alpha:1.00f];
    //    changeLabel.text = @"学校";
    //    [self.view addSubview:changeLabel];
    //
    //    _changeTextField = [[UITextField alloc] init];
    //    _changeTextField.frame = CGRectMake(30 + 47, 120 + XIA, SIZE.width - 60 - 47, 35);
    //    _changeTextField.backgroundColor = [UIColor colorWithRed:0.88f green:0.88f blue:0.88f alpha:0.6f];
    //    _changeTextField.placeholder = @" 请选择学校";
    //    _changeTextField.layer.cornerRadius = 6;
    //    _changeTextField.layer.borderWidth = 0.6;
    //    _changeTextField.layer.borderColor = BAISE.CGColor;
    //    _changeTextField.layer.masksToBounds = 1;
    //    [self.view addSubview:_changeTextField];
    //
    //    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    changeButton.frame = _changeTextField.frame;
    //    changeButton.tag = 99;
    //    [changeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:changeButton];
    
    
    
    UILabel *zhanghaoLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 130 + XIA, 47, 35)];
    zhanghaoLabel.textColor = [UIColor colorWithRed:0.78f green:0.58f blue:0.00f alpha:1.00f];
    //    zhanghaoLabel.textAlignment = 1;
    
    zhanghaoLabel.text = @"账号";
    [self.view addSubview:zhanghaoLabel];
    
    
    _zhanghaoTextField = [[UITextField alloc] init];
    _zhanghaoTextField.frame = CGRectMake(30 + 47, 130 + XIA, SIZE.width - 60 - 47, 35);
    _zhanghaoTextField.backgroundColor = [UIColor colorWithRed:0.88f green:0.88f blue:0.88f alpha:0.6f];
    _mimaTextField.keyboardType = UIKeyboardTypeASCIICapable;
    _zhanghaoTextField.placeholder = @" 请输入账号";
    _zhanghaoTextField.layer.cornerRadius = 6;
    _zhanghaoTextField.layer.borderWidth = 0.6;
    _zhanghaoTextField.layer.borderColor = BAISE.CGColor;
    _zhanghaoTextField.layer.masksToBounds = 1;
    [self.view addSubview:_zhanghaoTextField];
    
    UILabel *mimaLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 180 + XIA, 47, 35)];
    mimaLabel.textColor = [UIColor colorWithRed:0.78f green:0.58f blue:0.00f alpha:1.00f];
    mimaLabel.text = @"密码";
    [self.view addSubview:mimaLabel];
    
    _mimaTextField = [[UITextField alloc] init];
    _mimaTextField.frame = CGRectMake(30 + 47, 180 + XIA, SIZE.width - 60 - 47, 35);
    _mimaTextField.backgroundColor = [UIColor colorWithRed:0.88f green:0.88f blue:0.88f alpha:0.6f];
    _mimaTextField.keyboardType = UIKeyboardTypeDefault;
    _mimaTextField.secureTextEntry = 1;
    _mimaTextField.placeholder = @" 请输入密码";
    _mimaTextField.layer.cornerRadius = 6;
    _mimaTextField.layer.borderWidth = 0.6;
    _mimaTextField.layer.borderColor = BAISE.CGColor;
    _mimaTextField.layer.masksToBounds = 1;
    [self.view addSubview:_mimaTextField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 250 + XIA, SIZE.width - 60, 35);
    //    button.backgroundColor = [UIColor colorWithRed:0.40f green:0.69f blue:0.84f alpha:1.00f];
    [button setBackgroundImage:[UIImage imageNamed:@"signinButton"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"signinButtonh"] forState:UIControlStateHighlighted];
    
    [button setBackgroundImage:[UIImage imageNamed:@"buttonlalala"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"buttonhigh"] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor colorWithRed:0.07f green:0.15f blue:0.32f alpha:1.00f] forState:UIControlStateNormal];
    [button setTitle:@"登陆" forState:UIControlStateNormal];
    button.layer.cornerRadius = 6;
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = BAISE.CGColor;
    button.layer.masksToBounds = 1;
    button.tag = 100;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *codeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    codeButton.frame = CGRectMake(30, 300 + XIA, SIZE.width / 2 - 30, 35);//(30, 350, SIZE.width / 2 - 30, 35)
    //    codeButton.backgroundColor = [UIColor brownColor];
    [codeButton setTitle:@"扫描二维码登陆" forState:UIControlStateNormal];
    codeButton.tag = 101;
    [codeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];
    
    UIButton *forgetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    forgetButton.frame = CGRectMake(SIZE.width / 2, 300 + XIA, SIZE.width / 2 - 30, 35);//(SIZE.width / 2, 350, SIZE.width / 2 - 30, 35)
    [forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetButton.tag = 102;
    [forgetButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetButton];
    
    codeButton.hidden = 1;
    forgetButton.hidden = 1;
    
    UILabel *endLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, SIZE.height - 50, SIZE.width - 60, 40)];
    endLabel.font = [UIFont systemFontOfSize:13];
    endLabel.numberOfLines = 0;
    endLabel.textAlignment = 1;
    endLabel.textColor = [UIColor colorWithRed:0.07f green:0.15f blue:0.32f alpha:1.00f];
    endLabel.textColor = [UIColor colorWithRed:0.78f green:0.58f blue:0.00f alpha:1.00f];
    endLabel.text = @"河北鑫考教育科技股份有限公司\n地址:河北省衡水市桃城区和平东路137号";
    [self.view addSubview:endLabel];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}




- (void)buttonClick:(UIButton *)button{
    [self.view endEditing:1];
    
    NSLog(@"%ld",(long)button.tag);
    
    if (button.tag == 99) {
        
    }else if (button.tag == 100){
        
        [self logInWithZhanghao:_zhanghaoTextField.text andMima:_mimaTextField.text andHUDString:@"登录中..."];
        
    }else if (button.tag == 101){
        [self sweepCode];
        
        
        
    }else if (button.tag == 102){
        //忘记密码
        [self forgetPassword];
    }
    
    
    
    
    
}

//登陆
- (void)logInWithZhanghao:(NSString *)zhanghao andMima:(NSString *)mima andHUDString:(NSString *)hudString{
#if 0
    
    JJTabbarController *controller = [[JJTabbarController alloc] init];
    [self presentViewController:controller animated:0 completion:^{
    }];
    return;
#else
//    UIDevice *device = [UIDevice currentDevice];//创建设备对象
//    device  advertisingIdentifier
//    NSString *deviceUID = [[NSString alloc] initWithString:[device advertisingIdentifier]];
    [self showHudInView:self.view hint:hudString];
    if ([JJExtern sharedJJ].zhuceTuisong) {
        NSDictionary *request = @{@"action"     :@"login",
                                  @"Utel"       :zhanghao,
                                  @"Upass"      :mima,
                                  @"RegID"      :[JJExtern sharedJJ].registrationID,//
                                  };
        JJDownload *jj = [JJDownload jj];
        [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
//            [self hideHud];
            [self hideHud];
            NSLog(@"%@",dataDictionary);
            if ([dataDictionary[@"resultcode"] intValue] == 1){
                NSLog(@"%@",dataDictionary);
                [JJExtern sharedJJ].username = _zhanghaoTextField.text;
                [JJExtern sharedJJ].userpassword = _mimaTextField.text;
                [JJExtern sharedJJ].userid = dataDictionary[@"Uid"];
                [JJExtern sharedJJ].role = dataDictionary[@"Urole"];
                [JJExtern sharedJJ].name = dataDictionary[@"Uname"];
                JJTabbarController *controller = [[JJTabbarController alloc] init];
                [self presentViewController:controller animated:0 completion:^{
                }];
            }else{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码错误" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    return ;
                }]];
                [self presentViewController:alert animated:true completion:nil];
            }
        } andErrorBlock:^(int CanBeConnected, NSDictionary *dataDictionary) {
//            [self hideHud];
            [self hideHud];

            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败,请检查网络连接." preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }];

    }else{
        [JJExtern sharedJJ].signBlock = ^(int zhuceChenggong){
            
            NSDictionary *request = @{@"action"     :@"login",
                                      @"Utel"       :zhanghao,
                                      @"Upass"      :mima,
                                      @"RegID"      :[JJExtern sharedJJ].registrationID,//
                                      };
//            [self showHudInView:self.view hint:hudString];
            JJDownload *jj = [JJDownload jj];
            [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
//                [self hideHud];
                [self hideHud];

                NSLog(@"%@",dataDictionary);
                if ([dataDictionary[@"resultcode"] intValue] == 1){
                    NSLog(@"%@",dataDictionary);
                    [JJExtern sharedJJ].username = _zhanghaoTextField.text;
                    [JJExtern sharedJJ].userpassword = _mimaTextField.text;
                    [JJExtern sharedJJ].userid = dataDictionary[@"Uid"];
                    [JJExtern sharedJJ].role = dataDictionary[@"Urole"];
                    [JJExtern sharedJJ].name = dataDictionary[@"Uname"];
                    JJTabbarController *controller = [[JJTabbarController alloc] init];
                    [self presentViewController:controller animated:0 completion:^{
                    }];
                }else{
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码错误" preferredStyle:UIAlertControllerStyleAlert];
                    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        return ;
                    }]];
                    [self presentViewController:alert animated:true completion:nil];
                }
            } andErrorBlock:^(int CanBeConnected, NSDictionary *dataDictionary) {
//                [self hideHud];
                [self hideHud];

                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败,请检查网络连接." preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    return ;
                }]];
                [self presentViewController:alert animated:true completion:nil];
            }];
            [JJExtern sharedJJ].signBlock = nil;
        };
        
    }
#endif

}






- (void)sweepCode{
    
    
    
}





- (void)forgetPassword{
    
    
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end












