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








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
