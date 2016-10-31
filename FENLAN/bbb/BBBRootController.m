//
//  BBBRootController.m
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "BBBRootController.h"

@interface BBBRootController ()
//<
//UITableViewDelegate,
//UITableViewDataSource
//>
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
    self.view.backgroundColor = BAISE;
    self.automaticallyAdjustsScrollViewInsets = 0;    //    NavigationType
    // Do any additional setup after loading the view.


    UILabel *zhanghaoLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, SIZE.width - 60, 35)];
    zhanghaoLabel.textColor = [UIColor colorWithRed:0.78f green:0.58f blue:0.00f alpha:1.00f];
        zhanghaoLabel.textAlignment = 1;
    zhanghaoLabel.text = @"暂无新通知";
    [self.view addSubview:zhanghaoLabel];
    
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
