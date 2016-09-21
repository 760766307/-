//
//  ViewController.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/21.
//  Copyright © 2016年 贱贱. All rights reserved.
//
//



#import "ViewController.h"
#import "LLSlideMenu.h"


#define SLIDEMENU_WIDTH 200.f


@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
{
    
    UIImageView *_headImageView;
    UILabel *_nameLabel;
    
    
    NSMutableArray *_slideMenuDataArray;

    UITableView *_slideMenuTableView;
    
    
    
}

@property (nonatomic, strong) LLSlideMenu *slideMenu;

// 全屏侧滑手势
@property (nonatomic, strong) UIPanGestureRecognizer *leftSwipe;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化
    
    self.view.backgroundColor = BAISE;
    
//    self.view.frame.size.width;
    [self createCehuaUI];
    
    
    
    
    
    
    
    
    
}

- (IBAction)leftBarButtonItemClick:(UIBarButtonItem *)sender {
    //===================
    // 按钮监听
    //===================
    //===================
    // 打开菜单
    //===================
    if (_slideMenu.ll_isOpen) {
        [_slideMenu ll_closeSlideMenu];
    } else {
        [_slideMenu ll_openSlideMenu];
    }
  
}















- (void)createCehuaUI{

    //    self.viewControllers
    
    _slideMenu = [[LLSlideMenu alloc] init];
    [self.view addSubview:_slideMenu];
    // 设置菜单宽度
    _slideMenu.ll_menuWidth = SLIDEMENU_WIDTH;
    // 设置菜单背景色
    _slideMenu.ll_menuBackgroundColor = [UIColor redColor];
    // 设置弹力和速度，  默认的是20,15,60
    _slideMenu.ll_springDamping = 30;       // 阻力
    _slideMenu.ll_springVelocity = 30;      // 速度
    _slideMenu.ll_springFramesNum = 60;     // 关键帧数量

    
    
    
    //===================
    // 添加全屏侧滑手势
    //===================
    self.leftSwipe = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftHandle:)];
    self.leftSwipe.maximumNumberOfTouches = 1;
    [self.view addGestureRecognizer:_leftSwipe];
    
    

    [self createOtherUI];
}

- (void)createOtherUI{
    
//    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(50, 40, 80, 80)];
//    [img setImage:[UIImage imageNamed:@"Head"]];
//    [_slideMenu addSubview:img];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 140, 150, 400)];
//    label.text = @"这是第一行菜单\n\n这是第二行菜单\n\n这是第三行菜单\n\n这是第四行菜单\n\n这是第五行菜单\n\n这是第六行菜单\n\n这是第七行菜单\n\n这是第八行菜单\n\n这是第九行菜单\n\n这是第十行菜单";
//    [label setTextColor:[UIColor whiteColor]];
//    [label setNumberOfLines:0];
//    [_slideMenu addSubview:label];
    
    
    _headImageView = [[UIImageView alloc] init];
    _headImageView.frame = CGRectMake( (SLIDEMENU_WIDTH - 100) / 2, 60, 100, 100);
    _headImageView.layer.masksToBounds = 1;
    _headImageView.layer.cornerRadius = 50;
//    _headImageView.layer.borderWidth = 0.6;
//    _headImageView.layer.borderColor = BAISE.CGColor;
    
    _headImageView.image = [UIImage imageNamed:@"xinkaotitle"];
    [_slideMenu addSubview:_headImageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake( 0, 180, SLIDEMENU_WIDTH, 30)];
    _nameLabel.textColor = [UIColor colorWithRed:0.07f green:0.15f blue:0.32f alpha:1.00f];
    _nameLabel.textAlignment = 1;
    _nameLabel.textColor = [UIColor colorWithRed:0.78f green:0.58f blue:0.00f alpha:1.00f];
    _nameLabel.text = @"学校";
    [_slideMenu addSubview:_nameLabel];
    
    
    
    _slideMenuDataArray = [[NSMutableArray alloc] initWithArray:@[@"设置",
                                                         @"更新",
                                                         @"关于",
                                                         @"注销"
                                                         ]];
    
    
    _slideMenuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 220, SLIDEMENU_WIDTH, SIZE.height - 220) style:0];
    _slideMenuTableView.backgroundColor = [UIColor colorWithRed:0.89f green:0.89f blue:0.89f alpha:1.00f];;;
    _slideMenuTableView.dataSource = self;
    _slideMenuTableView.delegate = self;
    [_slideMenu addSubview:_slideMenuTableView];
    
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_slideMenuDataArray count];
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
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _slideMenuDataArray[indexPath.row];
    
    //    cell.textLabel.text = _dataArray[indexPath.row][@"stuname"];
//    [cell changeDataWithDictionary:_dataArray[indexPath.row]];
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




//===================
// 全屏侧滑手势监听
//===================
- (void)swipeLeftHandle:(UIScreenEdgePanGestureRecognizer *)recognizer {
    // 如果菜单已打开则禁止滑动
    if (_slideMenu.ll_isOpen) {
        return;
    }
    // 计算手指滑的物理距离（滑了多远，与起始位置无关）
    CGFloat progress = [recognizer translationInView:self.view].x / (self.view.bounds.size.width * 1.0);
    // 把这个百分比限制在 0~1 之间
    progress = MIN(1.0, MAX(0.0, progress));
    
    // 当手势刚刚开始，我们创建一个 UIPercentDrivenInteractiveTransition 对象
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.percent = [[UIPercentDrivenInteractiveTransition alloc] init];
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        // 当手慢慢划入时，我们把总体手势划入的进度告诉 UIPercentDrivenInteractiveTransition 对象。
        [self.percent updateInteractiveTransition:progress];
        _slideMenu.ll_distance = [recognizer translationInView:self.view].x;
        
    } else if (recognizer.state == UIGestureRecognizerStateCancelled || recognizer.state == UIGestureRecognizerStateEnded) {
        // 当手势结束，我们根据用户的手势进度来判断过渡是应该完成还是取消并相应的调用 finishInteractiveTransition 或者 cancelInteractiveTransition 方法.
        if (progress > 0.4) {
            [self.percent finishInteractiveTransition];
            [_slideMenu ll_openSlideMenu];
        }else{
            [self.percent cancelInteractiveTransition];
            [_slideMenu ll_closeSlideMenu];
        }
        self.percent = nil;
    }
}



@end











