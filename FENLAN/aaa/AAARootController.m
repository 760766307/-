//
//  AAARootController.m
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "AAARootController.h"

@interface AAARootController ()
<
UITableViewDelegate,
UITableViewDataSource
>

{
    
    
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    
    
    
}
@end

@implementation AAARootController
- (instancetype)initWithBlock:(JJAAABlock)block
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
    
    
    self.title = @"主界面";
    
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClick:)];
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    
    
    
    // Do any additional setup after loading the view.
    
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


//   http://images.missyuan.com/attachments/day_110518/20110518_11f578129597b680746e022z3P11111a.jpg
- (void)createData{
    
    //    "stuid": 6,
    //    "stuname":"李四",
    //    "stupic": "http://346.jpg"
    
    _dataArray = [[NSMutableArray alloc] init];
    if ([[JJExtern sharedJJ].role intValue] > 2) {
        [_dataArray addObject:@{@"title":@"审批",
                                @"imagename":@"shenpi",
                                @"roleid":@"2",
                                @"isLeave":@"1"}];
    }
    [_dataArray addObject:@{@"title":@"记录",
                            @"imagename":@"jilu",
                            @"roleid":@"1",
                            @"isLeave":@"1"}];

}




- (void)createUI{

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SIZE.width, SIZE.height - 64 - 49) style:0];
    _tableView.backgroundColor = [UIColor colorWithRed:0.89f green:0.89f blue:0.89f alpha:1.00f];;;
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
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AAACell *cell = [tableView dequeueReusableCellWithIdentifier:@"AAACell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"AAACell" owner:self options:nil][0];
    }
//    cell.textLabel.text = _dataArray[indexPath.row][@"stuname"];
    [cell changeDataWithDictionary:_dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    [self.view endEditing:1];
    int controllerIndex = -1;
    if ([[JJExtern sharedJJ].role intValue] > 2) {
        if (indexPath.row == 0) {
            //审批
            controllerIndex = 1;
        }else if (indexPath.row == 1) {
            //记录
            controllerIndex = 0;
        }else{
            //无
            controllerIndex = -1;
        }
    }else{
        if (indexPath.row == 0) {
            //记录
            controllerIndex = 0;
        }else{
            //无
            controllerIndex = -1;

        }
    }
    [self pushViewControllerWithControllerIndex:controllerIndex andIndexPath:indexPath];
}

- (void)pushViewControllerWithControllerIndex:(int)controllerIndex andIndexPath:(NSIndexPath *)indexPath{


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








@end
























