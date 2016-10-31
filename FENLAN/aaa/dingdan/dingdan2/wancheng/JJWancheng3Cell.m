//
//  JJWancheng3Cell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/27.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJWancheng3Cell.h"

#define ImageCount 5


@implementation JJWancheng3Cell
{
    
    
    
    UIScrollView *_scrollView;
    UIButton *_addImageButton;
    
    CGFloat _wh;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    _wh = SIZE.width / 3.5;
//    self.frame = CGRectMake(0, 0, SIZE.width, _wh + 203);
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, SIZE.width, _wh)];
    _scrollView.backgroundColor = [UIColor colorWithRed:0.95f green:0.94f blue:0.95f alpha:1.00f];
    _scrollView.contentSize = CGSizeMake( _wh, _wh);
    _addImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addImageButton.frame = CGRectMake(10, 14, _wh - 20, _wh - 28);
    [_addImageButton setImage:[UIImage imageNamed:@"jjAddImage.png"] forState:UIControlStateNormal];
    _addImageButton.tag = 11;
    [_addImageButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_addImageButton];
    [self addSubview:_scrollView];}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)buttonClick:(UIButton *)button {
    NSString *buttontag = [NSString stringWithFormat:@"%ld",(long)button.tag];
    
    self.block(self.celltag,@{@"text":@"添加照片",@"buttontag":buttontag});

//    if (button.tag == 11) {
//        self.block(self.celltag,@{@"text":@"添加照片",@"buttontag":buttontag});
//    }else if (button.tag >= 200){
//        self.block(self.celltag,@{@"text":@"照片",@"buttontag":buttontag});
//    }else if (button.tag >= 100){
//        self.block(self.celltag,@{@"text":@"删除照片",@"buttontag":buttontag});
//    }
}

- (UIView *)imageButtonViewWithImageFilePath:(NSString *)path andIndex:(int)index{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(index * _wh, 0, _wh, _wh)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 14, _wh - 20, _wh - 28)];
    imageView.backgroundColor = BAISE;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageWithContentsOfFile:path];
    imageView.tag = 200 + index;
    [view addSubview:imageView];
    
    UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    removeButton.frame = CGRectMake(_wh - 24, 8, 20, 20);
    [removeButton setImage:[UIImage imageNamed:@"jjerror"] forState:UIControlStateNormal];
    removeButton.tag = 100 + index;
    [removeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:removeButton];
    return view;
}
- (void)insertImagesWithImageFilePathsArray:(NSArray *)filePaths{
    NSArray *oldArray = _scrollView.subviews;
    for (UIView *oldView in oldArray) {
        if (oldView != _addImageButton) {
            [oldView removeFromSuperview];
        }
    }
    for (int i = 0 ; i < filePaths.count; i ++) {
        UIView *imageButtonView = [self imageButtonViewWithImageFilePath:filePaths[i] andIndex:i];
        //        UIView *imageButtonView = [self imageButtonViewWithImage:filePaths[i] andIndex:i];
        [_scrollView addSubview:imageButtonView];
    }
    _addImageButton.frame = CGRectMake(_wh * filePaths.count + 10, 14, _wh - 20, _wh - 28);
    if (filePaths.count < ImageCount) {
        _scrollView.contentSize = CGSizeMake((filePaths.count + 1) * _wh, _wh);
    }else{
        _scrollView.contentSize = CGSizeMake((filePaths.count) * _wh, _wh);
    }
    [self reloadAnimateWithIndex:filePaths.count];
}

#if 0

- (UIView *)imageButtonViewWithImage:(UIImage *)image andIndex:(int)index{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(index * _wh, 0, _wh, _wh)];

    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 14, _wh - 20, _wh - 28)];
    imageView.backgroundColor = BAISE;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    imageView.tag = 200 + index;
    [view addSubview:imageView];
    
    UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    removeButton.frame = CGRectMake(_wh - 24, 8, 20, 20);
    [removeButton setImage:[UIImage imageNamed:@"jjerror"] forState:UIControlStateNormal];
    removeButton.tag = 100 + index;
    [removeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:removeButton];
    return view;
}

- (void)insertImagesWithImagesArray:(NSArray *)images{
    NSArray *oldArray = _scrollView.subviews;
    for (UIView *oldView in oldArray) {
        if (oldView != _addImageButton) {
            [oldView removeFromSuperview];
        }
    }
    for (int i = 0 ; i < images.count; i ++) {
        UIView *imageButtonView = [self imageButtonViewWithImage:images[i] andIndex:i];
        [_scrollView addSubview:imageButtonView];
    }
    _addImageButton.frame = CGRectMake(_wh * images.count + 10, 14, _wh - 20, _wh - 28);
    if (images.count < ImageCount) {
        _scrollView.contentSize = CGSizeMake((images.count + 1) * _wh, _wh);
    }else{
        _scrollView.contentSize = CGSizeMake((images.count) * _wh, _wh);
    }
    [self reloadAnimateWithIndex:images.count];
}
#endif


- (void)reloadAnimateWithIndex:(long)index{
    if (_scrollView.contentSize.width > SIZE.width) {
        [_scrollView setContentOffset:CGPointMake(_scrollView.contentSize.width - SIZE.width, 0) animated:YES];
    }
}


- (void)changeDataWithModel:(JJWanchengModel *)model andIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *imageFileArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in model.imageArray) {
        NSLog(@"%@",dic[@"file"]);
        [imageFileArray addObject:dic[@"file"]];
    }
    if (imageFileArray.count > 5) {
        _addImageButton.hidden = 1;
    }else{
        _addImageButton.hidden = 0;
    }
    [self insertImagesWithImageFilePathsArray:imageFileArray];
}

- (void)changeTypeWithDictionary:(NSDictionary *)typeDictionary{
    
    
}


@end












