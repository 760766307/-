//
//  JJGuzhangController.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJGuzhangController.h"

@interface JJGuzhangController ()
<
UITableViewDelegate,
UITableViewDataSource
>
{
    
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    NSMutableArray *_isSpreadButtonArray;
    
}
@end

@implementation JJGuzhangController
- (instancetype)initWithBlock:(JJGuzhangBlock)block;
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

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self downloadGuzhangLeixingDictionary:nil];
}

- (void)createData{
//    _dataArray = [[NSMutableArray alloc] initWithArray:@[]];
}




- (void)createUI{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SIZE.width, SIZE.height - 64) style:0];
    _tableView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    //实现方法//取消textView ,textField的第一响应者即可
}


- (void)downloadGuzhangLeixingDictionary:(NSDictionary *)dictionary{
    [self showHudInView:self.view hint:@"Loading"];
    NSDictionary *request = @{@"action"     :@"IosYJbx",
                              };
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
        [self hideHud];
        NSLog(@"%@",dataDictionary);
        _dataArray = [[NSMutableArray alloc] initWithArray:dataDictionary[@"YJBX"]];
        _isSpreadButtonArray = [[NSMutableArray alloc] init];
        for (int i = 0 ; i < _dataArray.count; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:[UIImage imageNamed:@"sectionguan"] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"sectionkai"] forState:UIControlStateSelected];
            [button setTitleColor:[UIColor colorWithRed:0.18f green:0.34f blue:0.43f alpha:1.00f] forState:UIControlStateNormal];
            [button setTitle:[NSString stringWithFormat:@"%@ - %@ (%d项)",_dataArray[i][@"Jbn"],_dataArray[i][@"Name"],(int)[_dataArray[i][@"EJbx"] count]] forState:UIControlStateNormal];
            button.tag = i + 100;
            [button addTarget:self action:@selector(spreadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.selected = 0;
            [_isSpreadButtonArray addObject:button];
        }
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
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (((UIButton *)_isSpreadButtonArray[section]).selected) {
        return [_dataArray[section][@"EJbx"] count];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setImage:[UIImage imageNamed:@"sectionguan"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"sectionkai"] forState:UIControlStateSelected];
//    [button setTitleColor:[UIColor colorWithRed:0.18f green:0.34f blue:0.43f alpha:1.00f] forState:UIControlStateNormal];
//    [button setTitle:[NSString stringWithFormat:@"%@ - %@ (%ld项)",_dataArray[section][@"Jbn"],_dataArray[section][@"Name"],[_dataArray[section][@"EJbx"] count]] forState:UIControlStateNormal];
//    button.tag = section + 100;
//    [button addTarget:self action:@selector(spreadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    button.selected = ![_isSpreadArray[button.tag - 100] intValue];
    
    
    return _isSpreadButtonArray[section];
}

- (void)spreadButtonClick:(UIButton *)button{

    button.selected = !button.selected;
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag - 100] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:1 reuseIdentifier:@"cell"];
        //        cell = [[NSBundle mainBundle] loadNibNamed:@"cell" owner:self options:nil][0];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@",_dataArray[indexPath.section][@"EJbx"][indexPath.row][@"jbn"],_dataArray[indexPath.section][@"EJbx"][indexPath.row][@"Name"]];
    return cell;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
//    [button setTitle:[NSString stringWithFormat:@"%@ - %@ (%ld项)",_dataArray[i][@"Jbn"],_dataArray[i][@"Name"],[_dataArray[i][@"EJbx"] count]] forState:UIControlStateNormal];

    
    NSMutableDictionary *mdic = [[NSMutableDictionary alloc] initWithDictionary:_dataArray[indexPath.section][@"EJbx"][indexPath.row]];
    [mdic setObject:_dataArray[indexPath.section][@"Name"] forKey:@"guzhangSection"];
    _block(mdic);
    [self.navigationController popViewControllerAnimated:1];
    
    
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











