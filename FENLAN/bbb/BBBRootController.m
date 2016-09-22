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
    self.view.backgroundColor = BAISE;
    self.automaticallyAdjustsScrollViewInsets = 0;    //    NavigationType
    // Do any additional setup after loading the view.


    
    
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
