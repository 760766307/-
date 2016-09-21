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
//    NavigationType
// Do any additional setup after loading the view.
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClick:)];
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    [self createData];
    [self createUI];
}


- (void)leftBarButtonItemClick:(UIBarButtonItem *)barButtonItem{
    if ([JJExtern sharedJJ].LeftSlideVC.closed){
        [[JJExtern sharedJJ].LeftSlideVC openLeftView];
    }else{
        [[JJExtern sharedJJ].LeftSlideVC closeLeftView];
    }
}

- (void)createData{
    
    _dataArray = [[NSMutableArray alloc] initWithArray:@[@{@"title":@"个人信息",
                                                           @"content":@"张三",
                                                           @"imageName":@"ooopic_1473230219",
                                                           @"content2": @"3"
                                                           },
                                                         @{@"title":@"关于",
                                                           @"content":@"张三",
                                                           @"imageName":@"ooopic_1473230288",
                                                           @"content2": @"3"
                                                           },
                                                         @{@"title":@"退出登录",
                                                           @"content":@"张三",
                                                           @"imageName":@"ooopic_1473230165",
                                                           @"content2": @"3"
                                                           }
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
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 264;
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
        
        
        cell.block = ^(long buttonTag,NSDictionary *dic){
            
            if (buttonTag == 99) {
                
                JJGuanyuController *controller = [[JJGuanyuController alloc] init];
                controller.hidesBottomBarWhenPushed = 1;
                controller.title = @"关于";
                [self.navigationController pushViewController:controller animated:1];
                
            }
            if (buttonTag == 100) {
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定退出登录" message:@"" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    return ;
                }]];
                [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    [JJExtern sharedJJ].userid = @"";
                    [JJExtern sharedJJ].userpassword = @"";
                    [self.tabBarController dismissViewControllerAnimated:0 completion:^{
                    }];
                    return ;
                }]];
                [self presentViewController:alert animated:true completion:nil];
                
                
            }
            
            
        };
        
        
        
    }
//    [cell changeDataWithDictionary:_dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
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
















