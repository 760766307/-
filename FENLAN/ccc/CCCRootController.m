//
//  CCCRootController.m
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "CCCRootController.h"

@interface CCCRootController ()
<
UITableViewDelegate,
UITableViewDataSource
>
{
    
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    
//    NSDictionary *_stuDictionary;
    
}
@end

@implementation CCCRootController

- (instancetype)initWithBlock:(JJCCCBlock)block
{
    self = [super init];
    if (self) {
        _block = block;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BAISE;
    self.automaticallyAdjustsScrollViewInsets = 0;
    

    [self createData];
    [self createUI];
}


- (void)createData{
    
//    NSDictionary *infoDic=[[NSBundle mainBundle] infoDictionary];
//    NSString *currentVersion=infoDic[@"CFBundleShortVersionString"];
//    NSLog(@"当前版本号:%@\n商店版本号:%@",currentVersion,appStoreVersion);
    _dataArray = [[NSMutableArray alloc] initWithArray:@[
//                                                         @{@"title":@"个人信息",
//                                                           @"subtitle":@"",
//                                                           @"imagename":@"1.1",
//                                                           },
                                                         @{@"title":@"重置密码",
                                                           @"subtitle":@"",
                                                           @"imagename":@"chongzhi",
                                                           },
//                                                         @{@"title":@"检查版本",
//                                                           @"subtitle":currentVersion,
//                                                           @"imagename":@"3.1",
//                                                           },
                                                         @{@"title":@"关于",
                                                           @"subtitle":@"",
                                                           @"imagename":@"guanyu",
                                                           },
                                                         @{@"title":@"注销",
                                                           @"subtitle":@"",
                                                           @"imagename":@"zhuxiao",
                                                           },
                                                         ]];
}




- (void)createUI{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SIZE.width, SIZE.height - 64) style:0];
    _tableView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    //实现方法//取消textView ,textField的第一响应者即可
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CCCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CCCCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"CCCCell" owner:self options:nil][0];
    }
    cell.titleLabel.text = _dataArray[indexPath.row][@"title"];
//    cell.titleImageView.image = [UIImage imageNamed:_dataArray[indexPath.row][@"imagename"]];
    cell.titleImageView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:_dataArray[indexPath.row][@"imagename"] ofType:@"png"]]];

    cell.subLabel.text = _dataArray[indexPath.row][@"subtitle"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
//    if (indexPath.row == 0) {
//        
//    }else
    if (indexPath.row == 0) {
        JJXiugaiMimaController *controller = [[JJXiugaiMimaController alloc] init];
        controller.hidesBottomBarWhenPushed = 1;
        [self.navigationController pushViewController:controller animated:1];
//    }else if (indexPath.row == 2) {
//        [self banbenJiance];
    }else if (indexPath.row == 1) {
        JJGuanyuController *controller = [[JJGuanyuController alloc] init];
        controller.hidesBottomBarWhenPushed = 1;
        [self.navigationController pushViewController:controller animated:1];
    }else if (indexPath.row == 2) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否退出此账号?" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [JJExtern sharedJJ].userid = @"";
            [JJExtern sharedJJ].userpassword = @"";
            [self.tabBarController dismissViewControllerAnimated:0 completion:^{
            }];
            return ;
            return ;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    }else{
        return;
    }
    
    
    
    
}

//检测版本
- (void)banbenJiance{

    [self hsUpdateApp];
    

}
/**
 *  天朝专用检测app更新
 */
-(void)hsUpdateApp
{
    
//Name:leave
//Prefix:FW2X9KNGZ7
//ID:com.xinkaojiaoyu.leave
    
//Name:XinKaoRepair
//Prefix:FW2X9KNGZ7
//ID:com.xinkaojiaoyu.repair
    
#define STOREAPPID @"com.xinkaojiaoyu.leave"

    //////http://www.360doc.com/content/15/0728/18/19119980_487992185.shtml
    
    //2先获取当前工程项目版本号
    NSDictionary *infoDic=[[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion=infoDic[@"CFBundleShortVersionString"];
    //3从网络获取appStore版本号
//    NSData *response = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@",STOREAPPID]]] returningResponse:nil error:nil];
    
    
    
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[NSString stringWithFormat:@"http://itunes.apple.com/cn/lookup?id=%@",STOREAPPID] andDictionary:nil andSuccessBlock:^(NSDictionary *dataDictionary) {
        [self hideHud];
        NSLog(@"%@",dataDictionary);
        
        
        NSArray *array = dataDictionary[@"results"];
        NSDictionary *dic = array[0];
        NSString *appStoreVersion = dic[@"version"];
        //打印版本号
        NSLog(@"当前版本号:%@\n商店版本号:%@",currentVersion,appStoreVersion);
        //4当前版本号小于商店版本号,就更新
        if([currentVersion floatValue] < [appStoreVersion floatValue])
        {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"有新版本" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"去看看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //6此处加入应用在app store的地址，方便用户去更新，一种实现方式如下：
                NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?ls=1&mt=8", STOREAPPID]];
                [[UIApplication sharedApplication] openURL:url];
                return ;
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"无新版本" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }

        
    } andErrorBlock:^(int CanBeConnected, NSDictionary *dataDictionary) {
        [self hideHud];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败,请检查网络连接." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



/*
 
 老师信息
 
 检查版本更新
 
 客服电话
 
 切换账号
 
 退出登录

*/

@end
















