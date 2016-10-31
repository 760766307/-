//
//  JJWanchengController.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/27.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJWanchengController.h"


#import <AssetsLibrary/AssetsLibrary.h>

#import <Photos/Photos.h>

@interface JJWanchengController ()
<
UITableViewDelegate,
UITableViewDataSource,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>
{
    
    
//    HsProfitRatePieWidgets *_progressView;

    
    
    UIButton *_tijiaoButton;

    
    NSDictionary *_dingdanDictionary;
    
    NSMutableArray *_dataArray;
    UITableView *_tableView;

    JJDatePickerView *_datePickerView;

    NSMutableArray *_cellnameArray;
    JJWanchengModel *_model;
    
    NSIndexPath *_imageIndexPath;
 
    NSString *_createPath;
}




@end

@implementation JJWanchengController

- (instancetype)initWithDingdanDictionary:(NSDictionary *)dingdanDictionary
{
    self = [super init];
    if (self) {
        _dingdanDictionary = dingdanDictionary;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BAISE;
    self.automaticallyAdjustsScrollViewInsets = 0;
    
    self.title = @"提交订单";

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
    
    //        Cache目录
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    _createPath = [NSString stringWithFormat:@"%@/tijiaodingdan", path];
    
    _dataArray = [[NSMutableArray alloc] init];
    _cellnameArray = [[NSMutableArray alloc]
                      initWithArray:
                      @[
                        @{@"cellname":@"JJWancheng1Cell",
                          @"title":@"客户",
                          @"button":@"0",
                          @"edit":@"0",
                          @"placeholder":@"",
                          },
                        @{@"cellname":@"JJWancheng1Cell",
                          @"title":@"故障类型",
                          @"button":@"0",
                          @"edit":@"0",
                          @"placeholder":@"",

                          },
                        @{@"cellname":@"JJWancheng1Cell",
                          @"title":@"截止时间",
                          @"button":@"0",
                          @"edit":@"0",
                          @"placeholder":@"",

                          },
                        @{@"cellname":@"JJWancheng1Cell",
                          @"title":@"完成时间",
                          @"button":@"1",
                          @"edit":@"0",
                          @"placeholder":@"选择完成的时间",
                          },
                        @{@"cellname":@"JJWancheng1Cell",
                          @"title":@"完成状态",
                          @"button":@"1",
                          @"edit":@"0",
                          @"placeholder":@"选择完成的状态",
                          },
                        @{@"cellname":@"JJWancheng2Cell",
                          @"title":@"备注",
                          @"button":@"0",
                          @"edit":@"0",
                          @"placeholder":@"填写完成之后一些备注",
                          },
                        @{@"cellname":@"JJWancheng3Cell",
                          @"title":@"照片",
                          @"button":@"0",
                          @"edit":@"0",
                          @"placeholder":@"",
                          },
                        ]];
    _model = [[JJWanchengModel alloc] initWithDictionary:_dingdanDictionary];
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
    _tableView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    UIButton *endEditingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    endEditingButton.frame = CGRectMake(0, 0, _tableView.frame.size.width, _tableView.frame.size.height);
    [endEditingButton addTarget:self action:@selector(endEditingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_tableView setBackgroundView:endEditingButton];
    //实现方法//取消textView ,textField的第一响应者即可
}

- (void)endEditingButtonClick:(UIButton *)button{
    [self.view endEditing:1];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellnameArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_cellnameArray[indexPath.row][@"cellname"] isEqualToString:@"JJWancheng1Cell"]) {
        return 45;
    }else if ([_cellnameArray[indexPath.row][@"cellname"] isEqualToString:@"JJWancheng2Cell"]) {
        return 135;
    }else if ([_cellnameArray[indexPath.row][@"cellname"] isEqualToString:@"JJWancheng3Cell"]) {
        return SIZE.width / 3.5 + 30;
    }else{
        return 0;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JJWanchengSuperCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellnameArray[indexPath.row][@"cellname"]];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:_cellnameArray[indexPath.row][@"cellname"] owner:self options:nil][0];
    }
    [cell changeTypeWithDictionary:_cellnameArray[indexPath.row]];
    [cell changeDataWithModel:_model andIndexPath:indexPath];
    
    [cell setCelltag:indexPath.row andBlock:^(long celltag,NSDictionary *cellDictionary) {
        if (indexPath.row == 0) {//客户
            return ;
        }
        else if (indexPath.row == 1) {//故障类型
            return ;
        }
        else if (indexPath.row == 2) {//截止时间
            return ;
        }
        else if (indexPath.row == 3) {//完成时间
            _datePickerView = [[JJDatePickerView alloc] initWithViewController:self andJJDatePickerBlock:^(NSDictionary *dateDictionary) {
                _model.wanchengShijian = dateDictionary[@"text"];
                [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
            [_datePickerView addTarget:self action:@selector(datePickerViewBackgroundClick:) forControlEvents:UIControlEventTouchUpInside];
            [_datePickerView begin];
        }
        else if (indexPath.row == 4) {//完成状态
            [self showHint:@"此选项暂无作用"];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择完成状态" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"完全解决问题" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                _model.wanchengZhuangtai = @"完全解决问题";
                [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                return ;
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"暂时解决问题" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                _model.wanchengZhuangtai = @"暂时解决问题";
                [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                return ;
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"无法解决问题" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                _model.wanchengZhuangtai = @"无法解决问题";
                [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                return ;
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }]];
            [self presentViewController:alert animated:true completion:nil];
        }
        else if (indexPath.row == 5) {//备注
            _model.beizhu = cellDictionary[@"text"];
            [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
        else if (indexPath.row == 6) {//图片
            _imageIndexPath = indexPath;
            
            NSLog(@"%@",cellDictionary);
            
            if ([cellDictionary[@"buttontag"] intValue] == 11) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"添加照片" message:@"" preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self addImageWithCamera];
                    return ;
                }]];
                [alert addAction:[UIAlertAction actionWithTitle:@"从图库中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self addImageWithGallery];
                    return ;
                }]];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    return ;
                }]];
                [self presentViewController:alert animated:true completion:nil];
            }else if ([cellDictionary[@"buttontag"] intValue] >= 200) {
                return;
            }else if ([cellDictionary[@"buttontag"] intValue] >= 100) {
                [_model removeImageWithImageIndex:[cellDictionary[@"buttontag"] intValue] - 100];
                [_tableView reloadRowsAtIndexPaths:@[_imageIndexPath] withRowAnimation:NO];
            }else{
                return;
            }



            
        }
    }];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    [self.view endEditing:1];
}
- (void)datePickerViewBackgroundClick:(JJDatePickerView *)datePickerView{
    [datePickerView end];
}

- (void)buttonClick:(UIButton *)button{
    [self.view endEditing:1];
    [self showHudInView:self.view hint:@"Loading"];
//    提交完成订单
//    action=wcd
//    id  订单号
//    kh  客户
//    wct 完成时间
//    jg  完成结果
//    HttpPostedFile images 上传图片
    
    NSArray *imageArray = [_model getImageDataArray];
    
    NSDictionary *request = @{@"action"         :@"wcd",
                              @"id"             :_model.guzhangID,
                              @"kh"             :_model.kehu,
                              @"wct"            :_model.wanchengShijian,
                              @"jg"             :_model.beizhu,
                              };

    if (_model.imageArray.count) {
        request = @{@"action"         :@"wcd",
                    @"id"             :_model.guzhangID,
                    @"kh"             :_model.kehu,
                    @"wct"            :_model.wanchengShijian,
                    @"jg"             :_model.beizhu,
                    @"images" :@"",
                    };
        
        request = @{@"action"         :@"ioswcd",
                    @"id"             :_model.guzhangID,
                    @"kh"             :_model.kehu,
                    @"wct"            :_model.wanchengShijian,
                    @"jg"             :_model.beizhu,
//                    @"images"           :@"",
                    @"Imgs"              :[NSString stringWithFormat:@"%d",(int)_model.imageArray.count]
                    };
    }
    
    
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   \n\n {{{%@}}}",request);
    
    
#define GUZHANGCISHUMAX 4.0f
#define COLORMAX 0.92f
    


    
    [[JJDownload jj] downloadDataWithURLString:[JJExtern sharedJJ].urlString
                                 andDictionary:request
                                  andFileArray:imageArray
                             andUploadingBlock:^(NSDictionary *dataDictionary) {

                             }
                               andSuccessBlock:^(NSDictionary *dataDictionary) {
                                   NSLog(@"%@",dataDictionary);
                                   [self hideHud];
                                   [self hideHud];
                                   if ([dataDictionary[@"Result"] intValue] == 1) {
                                       [self showHint:@"提交成功"];
                                       [self.navigationController popViewControllerAnimated:1];
                                       [[NSFileManager defaultManager] removeItemAtPath:_createPath error:nil];
                                   }else{
                                       UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"提交失败." preferredStyle:UIAlertControllerStyleAlert];
                                       [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                           return ;
                                       }]];
                                       [self presentViewController:alert animated:true completion:nil];
                                   }
                                   
                               }
                                 andErrorBlock:^(int CanBeConnected, NSDictionary *dataDictionary) {
                                     [self hideHud];
                                     [self hideHud];
                                     UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"上传失败,原因不知道,建议换个顺序选择图片试试." preferredStyle:UIAlertControllerStyleAlert];
                                     [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                         return ;
                                     }]];
                                     [self presentViewController:alert animated:true completion:nil];
                                 }
     ];

    
    
}


- (void)downloadXindingdanDataWithDictionary:(NSDictionary *)dictionary{
    [self showHudInView:self.view hint:@"Loading"];
    
    NSDictionary *request = @{@"action"     :@"ydx",
                              @"gcs"       :[JJExtern sharedJJ].name,
                              };
    JJDownload *jj = [JJDownload jj];
    [jj downloadDataWithURLString:[JJExtern sharedJJ].urlString andDictionary:request andSuccessBlock:^(NSDictionary *dataDictionary) {
        [self hideHud];
        NSLog(@"%@",dataDictionary);
        _dataArray = [[NSMutableArray alloc] initWithArray:dataDictionary[@"Xdc"]];
        [_tableView reloadData];
        if (![dataDictionary[@"Xdc"] count]) {
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


//图片图库
- (void)addImageWithGallery{
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
    }];
    
    
    
    
    
}

//图片相机
- (void)addImageWithCamera{
    
    UIImagePickerControllerSourceType sourceType = 0;
    BOOL available = YES;   // 是否可用
    NSString *reason = nil;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        available = NO;
        reason = @"照相机";
    }
    if (available) {
        UIImagePickerController *takePicker = [[UIImagePickerController alloc] init];
        takePicker.sourceType = sourceType;
        takePicker.delegate = self;
        //设置选择后的图片可被编辑
                    takePicker.allowsEditing = YES;
        [self presentViewController:takePicker animated:YES completion:^{
        }];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"照相机不能使用,请检查相机." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [self presentViewController:alert animated:1 completion:nil];
    }
}

//如果全局变量会犯错,那么肯定在下面这两个方法里面,将(_index和_indexPath)替换成(_imageIndex和_imageIndexPath)
//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [self showHudInView:self.view hint:@"正在处理图片..."];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    NSLog(@"%@",info);
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"]){
        UIImage *newImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
        
        [picker dismissViewControllerAnimated:YES completion:^{

        
        if (newImage == nil){
            [self showHint:@"图片提取失败"];
            return;
        }
        NSLog(@"选照片");
        
//        UIImage *newImage = [self imageWithBigImage:bigImage scaledToSize:bigImage.size];
        
        NSData *imageData = nil;
//        NSString *imageType = @"";
        
        
        if (UIImageJPEGRepresentation(newImage,1) == nil) {
            imageData = UIImagePNGRepresentation(newImage);
        }else{
            imageData = UIImageJPEGRepresentation(newImage, 1.0f);
        }
//        NSLog(@"%@",[self typeForImageData:imageData]);
        
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
//        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        //Home目录NSString *homeDirectory = NSHomeDirectory();
        //Document目录NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *path = [paths objectAtIndex:0];
        
//        NSLog(@"%@",imageData);
        
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        // 判断文件夹是否存在，如果不存在，则创建
        if (![[NSFileManager defaultManager] fileExistsAtPath:_createPath]) {
            [fileManager createDirectoryAtPath:_createPath withIntermediateDirectories:YES attributes:nil error:nil];
        } else {
            NSLog(@"FileDir is exists.");
        }
        
        //@"bigImage.jpg"
        
        NSString *bigImagefilePathString = [NSString stringWithFormat:@"%@/bigImage.jpg",_createPath];
        for ([fileManager createFileAtPath:bigImagefilePathString contents:imageData attributes:nil];[[fileManager attributesOfItemAtPath:bigImagefilePathString error:nil] fileSize]/1024.0 > 1000; ) {
            UIImage *bigImage = [UIImage imageWithContentsOfFile:bigImagefilePathString];
            UIImage *smallImage = [self imageWithBigImage:bigImage scaledToSize:bigImage.size];
            if (UIImageJPEGRepresentation([self imageWithBigImage:smallImage scaledToSize:smallImage.size], 0.95f) == nil) {
                imageData = UIImagePNGRepresentation([self imageWithBigImage:smallImage scaledToSize:smallImage.size]);
            }else{
                imageData = UIImageJPEGRepresentation([self imageWithBigImage:smallImage scaledToSize:smallImage.size], 0.95f);
            }
            [fileManager createFileAtPath:bigImagefilePathString contents:imageData attributes:nil];
            NSLog(@"%lf",[[fileManager attributesOfItemAtPath:bigImagefilePathString error:nil] fileSize]/800.f);
            
        }
        
        
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
//        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        NSString *nameString = [NSString stringWithFormat:@"%@.jpg",[[JJExtern sharedJJ] differentString]];
        NSString *filePathString = [NSString stringWithFormat:@"%@/%@",_createPath,nameString];
        
        [fileManager createDirectoryAtPath:[filePathString stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];

        
        [fileManager createFileAtPath:filePathString contents:imageData attributes:nil];

        
        
        //得到选择后沙盒中图片的完整路径
        //上传    .........
//        NSString *filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
//        NSLog(@"%@",filePath);
        NSLog(@"%@",filePathString);
//        [_model addImageWithImage:newImage andImageFile:filePathString];
        [_model addImageFileWithString:filePathString andNameString:nameString];
            [self hideHud];
            [fileManager removeItemAtPath:bigImagefilePathString error:nil];
            [_tableView reloadRowsAtIndexPaths:@[_imageIndexPath] withRowAnimation:NO];
            
        }];
#if 0
        NSString* URLString = [[info objectForKey:UIImagePickerControllerReferenceURL]absoluteString];
        NSLog(@"照片路径是:%@",URLString);
        if(URLString.length > 0){
            NSLog(@"选照片");
            [_model addImageWithImage:newImage andImageFile:URLString];
            [picker dismissViewControllerAnimated:YES completion:^{
                [_tableView reloadRowsAtIndexPaths:@[_imageIndexPath] withRowAnimation:NO];
            }];
        }else{            //   https://segmentfault.com/q/1010000006703639
            NSLog(@"拍照");
            
            NSMutableArray *imageIds = [[NSMutableArray alloc] init];
            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                // Request creating an asset from the image.
                PHAssetChangeRequest *createAssetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:newImage];
                [imageIds addObject:createAssetRequest.placeholderForCreatedAsset.localIdentifier];
                
            } completionHandler:^(BOOL success, NSError *error) {
                if (success){
                    //成功后取相册中的图片对象
                    __block PHAsset *imageAsset = nil;
                    PHFetchResult *result = [PHAsset fetchAssetsWithLocalIdentifiers:imageIds options:nil];
                    [result enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        imageAsset = obj;
                        *stop = YES;
                    }];
                    if (imageAsset)
                    {
                        //加载图片数据
                        [[PHImageManager defaultManager]
                         requestImageDataForAsset:imageAsset
                         options:nil
                         resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
                             //                         NSLog("imageData = %@", imageData);
                             
                         }];
                    }
                }
                
            }];
            
        }
#endif

    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您选择的不是图片." preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            return ;
        }]];
        [self presentViewController:alert animated:1 completion:nil];
    }
}

-(UIImage*)imageWithBigImage:(UIImage *)image scaledToSize:(CGSize)newSize{
    // Create a graphics image context
    
    UIGraphicsBeginImageContext(CGSizeMake(newSize.width * 0.95,newSize.height * 0.95));
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width * 0.95,newSize.height * 0.95)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
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

- (NSString *)typeForImageData:(NSData *)data {
    
    
    uint8_t c;
    
    [data getBytes:&c length:1];
    
    
    
    switch (c) {
            
        case 0xFF:
            
            return @"image/jpeg";
            
        case 0x89:
            
            return @"image/png";
            
        case 0x47:
            
            return @"image/gif";
            
        case 0x49:
            
        case 0x4D:
            
            return @"image/tiff";
            
    }
    
    return nil;
    
}

@end



#if 0
NSMutableArray *imageIds = [[NSMutableArray alloc] init];
[[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
    // Request creating an asset from the image.
    PHAssetChangeRequest *createAssetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:newImage];
    [imageIds addObject:createAssetRequest.placeholderForCreatedAsset.localIdentifier];
    
} completionHandler:^(BOOL success, NSError *error) {
    
    if (success){
        //成功后取相册中的图片对象
        __block PHAsset *imageAsset = nil;
        PHFetchResult *result = [PHAsset fetchAssetsWithLocalIdentifiers:imageIds options:nil];
        [result enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            imageAsset = obj;
            *stop = YES;
            
        }];
        
        if (imageAsset)
        {
            //加载图片数据
            [[PHImageManager defaultManager]
             requestImageDataForAsset:imageAsset
             options:nil
             resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
                 //                         NSLog("imageData = %@", imageData);
                 
             }];
        }
    }];

#endif

