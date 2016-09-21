//
//  BBBRootController.m
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "BBBRootController.h"

@interface BBBRootController ()
<
UITableViewDelegate,
UITableViewDataSource,
UISearchBarDelegate
>
{
    
    //    int _buttonHeight;
    
    UIButton *_nianjiButton;
    UIButton *_banjiButton;
    
    
    //    NSDictionary *_nianjiDictionary;
    //    NSDictionary *_banjiDictionary;
    
    NSArray *_nianjiArray;
    NSArray *_banjiArray;
    
    NSMutableArray *_dataArray;
    NSMutableArray *_searchDataArray;
    
    
    UISearchBar *_searchBar;
    UITableView *_tableView;
    
    int _dataCount;
    
    
    
}

@property (nonatomic,copy)NSDictionary *banjiDictionary;
@property (nonatomic)int buttonHeight;

@end

@implementation BBBRootController

- (instancetype)initWithBlock:(JJBBBBlock)block
{
    self = [super init];
    if (self) {
        _block = block;
        _buttonHeight = 40;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = 0;
    //    NavigationType
    // Do any additional setup after loading the view.
    
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClick:)];
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    
    [self createUI];
    [self createData];
    
    
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
#if TISHIKUANG
#else
    if ([[JJExtern sharedJJ].role isEqualToString:@"2"]) {
        _nianjiButton.hidden = 1;
        _banjiButton.hidden = 1;
        self.buttonHeight = 0;
        
    }else{
        _nianjiButton.hidden = 0;
        _banjiButton.hidden = 0;
        self.buttonHeight = 40;
    }
    
    
#endif
    
    
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


- (void)leftBarButtonItemClick:(UIBarButtonItem *)barButtonItem{
//    if ([JJExtern sharedJJ].LeftSlideVC.closed){
//        [[JJExtern sharedJJ].LeftSlideVC openLeftView];
//    }else{
//        [[JJExtern sharedJJ].LeftSlideVC closeLeftView];
//    }
}


- (void)keyboardWillShow:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSLog(@"%@",userInfo);
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        _tableView.frame = CGRectMake(0, 64 + 45 + _buttonHeight, SIZE.width, SIZE.height - 64 - 45 - _buttonHeight - height);
    } completion:^(BOOL finished) {
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification{
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.frame = CGRectMake(0, 64 + 45 + _buttonHeight, SIZE.width, SIZE.height - 64 - 49 - 45 - _buttonHeight);
    } completion:^(BOOL finished) {
    }];
}

- (void)setButtonHeight:(int)buttonHeight{
    _buttonHeight = buttonHeight;
    if (_buttonHeight) {
        return;
    }
    _searchBar.frame = CGRectMake(0, 64 + _buttonHeight, SIZE.width, 45);
    _tableView.frame = CGRectMake(0, 64 + 45 + _buttonHeight, SIZE.width, SIZE.height - 64 - 49 - 45 - _buttonHeight);
}

//   http://images.missyuan.com/attachments/day_110518/20110518_11f578129597b680746e022z3P11111a.jpg
- (void)createData{
    if ([[JJExtern sharedJJ].role isEqualToString:@"2"]) {
        [self downloadXueshengDataWithDictionary:@{@"id":[JJExtern sharedJJ].classid}];
        [_nianjiButton setTitle:[NSString stringWithFormat:@"年级:%@",[JJExtern sharedJJ].nianji] forState:UIControlStateNormal];
        [_banjiButton setTitle:[NSString stringWithFormat:@"班级:%@",[JJExtern sharedJJ].banji] forState:UIControlStateNormal];
    }else{
        [self downloadBanjiDataWithDictionary:nil];
    }
    
}

- (void)createUI{
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reKeyBoard)];
    //    [_tableView addGestureRecognizer:tap];
    
    _nianjiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _nianjiButton.frame = CGRectMake( 0, 64, (SIZE.width - 2) / 2, 40);
    [_nianjiButton setBackgroundImage:[UIImage imageNamed:@"buttonlalala"] forState:UIControlStateNormal];
    [_nianjiButton setBackgroundImage:[UIImage imageNamed:@"buttonhigh"] forState:UIControlStateHighlighted];
    //    [_button1 setImage:[UIImage imageNamed:@"ooopic111"] forState:UIControlStateNormal];
    [_nianjiButton setTitleColor:[UIColor colorWithRed:0.17f green:0.44f blue:0.68f alpha:1.00f] forState:UIControlStateNormal];
    _nianjiButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_nianjiButton setTitle:@"点击选择年级" forState:UIControlStateNormal];
    _nianjiButton.tag = 101;
    [_nianjiButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nianjiButton];
    
    _banjiButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _banjiButton.frame = CGRectMake( (SIZE.width - 2) / 2 + 2, 64, (SIZE.width - 2) / 2, 40);
    [_banjiButton setBackgroundImage:[UIImage imageNamed:@"buttonlalala"] forState:UIControlStateNormal];
    [_banjiButton setBackgroundImage:[UIImage imageNamed:@"buttonhigh"] forState:UIControlStateHighlighted];
    [_banjiButton setTitleColor:[UIColor colorWithRed:0.17f green:0.44f blue:0.68f alpha:1.00f] forState:UIControlStateNormal];
    _banjiButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_banjiButton setTitle:@"点击选择班级" forState:UIControlStateNormal];
    _banjiButton.tag = 102;
    [_banjiButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_banjiButton];
    
    
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.frame = CGRectMake(0, 64 + 40, SIZE.width, 45);
    _searchBar.showsCancelButton = 1;
    _searchBar.returnKeyType = UIReturnKeyDone;
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];//searchBarCancelButtonClicked
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 45 + 40, SIZE.width, SIZE.height - 64 - 49 - 45 - 40) style:0];
    _tableView.backgroundColor = [UIColor colorWithRed:0.89f green:0.89f blue:0.89f alpha:1.00f];
    UIButton *endEditingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    endEditingButton.frame = CGRectMake(0, 0, _tableView.frame.size.width, _tableView.frame.size.height);
    [endEditingButton addTarget:self action:@selector(endEditingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_tableView setBackgroundView:endEditingButton];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)buttonClick:(UIButton *)button{
    
#if TISHIKUANG
    if ([[JJExtern sharedJJ].role isEqualToString:@"2"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"此账号无法选择其他年级或班级." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        [self presentViewController:alert animated:true completion:nil];
        return;
    }
#else
    
#endif
    
    if (button.tag == 101) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择年级" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        for (int i = 0; i < _nianjiArray.count; i ++) {
            [alert addAction:[UIAlertAction actionWithTitle:_nianjiArray[i][@"grade"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                _banjiArray = _nianjiArray[i][@"classlist"];
                NSLog(@"%ld",_banjiArray.count);
                [_nianjiButton setTitle:[NSString stringWithFormat:@"年级:%@",_nianjiArray[i][@"grade"]] forState:UIControlStateNormal];
                [_banjiButton setTitle:[NSString stringWithFormat:@"班级:%@",_banjiArray[0][@"name"]] forState:UIControlStateNormal];
                self.banjiDictionary = _banjiArray[0];
                return ;
            }]];
        }
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    }
    if (button.tag == 102) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择班级" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        for (int i = 0; i < _banjiArray.count; i ++) {
            [alert addAction:[UIAlertAction actionWithTitle:_banjiArray[i][@"name"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [_banjiButton setTitle:[NSString stringWithFormat:@"班级:%@",_banjiArray[i][@"name"]] forState:UIControlStateNormal];
                self.banjiDictionary = _banjiArray[i];
                return ;
            }]];
        }
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    }
}



- (void)downloadBanjiDataWithDictionary:(NSDictionary *)dictionary{
    [self showHudInView:self.view hint:@"Loading"];
    NSDictionary *request = @{@"action"     :@"getgradeandclass",
                              @"userid"     :[JJExtern sharedJJ].userid
                              };
    //    NSLog(@"***********%@",request);
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[JJExtern sharedJJ].schoolURLString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
        [self hideHud];
        _nianjiArray = dataDictionary[@"list"];
        if (_nianjiArray.count) {
            _banjiArray = _nianjiArray[0][@"classlist"];
            [_nianjiButton setTitle:[NSString stringWithFormat:@"年级:%@",_nianjiArray[0][@"grade"]] forState:UIControlStateNormal];
            if (_banjiArray.count) {
                [_banjiButton setTitle:[NSString stringWithFormat:@"班级:%@",_banjiArray[0][@"name"]] forState:UIControlStateNormal];
                self.banjiDictionary = _banjiArray[0];
            }else{
                [_banjiButton setTitle:@"无班级" forState:UIControlStateNormal];
                self.banjiDictionary = @{};
            }
        }else{
            _banjiArray = @[];
            [_nianjiButton setTitle:@"无年级" forState:UIControlStateNormal];
            [_banjiButton setTitle:@"无班级" forState:UIControlStateNormal];
            self.banjiDictionary = @{};
        }
    } andErrorBlock:^(int CanBeConnected, NSDictionary *dataDictionary) {
        [self hideHud];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"联网失败,请检查网络连接." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    }];
}


- (void)setBanjiDictionary:(NSDictionary *)banjiDictionary{
    _banjiDictionary = banjiDictionary;
    [self downloadXueshengDataWithDictionary:banjiDictionary];
}

- (void)downloadXueshengDataWithDictionary:(NSDictionary *)dictionary{
    if (![(dictionary[@"id"]) length]) {
        return;
    }
    [self showHudInView:self.view hint:@"Loading"];
    NSDictionary *request = @{@"action"     :@"stuinfo",
                              @"classid"    :dictionary[@"id"],
                              @"key"        :@""
                              };
    //    NSLog(@"***********%@",request);
    
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[JJExtern sharedJJ].schoolURLString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
        [self hideHud];
        _dataArray = [[NSMutableArray alloc] initWithArray:dataDictionary[@"stulist"]];
        _searchDataArray = [[NSMutableArray alloc] initWithArray:_dataArray];
        [_tableView reloadData];
    } andErrorBlock:^(int CanBeConnected, NSDictionary *dataDictionary) {
        [self hideHud];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"联网失败,请检查网络连接." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [self presentViewController:alert animated:true completion:nil];
    }];
    
}


- (void)endEditingButtonClick:(UIButton *)button{
    [self.view endEditing:1];
}



//- (void)reKeyBoard{
//    [self.view endEditing:1];
//}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.view endEditing:1];
}

//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
//    searchBar.text = @"";
//}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    _searchDataArray = [[NSMutableArray alloc] initWithArray:_dataArray];
    if (searchText.length) {
        for (long i = _searchDataArray.count - 1; i >= 0; i --) {
            NSRange range = [_searchDataArray[i][@"stuname"] rangeOfString:searchText];
            if (range.location == NSNotFound) {
                [_searchDataArray removeObjectAtIndex:i];
            }
        }
    }
    [_tableView reloadData];
    NSLog(@"%@",searchText);
    NSLog(@"aaa");
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_searchDataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BBBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BBBCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BBBCell" owner:self options:nil][0];
    }
    [cell changeDataWithDictionary:_searchDataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    [self.view endEditing:1];
    
    //    请求数据：学校服务器地址?action=onestuapprovelist&stuid=8219&count=1&userid=5965
    
    //    @"http://10.10.50.246:93/port.aspx?"
    

}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
