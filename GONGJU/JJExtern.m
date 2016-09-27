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
            //在这里写下想给的初始值.
            
            _userid = [[NSUserDefaults standardUserDefaults] objectForKey:@"userid"];
            _username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
            _userpassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"userpassword"];
            _urlString = @"http://10.10.50.249:85/jky.aspx?";
//            url = "http://10.10.50.246:93/";
            
            _registrationID = @"";
            
            _zhuceTuisong = 0;
            
            //______________________________
            return self;
        }
        return nil;
    }
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

- (void)setRegistrationID:(NSString *)registrationID{
    
    if (registrationID == NULL) {
        registrationID = @"";
    }
    _registrationID = registrationID;
    _zhuceTuisong = 1;
    if (_signBlock) {
        if (_registrationID.length) {
            _signBlock(1);
        }else{
            _signBlock(0);
        }
    }
}





@end














