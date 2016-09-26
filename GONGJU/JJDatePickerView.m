//
//  JJDatePickerView.m
//  请假APP
//
//  Created by 杨剑 on 16/9/9.
//  Copyright © 2016年 杨剑. All rights reserved.
//

#import "JJDatePickerView.h"

#define CONTENTWIDTH 300
#define CONTENTHEIGHT 250


@interface JJDatePickerView()
{
    
//    UIView *_backgroundView;
    UIView *_contentView;
    UIDatePicker *_datePicker;

//    UIButton *_shangwuButton;
//    UIButton *_xiawuButton;
    
    UIButton *_backButton;
    UIButton *_okButton;

    
}
@end

@implementation JJDatePickerView



- (instancetype)initWithViewController:(UIViewController *)viewController andJJDatePickerBlock:(JJDatePickerBlock)block
{
    
    JJDatePickerView *view = [self initWithViewController:viewController];
//    self = [super init];
//    if (self) {
//        
        _block = block;
        
//        
//    }
//    return self;
    
    return view;
}

- (instancetype)initWithViewController:(UIViewController *)viewController
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.88f green:0.88f blue:0.87f alpha:0.7f];
        self.frame = CGRectMake(0, 0, SIZE.width, SIZE.height);
        NSLog(@"%f",SIZE.width);
        
        _contentView = [[UIView alloc] init];
        //        _contentView.frame = CGRectMake((SIZE.width - CONTENTWIDTH - 40) / 2, (SIZE.height - CONTENTHEIGHT - 40) / 2, CONTENTWIDTH + 40, CONTENTHEIGHT + 40);
        _contentView.frame = CGRectMake((SIZE.width - CONTENTWIDTH ) / 2, (SIZE.height - CONTENTHEIGHT ) / 2, CONTENTWIDTH, CONTENTHEIGHT);
        _contentView.backgroundColor = BAISE;
        _contentView.layer.cornerRadius = 6;
        _contentView.layer.borderWidth = 0.6;
        _contentView.layer.borderColor = BAISE.CGColor;
        _contentView.layer.masksToBounds = 1;
        
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.frame = CGRectMake(0, 0, CONTENTWIDTH, CONTENTHEIGHT - 40);
        _datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-CN"];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;

        //        typedef enum {
        //            UIDatePickerModeTime,
        //            UIDatePickerModeDate,
        //            UIDatePickerModeDateAndTime,
        //            UIDatePickerModeCountDownTimer
        //        } UIDatePickerMode;
        
        [_datePicker addTarget:self action:@selector(datePickerClick:) forControlEvents:UIControlEventValueChanged];
        [_contentView addSubview:_datePicker];
#if 0
        _shangwuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shangwuButton.frame = CGRectMake(0, CONTENTHEIGHT - 80, CONTENTWIDTH / 2, 40);
        _shangwuButton.layer.cornerRadius = 3;
        //        _shangwuButton.layer.borderWidth = 0.6;
        //        _shangwuButton.layer.borderColor = BAISE.CGColor;
        _shangwuButton.layer.masksToBounds = 1;
        [_shangwuButton setTitle:@"上午" forState:UIControlStateNormal];
        [_shangwuButton setTitleColor:[UIColor colorWithRed:0.04f green:0.40f blue:0.83f alpha:1.00f] forState:UIControlStateNormal];
        [_shangwuButton setBackgroundImage:[UIImage imageNamed:@"normalButton"] forState:UIControlStateNormal];
        [_shangwuButton setBackgroundImage:[UIImage imageNamed:@"selectbutton"] forState:UIControlStateSelected];
        _shangwuButton.tag = 111;
        [_shangwuButton addTarget:self action:@selector(noonButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_shangwuButton];

        _xiawuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _xiawuButton.frame = CGRectMake(CONTENTWIDTH / 2, CONTENTHEIGHT - 80, CONTENTWIDTH / 2, 40);
        _xiawuButton.layer.cornerRadius = 3;
        //        _shangwuButton.layer.borderWidth = 0.6;
        //        _shangwuButton.layer.borderColor = BAISE.CGColor;
        _xiawuButton.layer.masksToBounds = 1;
        [_xiawuButton setTitle:@"下午" forState:UIControlStateNormal];
        [_xiawuButton setTitleColor:[UIColor colorWithRed:0.04f green:0.40f blue:0.83f alpha:1.00f] forState:UIControlStateNormal];
        [_xiawuButton setBackgroundImage:[UIImage imageNamed:@"normalButton"] forState:UIControlStateNormal];
        [_xiawuButton setBackgroundImage:[UIImage imageNamed:@"selectbutton"] forState:UIControlStateSelected];
        _xiawuButton.tag = 112;
        [_xiawuButton addTarget:self action:@selector(noonButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_xiawuButton];
        
        _shangwuButton.selected = 1;
#endif

        
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, CONTENTHEIGHT - 40, CONTENTWIDTH / 2, 40);
        [_backButton setTitle:@"取消" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor colorWithRed:0.04f green:0.40f blue:0.83f alpha:1.00f] forState:UIControlStateNormal];
        _backButton.tag = 100;
        [_backButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_backButton];
        
        _okButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _okButton.frame = CGRectMake(CONTENTWIDTH / 2, CONTENTHEIGHT - 40, CONTENTWIDTH / 2, 40);
        [_okButton setTitle:@"确定" forState:UIControlStateNormal];
        [_okButton setTitleColor:[UIColor colorWithRed:0.04f green:0.40f blue:0.83f alpha:1.00f] forState:UIControlStateNormal];
        _okButton.tag = 101;
        [_okButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_okButton];
        
        
        
        
        
        
        
        
        [viewController.view addSubview:self];
        [viewController.view addSubview:_contentView];
        
        
        
        self.alpha = 0.1f;
        _contentView.alpha = 0.1f;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
}


- (void)datePickerClick:(UIDatePicker *)datePicker{
    NSDate *date = datePicker.date;
    NSLog(@"%@~~~~~~~~~~~~~~~~~~",date);
    
}

//- (void)noonButtonClick:(UIButton *)button{
//    if (button.selected) {
//        return;
//    }
//    _shangwuButton.selected = 0;
//    _xiawuButton.selected = 0;
//    button.selected = 1;
//}


- (void)buttonClick:(UIButton *)button{
    if (button.tag == 100) {
        [self end];
        return;
    }

    
//    NSString *dateString = @"2016-06-01 18:00:00";
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"YYYY-MM-d HH:mm:ss"];
//    NSDate *date = [formatter dateFromString:dateString];
    
    NSDate *date = [self getNowDateFromatAnWorldDate:_datePicker.date];
    
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSLog(@"%@~~~~~~~~~~~~~~~~~~",[formatter dateFromString:[NSString stringWithFormat:@"%@",date]]);
    
    //(_shangwuButton.selected?@"上午":@"下午"
//    [date description];
    
    //    NSString *title = [NSString stringWithFormat:@"%@ %@",[[date description] substringWithRange:NSMakeRange(0, 10)],_shangwuButton.selected?@"上午":@"下午"];
    //    NSString *title1 = [NSString stringWithFormat:@"%@ %@",[[NSString stringWithFormat:@"%@",_datePicker.date] substringWithRange:NSMakeRange(0, 10)],_shangwuButton.selected?@"上午":@"下午"];

    NSString *title = [[date description] substringWithRange:NSMakeRange(0, 16)];

    
    
    
    
    if (_block) {
        _block(@{@"tag":[NSString stringWithFormat:@"%ld",button.tag],
                 @"title":title,
//                 @"noon":_shangwuButton.selected?@"上午":@"下午",
                 @"nian":[[date description] substringWithRange:NSMakeRange(0, 4)],
                 @"yue":[[date description] substringWithRange:NSMakeRange(5, 2)],
                 @"ri":[[date description] substringWithRange:NSMakeRange(8, 2)]
                 });
    }
    
    [self end];
}

- (NSDate *)getNowDateFromatAnWorldDate:(NSDate *)anyDate
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}



- (void)begin{
    
    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 0.7f;
        _contentView.alpha = 0.98f;
        
    } completion:^(BOOL finished) {
        
    }];
    

    


}

- (void)end{

    [UIView animateWithDuration:0.1 animations:^{
        self.alpha = 0.1f;
        _contentView.alpha = 0.1f;
    } completion:^(BOOL finished) {
        [_contentView removeFromSuperview];
        [self removeFromSuperview];
    }];
    
}






@end













