//
//  JJDingdan3Controller.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJDingdan3Controller.h"

@interface JJDingdan3Controller ()
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

@implementation JJDingdan3Controller


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BAISE;
    self.automaticallyAdjustsScrollViewInsets = 0;
    
    
    [self createData];
    [self createUI];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self downloadXindingdanDataWithDictionary:nil];
}

- (void)createData{
    
    _dataArray = [[NSMutableArray alloc] init];
}




- (void)createUI{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SIZE.width, SIZE.height - 64) style:0];
    _tableView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    //实现方法//取消textView ,textField的第一响应者即可
}

- (void)downloadXindingdanDataWithDictionary:(NSDictionary *)dictionary{
    [self showHudInView:self.view hint:@"Loading"];
    
    NSDictionary *request = @{@"action"     :@"xddc",
                              @"gcs"       :@"",
                              };
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
        [self hideHud];
        NSLog(@"%@",dataDictionary);
        _dataArray = [[NSMutableArray alloc] initWithArray:dataDictionary[@"khmessage"]];
        [_tableView reloadData];
    } andErrorBlock:^(int CanBeConnected, NSDictionary *dataDictionary) {
        [self hideHud];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络连接失败,请检查网络连接." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    }];
    
    
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
