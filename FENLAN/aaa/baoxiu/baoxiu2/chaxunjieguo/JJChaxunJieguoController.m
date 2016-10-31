//
//  JJChaxunJieguoController.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/25.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJChaxunJieguoController.h"

@interface JJChaxunJieguoController ()

<
UITableViewDelegate,
UITableViewDataSource
>
{
    
    
    
//    NSMutableArray *_dataArray;
    
    
    UITableView *_tableView;

    
}
@end

@implementation JJChaxunJieguoController

- (instancetype)initWithGuzhangLiebiaoArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        _dataArray = array;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BAISE;
    self.automaticallyAdjustsScrollViewInsets = 0;
    self.title = @"查询结果";
    
    [self createUI];
    [self createData];
}
- (void)createData{
    
}

- (void)createUI{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SIZE.width, SIZE.height - 64) style:0];
    _tableView.backgroundColor = [UIColor colorWithRed:0.89f green:0.89f blue:0.89f alpha:1.00f];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JJChaxunJieguoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JJChaxunJieguoCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"JJChaxunJieguoCell" owner:self options:nil][0];
    }
    [cell changeDataWithDictionary:_dataArray[indexPath.row]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];

    JJBaoxiuXiangqingController *controller = [[JJBaoxiuXiangqingController alloc] initWithBaoxiuDictionary:_dataArray[indexPath.row]];
    [self.navigationController pushViewController:controller animated:1];
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
