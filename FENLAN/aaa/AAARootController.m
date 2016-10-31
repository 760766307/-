//
//  AAARootController.m
//  请假APP
//
//  Created by 杨剑 on 16/9/6.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "AAARootController.h"


#define CELLWIDTH 80


#define CELLCOUNT 4
#define CELLBORDERSIZE 20

@interface AAARootController ()
<
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

{
    
    
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    UICollectionView *_collectionView;

    
    
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
    
//    self.title = @"主界面";
    
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    // Do any additional setup after loading the view.
    
    [self createData];
    [self createUI];
    
}


//   http://images.missyuan.com/attachments/day_110518/20110518_11f578129597b680746e022z3P11111a.jpg
- (void)createData{

    _dataArray = [[NSMutableArray alloc] initWithArray:
                  @[@{@"headertitle":@"报修",
                      @"item":@[@{@"title":@"新增报修",@"imagename":@"xinzengbaoxiu"},
                                @{@"title":@"报修查询",@"imagename":@"baoxiuchaxun"},
                                @{@"title":@"新订单查询",@"imagename":@"xindingdanchaxun"},
                                @{@"title":@"未完成订单",@"imagename":@"weiwanchengdingdan"},
                                @{@"title":@"已完成订单",@"imagename":@"yiwanchengdingdan"},
                                ]},
                    @{@"headertitle":@"订单",
                      @"item":@[
//                                @{@"title":@"新订单查询",@"imagename":@"35"},
//                                @{@"title":@"未完成订单",@"imagename":@"45"},
//                                @{@"title":@"已完成订单",@"imagename":@"43"},
                                ],
                      },
                    ]
                  ];

}



- (void)createUI{
    // Do any additional setup after loading the view.
    
    //1,创建布局
    //网格视图需要一个布局来支撑自己,所以创建一个布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置滑动方向(默认就是垂直方向)
    //1是横向,023都是纵向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //创建网格视图 (必须有一个flowlayout对象)
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SIZE.width, SIZE.height - 64 - 49) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRed:0.96f green:0.95f blue:0.95f alpha:1.00f];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[AAAHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"jjheaderview"];
//    [_collectionView registerClass:[AAACoCell class] forCellWithReuseIdentifier:@"AAACoCell"];
    
    //注册cell
    [_collectionView registerNib:[UINib nibWithNibName:@"AAACoCell" bundle:nil] forCellWithReuseIdentifier:@"AAACoCell"];
    
    //注册段头
//    [_collectionView registerClass:[MyView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"www"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //设置分段数量
//    return 4;
    return _dataArray.count;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //每段展示多少个cell
//    NSLog(@"%lu",[_dataArray[section][@"item"] count]);
    return [_dataArray[section][@"item"] count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //单个cell的大小
    //如果改成刚刚好的宽度,但是还是显示少一个,因为默认横排两个cell之间的最低宽度为10
    return CGSizeMake(CELLWIDTH, CELLWIDTH + 20);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    //分别控制四个边缘的边距.
    //设置上,左,下,右,的边距,属于分段的.
    return UIEdgeInsetsMake(CELLBORDERSIZE, CELLBORDERSIZE, CELLBORDERSIZE, CELLBORDERSIZE);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    
    
    //事实上是列,如果是竖版的,那么按照横列.
    //纵向,每一排之间的间距.
    //设置分段内部的cell垂直方向的最小间隔
    //不影响两个分段之间的距离.
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    //事实上是行,如果是竖版的,那么按照竖行.
    //横排两个cell之间的距离,最小间隔,不能小于,要大于等于这个数.
    //在有的版本里面,会默认减掉10.也就是写10,但会返回0;在这里不是
    //或者说,滑动方向之间的间距
    
    return 10;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    //前面数字在横向滚动的时候有效,后面数字纵向滚动时有效.(无效的数值,是被处理成和屏幕相同宽度或者高度的数值)
    //头标的高度.如果不设置,默认为0,那么返回什么样的头标view都是无效不显示的.
    return CGSizeMake(0, 0);
    
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //设置段头,或者段尾
    //判断响应这个方法的是段头还是段尾.
    if (kind == UICollectionElementKindSectionHeader) {
        NSLog(@"头");
    } else {
        NSLog(@"尾");
    }
    AAAHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"jjheaderview" forIndexPath:indexPath];
    view.label.text = [NSString stringWithFormat:@"第%zd段",indexPath.section];
    return view;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //网格视图的cell必须提前注册.
    AAACoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AAACoCell" forIndexPath:indexPath];
    
    cell.titleLabel.text = _dataArray[indexPath.section][@"item"][indexPath.row][@"title"];
//    cell.titleImageView.image = [UIImage imageNamed:_dataArray[indexPath.section][@"item"][indexPath.row][@"imagename"]];
    cell.titleImageView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@",[[NSBundle mainBundle] pathForResource:_dataArray[indexPath.section][@"item"][indexPath.row][@"imagename"] ofType:@"png"]]];
    
    return cell;
}





- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //点击事件;
    NSLog(@"%zd,%zd",indexPath.section,indexPath.row);
    
    UIViewController *controller = [[UIViewController alloc] init];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            controller = [[JJBaoxiu1Controller alloc] init];
        }else if (indexPath.row == 1){
            controller = [[JJBaoxiu2Controller alloc] init];
        }else if (indexPath.row == 2){
            controller = [[JJDingdan1Controller alloc] init];

        }else if (indexPath.row == 3){
            controller = [[JJDingdan2Controller alloc] init];

        }else if (indexPath.row == 4){
            controller = [[JJDingdan3Controller alloc] init];

        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"出现了一个小小的未知错误" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }]];
            [self presentViewController:alert animated:true completion:nil];
            return;
        }
    }else if (indexPath.section == 1){
//        if (indexPath.row == 0) {
//            controller = [[JJDingdan1Controller alloc] init];
//        }else if (indexPath.row == 1){
//            controller = [[JJDingdan2Controller alloc] init];
//        }else if (indexPath.row == 2){
//            controller = [[JJDingdan3Controller alloc] init];
//        }else{
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"出现了一个小小的未知错误" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }]];
            [self presentViewController:alert animated:true completion:nil];
            return;
//        }
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"出现了一个小小的未知错误" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [self presentViewController:alert animated:true completion:nil];
        return;
    }
    controller.hidesBottomBarWhenPushed = 1;
    [self.navigationController pushViewController:controller animated:1];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








@end
























