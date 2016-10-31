//
//  JJDingdan2Controller.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJDingdan2Controller.h"

@interface JJDingdan2Controller ()
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

@implementation JJDingdan2Controller


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BAISE;
    self.automaticallyAdjustsScrollViewInsets = 0;
    
    self.title = @"未完成订单";

    [self createData];
    [self createUI];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/tijiaodingdan", path] error:nil];
    
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
    
    NSDictionary *request = @{@"action"     :@"ydx",
                              @"gcs"       :[JJExtern sharedJJ].name,
                              };
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
        [self hideHud];
        NSLog(@"%@",dataDictionary);
        _dataArray = [[NSMutableArray alloc] initWithArray:dataDictionary[@"Xdc"]];
        [_tableView reloadData];
        if (![dataDictionary[@"Xdc"] count]) {
            [self showHint:@"暂无数据"];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat labelHeight = [[JJExtern sharedJJ] boundingRectWithSize:CGSizeMake(SIZE.width - 89, 1000) text:_dataArray[indexPath.row][@"nr"] font:BOUNDINGFONT].height;
    if (labelHeight > 21) {
        return 133 + labelHeight;
    }
    return 154;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JJDingdan2Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"JJDingdan2Cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"JJDingdan2Cell" owner:self options:nil][0];
    }
//    cell.titleLabel.text = _dataArray[indexPath.row][@"title"];
//    cell.titleImageView.image = [UIImage imageNamed:_dataArray[indexPath.row][@"imagename"]];
//    cell.subLabel.text = _dataArray[indexPath.row][@"subtitle"];
    [cell changeDataWithDictionary:_dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    JJWanchengController *controller = [[JJWanchengController alloc] initWithDingdanDictionary:_dataArray[indexPath.row]];
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
