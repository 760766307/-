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
    
    NSDictionary *_stuDictionary;
    
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
    
    _dataArray = [[NSMutableArray alloc] initWithArray:@[@{@"title":@"个人信息",
                                                           @"subtitle":@"",
                                                           @"imagename":@"1.1",
                                                           },
                                                         @{@"title":@"密码",
                                                           @"subtitle":@"",
                                                           @"imagename":@"2.1",
                                                           },
                                                         @{@"title":@"检查版本",
                                                           @"subtitle":@"1.2.1",
                                                           @"imagename":@"3.1",
                                                           },
                                                         @{@"title":@"关于",
                                                           @"subtitle":@"",
                                                           @"imagename":@"4.1",
                                                           },
                                                         @{@"title":@"注销",
                                                           @"subtitle":@"",
                                                           @"imagename":@"2.2",
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
    cell.titleImageView.image = [UIImage imageNamed:_dataArray[indexPath.row][@"imagename"]];
    cell.subLabel.text = _dataArray[indexPath.row][@"subtitle"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1) {
        
    }else if (indexPath.row == 2) {
        [self banbenJiance];
    }else if (indexPath.row == 3) {
        JJGuanyuController *controller = [[JJGuanyuController alloc] init];
        [self.navigationController pushViewController:controller animated:1];
    }else if (indexPath.row == 4) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否退出此账号?" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self showHint:@"正在注销"];
            return ;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    }else{
        return;
    }
    
    
    
    
}

//检测版本
- (void)banbenJiance{



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
















