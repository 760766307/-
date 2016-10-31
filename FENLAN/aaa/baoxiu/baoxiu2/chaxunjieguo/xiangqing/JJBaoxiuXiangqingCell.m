//
//  JJBaoxiuXiangqingCell.m
//  鑫考报修
//
//  Created by 杨剑 on 16/9/28.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import "JJBaoxiuXiangqingCell.h"


@implementation JJBaoxiuXiangqingCell
{

    UILabel *_guzhangNeirongLabel;
    UILabel *_wanchengJieguoLabel;

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _guzhangNeirongLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 182, SIZE.width - 16, 21)];//从153开头.
    _guzhangNeirongLabel.numberOfLines = 0;
    _guzhangNeirongLabel.font = JJBAOXIU2FONT;
    _guzhangNeirongLabel.text = @"故障内容:  ";
    [self addSubview:_guzhangNeirongLabel];
    
    //182
    _wanchengJieguoLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 211, SIZE.width - 16, 21)];//从153开头.
    _wanchengJieguoLabel.numberOfLines = 0;
    _wanchengJieguoLabel.font = JJBAOXIU2FONT;
    _wanchengJieguoLabel.text = @"完成结果:  ";
    [self addSubview:_wanchengJieguoLabel];
    
    
    


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)changeDataWithDictionary:(NSDictionary *)dictionary{
    
    //  Jg = "<null>";------------------------------------结果000000000+++
    //  bxr = cjz;----------------------------------------报修人00000000
    //  bxtel = 25896314;---------------------------------报修电话000000
    //  gcs = cjz;----------------------------------------工程师00000000
    //  glx = "\U51fa\U5165\U6821,\U8bfb\U62a5\U673a";----故障类型000000+++
    //  images = "<null>";--------------------------------图片000000000
    //  kh = "\U8861\U4e2d";------------------------------客户000000000+++
    //  kst = "<null>";-----------------------------------开始时间000000+++
    //  nr = adfrfe;--------------------------------------内容000000000+++
    //  wct = "2016-10-01T00:00:00";----------------------完成时间000000+++
    //  zzq = "2016-10-01T00:00:00";----------------------最终期限000000+++

    
    _kehuLabel.text = [NSString stringWithFormat:@"%@",dictionary[@"kh"]];
    _guzhangLeixingLabel.text = [NSString stringWithFormat:@"%@",dictionary[@"glx"]];
    _baoxiuRenLabel.text = [NSString stringWithFormat:@"%@   %@",dictionary[@"bxr"],dictionary[@"bxtel"]]  ;//bxtel
    _zuizhongQixianLabel.text = [NSString stringWithFormat:@"%@",dictionary[@"zzq"]];
    _kaishiShijianLabel.text = [NSString stringWithFormat:@"%@",dictionary[@"kst"]];
    _jieshuShijianLabel.text = [NSString stringWithFormat:@"%@",dictionary[@"wct"]];
    
    
    
    
    
    
    
    
    
    
    [self setGuzhangNeirong:[NSString stringWithFormat:@"报修内容:  %@",dictionary[@"nr"]] andWanchengJieguo:[NSString stringWithFormat:@"报修结果:  %@",dictionary[@"Jg"]]];
    
}

- (void)setGuzhangNeirong:(NSString *)guzhangNeirong andWanchengJieguo:(NSString *)wanchengJieguo{

    CGFloat guzhangNeirongHeight = [[JJExtern sharedJJ] boundingRectWithSize:CGSizeMake(SIZE.width - 89, MAXFLOAT) text:guzhangNeirong font:JJBAOXIU2FONT].height;
    if (guzhangNeirongHeight < 21.f) {
        guzhangNeirongHeight = 21.f;
    }

    
    CGFloat wanchengJieguoHeight = [[JJExtern sharedJJ] boundingRectWithSize:CGSizeMake(SIZE.width - 89, MAXFLOAT) text:wanchengJieguo font:JJBAOXIU2FONT].height;
    if (wanchengJieguoHeight < 21.f) {
        wanchengJieguoHeight = 21.f;
    }
    
    
    _guzhangNeirongLabel.frame = CGRectMake(8, 182, SIZE.width - 16, guzhangNeirongHeight);
    _guzhangNeirongLabel.text = guzhangNeirong;
    
    
    _wanchengJieguoLabel.frame = CGRectMake(8, 182 + 8 + guzhangNeirongHeight, SIZE.width - 16, wanchengJieguoHeight);
    _wanchengJieguoLabel.text = wanchengJieguo;
    
//    _guzhangLeixingLabel.numberOfLines = 0;
//    _wanchengJieguoLabel.numberOfLines = 0;

}




@end














