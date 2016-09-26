//
//  JJChangeController.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/22.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJChangeController.h"

@interface JJChangeController ()

<
UITableViewDelegate,
UITableViewDataSource,
UISearchBarDelegate
>
{
    

    
    NSMutableArray *_dataArray;
    NSMutableArray *_searchDataArray;
    
    
    UISearchBar *_searchBar;
    UITableView *_tableView;
    
    int _dataCount;
    
    
    
}

@property (nonatomic,copy)NSDictionary *banjiDictionary;
//@property (nonatomic)int buttonHeight;

@end

@implementation JJChangeController

- (instancetype)initWithBlock:(JJChangeSchoolBlock)block;
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
    self.title = @"报修查询";
    
    [self createUI];
    [self createData];
    
    
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

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self downloadKehuDictionary:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSLog(@"%@",userInfo);
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    [UIView animateWithDuration:0.2 animations:^{
        _tableView.frame = CGRectMake(0, 64 + 45, SIZE.width, SIZE.height - 64 - 45 - height);
    } completion:^(BOOL finished) {
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification{
    [UIView animateWithDuration:0.3 animations:^{
        _tableView.frame = CGRectMake(0, 64 + 45, SIZE.width, SIZE.height - 64 - 45);
    } completion:^(BOOL finished) {
    }];
}

//   http://images.missyuan.com/attachments/day_110518/20110518_11f578129597b680746e022z3P11111a.jpg
- (void)createData{
    
}

- (void)createUI{
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.frame = CGRectMake(0, 64, SIZE.width, 45);
    _searchBar.showsCancelButton = 1;
    _searchBar.returnKeyType = UIReturnKeyDone;
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];//searchBarCancelButtonClicked
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + 45, SIZE.width, SIZE.height - 64 - 45) style:0];
    _tableView.backgroundColor = [UIColor colorWithRed:0.89f green:0.89f blue:0.89f alpha:1.00f];
    UIButton *endEditingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    endEditingButton.frame = CGRectMake(0, 0, _tableView.frame.size.width, _tableView.frame.size.height);
    [endEditingButton addTarget:self action:@selector(endEditingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_tableView setBackgroundView:endEditingButton];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

- (void)downloadKehuDictionary:(NSDictionary *)dictionary{
    [self showHudInView:self.view hint:@"Loading"];
    
    NSDictionary *request = @{@"action"     :@"kmessage",
                              @"Kname"       :@"",
                              };
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
        [self hideHud];
        NSLog(@"%@",dataDictionary);
        _dataArray = [[NSMutableArray alloc] initWithArray:dataDictionary[@"khmessage"]];
        _searchDataArray = [[NSMutableArray alloc] initWithArray:_dataArray];
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


- (void)endEditingButtonClick:(UIButton *)button{
    [self.view endEditing:1];
}

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
            NSRange range = [_searchDataArray[i][@"kname"] rangeOfString:searchText];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:1 reuseIdentifier:@"cell"];
//        cell = [[NSBundle mainBundle] loadNibNamed:@"cell" owner:self options:nil][0];
    }
    cell.textLabel.text = _searchDataArray[indexPath.row][@"kname"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    [self.view endEditing:1];
    _block(_searchDataArray[indexPath.row]);
    [self.navigationController popViewControllerAnimated:1];
    
    
    //    请求数据：学校服务器地址?action=onestuapprovelist&stuid=8219&count=1&userid=5965
    
    //    @"http://10.10.50.246:93/port.aspx?"
    
    
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
