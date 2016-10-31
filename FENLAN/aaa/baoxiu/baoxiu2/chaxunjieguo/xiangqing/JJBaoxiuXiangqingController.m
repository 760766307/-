//
//  JJBaoxiuXiangqingController.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/28.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiuXiangqingController.h"

@interface JJBaoxiuXiangqingController ()
<
UITableViewDelegate,
UITableViewDataSource
>
{
    
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    
    NSDictionary *_baoxiuDidcionary;
}
@end

@implementation JJBaoxiuXiangqingController

- (instancetype)initWithBaoxiuDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _baoxiuDidcionary = dictionary;
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
    [self downloadBaoxiuXiangqingDataWithDictionary:nil];
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
}

- (void)downloadBaoxiuXiangqingDataWithDictionary:(NSDictionary *)dictionary{
    [self showHudInView:self.view hint:@"Loading"];
    NSLog(@"%@",_baoxiuDidcionary[@"glx"]);
    NSDictionary *request = @{@"action"     :@"bxxx",
                              @"glx"       :_baoxiuDidcionary[@"glx"],
                              };
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
        [self hideHud];
        NSLog(@"%@",dataDictionary);
        _dataArray = [[NSMutableArray alloc] initWithArray:dataDictionary[@"Bxx"]];
        [_tableView reloadData];
        if (![dataDictionary[@"Bxx"] count]) {
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
    
    
    CGFloat guzhangNeirongHeight = [[JJExtern sharedJJ] boundingRectWithSize:CGSizeMake(SIZE.width - 89, MAXFLOAT) text:[NSString stringWithFormat:@"报修内容:  %@",_dataArray[indexPath.row][@"nr"]] font:JJBAOXIU2FONT].height;
    if (guzhangNeirongHeight < 21.f) {
        guzhangNeirongHeight = 21.f;
    }
    CGFloat wanchengJieguoHeight = [[JJExtern sharedJJ] boundingRectWithSize:CGSizeMake(SIZE.width - 89, MAXFLOAT) text:[NSString stringWithFormat:@"报修结果:  %@",_dataArray[indexPath.row][@"Jg"]] font:JJBAOXIU2FONT].height;
    if (wanchengJieguoHeight < 21.f) {
        wanchengJieguoHeight = 21.f;
    }
    CGFloat allHeight = guzhangNeirongHeight + 8 + wanchengJieguoHeight;
    return 191 + allHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JJBaoxiuXiangqingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JJBaoxiuXiangqingCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"JJBaoxiuXiangqingCell" owner:self options:nil][0];
    }
    [cell changeDataWithDictionary:_dataArray[indexPath.row]];
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

//  Jg = "<null>";------------------------------------结果
//  Uid = "<null>";-----------------------------------账号id
//  bxr = cjz;----------------------------------------报修人
//  bxtel = 25896314;---------------------------------报修电话
//  fbz = 1;------------------------------------------
//  gcs = cjz;----------------------------------------工程师
//  glx = "\U51fa\U5165\U6821,\U8bfb\U62a5\U673a";----故障类型
//  id = 3;-------------------------------------------此信息id
//  images = "<null>";--------------------------------图片
//  jsb = 1;------------------------------------------
//  kh = "\U8861\U4e2d";------------------------------客户
//  kst = "<null>";-----------------------------------开始时间
//  nr = adfrfe;--------------------------------------内容
//  wbz = 1;------------------------------------------
//  wct = "2016-10-01T00:00:00";----------------------完成时间
//  zzq = "2016-10-01T00:00:00";----------------------最终期限


//fbz是否发布的标志位
//jsb是否接受的标志位
//wbz是否完成的标志位









