//
//  JJExtern.m
//  ZNW_YHB
//
//  Created by 杨剑 on 15/12/24.
//  Copyright © 2015年  apple. All rights reserved.
//

#import "JJExtern.h"

@implementation JJExtern

static JJExtern *jj = nil;

+ (JJExtern *)sharedJJ{
    @synchronized (self){
        if (!jj) {
            jj = [[self alloc] init];
        }
        return jj;
    }
}

- (instancetype)init{
    @synchronized   (self){
        if(self = [super init])
        {
            //______________________________
            //在这里写下想给的初始值.h ttp://10.10.50.246:93/port.aspx?action=login&username=15297671359&pwd=123456
//            request = @{@"action"     :@"login",
//                        //                @"username"   :@"13722812531",15297671359
//                        //                @"username"   :@"15932426654",
            //                        @"username"   :@"15203285277",
//                        @"pwd"        :@"123456"};
            [self cehuaViewController];
            
            _userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"userid"];
            _username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
            _userpassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"userpassword"];
            
//            _username = @"13722812531";//教师
//            _username = @"15932426654";//年级主任
//            _username = @"15203285277";//学校管理员
//            _userpassword = @"123456";
            
            
            _serverURLString = @"http://121.17.126.21/CrxAPP/SchInfo.aspx?";
//            _schoolURLString = @"http://10.10.50.246:93/port.aspx?";
//            url = "http://10.10.50.246:93/";
            
            _schoolid = [[NSUserDefaults standardUserDefaults] objectForKey:@"schoolid"];
            _schoolname = [[NSUserDefaults standardUserDefaults] objectForKey:@"schoolname"];
            _schoolURLString = [[NSUserDefaults standardUserDefaults] objectForKey:@"schoolURLString"];
            
            NSLog(@"%@",_schoolURLString);
            //______________________________
            return self;
        }
        return nil;
    }
}

- (void)cehuaViewController{
//    JJCehuaController *mainVC = [[JJCehuaController alloc] init];
//    _mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    
    _tabbarController = [[JJTabbarController alloc] init];
    
    
    
    LeftSortsViewController *leftVC = [[LeftSortsViewController alloc] init];
//    _LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:_mainNavigationController];
    _LeftSlideVC = [[LeftSlideViewController alloc] initWithLeftView:leftVC andMainView:_tabbarController];
}








- (CGSize)boundingRectWithSize:(CGSize)size text:(NSString *)text font:(UIFont *)font{
    if ([text isEqualToString:@""]) {
        text = @" ";
    }
    if (text == nil) {
        text = @" ";
    }
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize retSize = [text boundingRectWithSize:size
                                        options:NSStringDrawingTruncatesLastVisibleLine
                      |NSStringDrawingUsesLineFragmentOrigin//拥有自动的高度
                      |NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil
                      ].size;
    return retSize;
}

- (NSString *)differentString{
    NSDate *senddate = [NSDate date];
    NSLog(@"date1时间戳 = %ld",time(NULL));
    NSLog(@"date2时间戳~~~ = %lf",[senddate timeIntervalSince1970]);
    
    int a = arc4random()%10;
    int b = arc4random()%10;

    NSString *differentString = [NSString stringWithFormat:@"%ld%d%d",(long)([senddate timeIntervalSince1970] * 100),a,b];
    NSLog(@"%@",differentString);
    return differentString;
    
}


- (void)setUsername:(NSString *)username{
    _username = username;
    [[NSUserDefaults standardUserDefaults] setObject:_username forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setUserpassword:(NSString *)userpassword{
    _userpassword = userpassword;
    [[NSUserDefaults standardUserDefaults] setObject:_userpassword forKey:@"userpassword"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setUserid:(NSString *)userid{
    _userid = userid;
    [[NSUserDefaults standardUserDefaults] setObject:_userid forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setSchoolid:(NSString *)schoolid{
    _schoolid = schoolid;
    [[NSUserDefaults standardUserDefaults] setObject:_schoolid forKey:@"schoolid"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setSchoolname:(NSString *)schoolname{
    _schoolname = schoolname;
    [[NSUserDefaults standardUserDefaults] setObject:_schoolname forKey:@"schoolname"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)setSchoolURLString:(NSString *)schoolURLString{
    _schoolURLString = schoolURLString;
    //            _schoolURLString = @"h ttp://10.10.50.246:93/port.aspx?";
    _schoolURLString = [NSString stringWithFormat:@"%@port.aspx?",schoolURLString];
    [[NSUserDefaults standardUserDefaults] setObject:_schoolURLString forKey:@"schoolURLString"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}





@end














