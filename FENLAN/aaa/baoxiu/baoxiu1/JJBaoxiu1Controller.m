//
//  JJBaoxiu1Controller.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiu1Controller.h"

@interface JJBaoxiu1Controller ()
<
UITableViewDelegate,
UITableViewDataSource
>
{
    
    JJBaoxiu1Model *_model;
    NSMutableArray *_dataArray;
    NSMutableArray *_cellnameArray;
    UITableView *_tableView;
    
    UIDatePicker *_datePicker;
    
    JJDatePickerView *_datePickerView;
    
    
    UIButton *_tijiaoButton;
    
    
}


@end

@implementation JJBaoxiu1Controller


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BAISE;
    self.automaticallyAdjustsScrollViewInsets = 0;
    
    self.title = @"新增报修";
    
    [self createData];
    [self createUI];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardWillShow:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSLog(@"%@",userInfo);
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        _tableView.frame = CGRectMake(0, 64, SIZE.width, SIZE.height - 64 - height);
    } completion:^(BOOL finished) {
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification{
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.frame = CGRectMake(0, 64, SIZE.width, SIZE.height - 64 - 49);
    } completion:^(BOOL finished) {
    }];
}

- (void)createData{
    
    _model = [[JJBaoxiu1Model alloc] init];
    _dataArray = [[NSMutableArray alloc] init];
    _cellnameArray = [[NSMutableArray alloc] init];
    [_cellnameArray addObject:@[@{@"cellname":@"JJBaoxiu1Cell1",
                                  },
                                @{@"cellname":@"JJBaoxiu1Cell2",
                                  },
                                @{@"cellname":@"JJBaoxiu1Cell3",
                                  },
                                @{@"cellname":@"JJBaoxiu1Cell4",
                                  },
                                @{@"cellname":@"JJBaoxiu1Cell5",
                                  },
                                @{@"cellname":@"JJBaoxiu1Cell6",
                                  },
                                ]];
    
    
    
}




- (void)createUI{
    
    _tijiaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _tijiaoButton.frame = CGRectMake(3, SIZE.height - 46, SIZE.width - 6, 43);
    [_tijiaoButton setBackgroundImage:[UIImage imageNamed:@"buttonlalala"] forState:UIControlStateNormal];
    [_tijiaoButton setBackgroundImage:[UIImage imageNamed:@"buttonhigh"] forState:UIControlStateHighlighted];
    [_tijiaoButton setTitleColor:[UIColor colorWithRed:0.17f green:0.44f blue:0.68f alpha:1.00f] forState:UIControlStateNormal];
    _tijiaoButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_tijiaoButton setTitle:@"提交" forState:UIControlStateNormal];
    _tijiaoButton.tag = 101;
    [_tijiaoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_tijiaoButton];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SIZE.width, SIZE.height - 64 - 49) style:0];
    _tableView.backgroundColor = [UIColor colorWithRed:0.89f green:0.89f blue:0.89f alpha:1.00f];;;
    UIButton *endEditingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    endEditingButton.frame = CGRectMake(0, 0, _tableView.frame.size.width, _tableView.frame.size.height);
    [endEditingButton addTarget:self action:@selector(endEditingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_tableView setBackgroundView:endEditingButton];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

- (void)endEditingButtonClick:(UIButton *)button{
    [self.view endEditing:1];
}
- (void)buttonClick:(UIButton *)button{
    [self.view endEditing:1];
    [self showHudInView:self.view hint:@"Loading"];
    
    NSDictionary *request = @{@"action"     :@"Uploadbx",
                              @"bxr"        :_model.baoxiuRen,
                              @"kh"         :_model.kehu,
                              @"bxtel"      :_model.baoxiuDianhua,
                              @"glx"        :_model.guzhangLeixing,
                              @"zzq"        :_model.qiXian,
                              @"nr"         :_model.baoxiuNeirong,
                              };
    
    NSLog(@"%@",request);
    
    NSArray *key = [request allKeys];
    for (int i = 0 ; i < key.count; i ++) {
        NSLog(@"key:%@,value:%@",key[i],request[key[i]]);
    }
    
    
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
        NSLog(@"%@",dataDictionary);
        [self hideHud];
        [self showHint:@"上传报修成功"];
        [self.navigationController popViewControllerAnimated:1];
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
    return [_cellnameArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_cellnameArray[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_cellnameArray[indexPath.section][indexPath.row][@"cellname"] isEqualToString:@"JJBaoxiu1Cell6"]) {
        return 135;
    }
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JJBaoxiu1SuperCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellnameArray[indexPath.section][indexPath.row][@"cellname"]];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:_cellnameArray[indexPath.section][indexPath.row][@"cellname"] owner:self options:nil][0];
        cell.block = ^(NSDictionary *cellDictionary){
            [self.view endEditing:1];
            if (cell.cellTag == 1) {
                JJChangeController *changeSchoolController = [[JJChangeController alloc] initWithBlock:^(NSDictionary *changeSchoolDictionary) {
                    
                    _model.kehu = changeSchoolDictionary[@"kname"];
                    _model.kehuid = changeSchoolDictionary[@"Kid"];
                    _model.kehutel = changeSchoolDictionary[@"ktel"];
                    
                    [_tableView reloadData];
                }];
                [self.navigationController pushViewController:changeSchoolController animated:1];
            }else if (cell.cellTag == 2) {
                JJGuzhangController *guzhangController = [[JJGuzhangController alloc] initWithBlock:^(NSDictionary *guzhangDictionary) {
                    
                    NSLog(@"%@,%@,%@,%@,%@,%@,",guzhangDictionary[@"Code"],guzhangDictionary[@"HasChild"],guzhangDictionary[@"Name"],guzhangDictionary[@"jbn"],guzhangDictionary[@"lev"],guzhangDictionary[@"parent"]);
                    
                    _model.guzhangCode = guzhangDictionary[@"Code"];
                    _model.guzhangHasChild = guzhangDictionary[@"HasChild"];
                    _model.guzhangID = guzhangDictionary[@"ID"];
                    _model.guzhangName = guzhangDictionary[@"Name"];
                    _model.guzhangPID = guzhangDictionary[@"PID"];
                    _model.guzhangjbn = guzhangDictionary[@"jbn"];
                    _model.guzhanglev = guzhangDictionary[@"lev"];
                    _model.guzhangparent = guzhangDictionary[@"parent"];
                    _model.guzhangSection = guzhangDictionary[@"guzhangSection"];
                    
                    [_tableView reloadData];
                    
                }];
                [self.navigationController pushViewController:guzhangController animated:1];
            }else if (cell.cellTag == 3) {
                _model.baoxiuRen = cellDictionary[@"text"];
            }else if (cell.cellTag == 4) {
                _model.baoxiuDianhua = cellDictionary[@"text"];
                [_tableView reloadData];
            }else if (cell.cellTag == 5) {
                _datePickerView = [[JJDatePickerView alloc] initWithViewController:self andJJDatePickerBlock:^(NSDictionary *dictionary) {
                    _model.qiXian = dictionary[@"text"];
                    [_tableView reloadData];
                }];
                [_datePickerView addTarget:self action:@selector(datePickerViewBackgroundClick:) forControlEvents:UIControlEventTouchUpInside];
                [_datePickerView begin];
            }else if (cell.cellTag == 6) {
                _model.baoxiuNeirong = cellDictionary[@"text"];
                [_tableView reloadData];
            }else{
                return ;
            }
        };
    }
    
    [cell changeDataWithModel:_model];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:1];
    
    
    
}

- (void)datePickerViewBackgroundClick:(JJDatePickerView *)datePickerView{
    [datePickerView end];
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
