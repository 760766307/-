//
//  AppDelegate.h
//  鑫考报修
//
//  Created by 杨剑 on 16/9/21.
//  Copyright © 2016年 贱贱. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "JPUSHService.h"


static NSString *appKey = @"c524a6241d1409f3f539225d";
static NSString *channel = @"97514a9151871cf3977a8065";
static BOOL isProduction = FALSE;



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) LeftSlideViewController *LeftSlideVC;
//@property (strong, nonatomic) UINavigationController *mainNavigationController;

@end



#if 0

1登录______________________________________成功

2修改密码___________________________________

3客户模糊查询________________________________成功

4上传报修___________________________________json数据返回值只有一个1.无key  成功

5故障类型分级________________________________json数据有问题

6时间段查找报修记录 主要测试一下啊______________成功.但失败时还是有问题.

7报修详细___________________________________不太理解

8新订单查询_________________________________

9新订单接受_________________________________

10未完成订单________________________________

11提交完成订单_______________________________

12查看完成订单_______________________________


######################


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1登录
action=Login
Utel  登录名
Upass密码
RegID 手机唯一ID
都不可为空，一个为空，返回resultcode:-5
http://10.10.50.249:85/jky.aspx?action=login&&Utel=123456&&Upass=111&&RegID=120c83f7602218e2122
成功  {"resultcode":"1","Uid":"1","Uname":"admin","Utel":"123456","Upass":"111","Urole":"0"}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
2修改密码
action=repass
Utel  用户名
Nupass   新密码
都不可为空，一个为空，返回resultcode:-5
http://10.10.50.249:85/jky.aspx?action=repass&&Utel=123456&&Nupass=123
成功  返回1


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3客户模糊查询
action=kmessage
Kname  客户名

空   返回全部学校
action=kmessage&&Kname=
{"khmessage":[{"Kid":1,
    "kname":"衡中","ktel":"115681"},
    {"Kid":2,"kname":"二中","ktel":"568877"},
    {"Kid":4,"kname":"十三中","ktel":"147852"}]}
action=kmessage&&Kname=三
{"khmessage":[{"Kid":4,"kname":"十三中","ktel":"147852"}]}



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4上传报修
action =Uploadbx
bxr   报修人
kh      客户
bxtel   报修电话
glx      故障类型
zzq      最终期限
nr         报修内容
都不可为空，一个为空，返回resultcode:-5
action=Uploadbx&&bxr=cj&&kh=hz&&bxtel=12349&&glx=5555&&zzq=2016/08/02%2017:42&&nr=wxncn
成功返回   1


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
5故障类型分级
action=YJbx
?action=YJbx
{YJBX:[{"Code":"1","Jbn":"一级","Name":"出入校系统","EJbx":[{"lev":"2 ","PID":"1 ","ID":"2 ","Code":2,"jbn":"二级 ","Name":"其他 ","HasChild":"2 ","parent":"1 "},{"lev":"2 ","PID":"1 ","ID":"3 ","Code":3,"jbn":"二级 ","Name":"网络问题 ","HasChild":"2 ","parent":"1 "}]},{"Code":"4","Jbn":"一级","Name":"读报机系统","EJbx":[{"lev":"2 ","PID":"1 ","ID":"2 ","Code":5,"jbn":"二级 ","Name":"操作系统问题 ","HasChild":"2 ","parent":"4 "},{"lev":"2 ","PID":"1 ","ID":"3 ","Code":6,"jbn":"二级 ","Name":"触摸屏问题 ","HasChild":"2 ","parent":"4 "},{"lev":"2 ","PID":"1 ","ID":"4 ","Code":7,"jbn":"二级 ","Name":"主板问题 ","HasChild":"2 ","parent":"4 "}]},{"Code":"8","Jbn":"一级","Name":"考勤机系统","EJbx":[{"lev":"2 ","PID":"1 ","ID":"2 ","Code":9,"jbn":"二级 ","Name":"其他 ","HasChild":"2 ","parent":"8 "},{"lev":"2 ","PID":"1 ","ID":"2 ","Code":10,"jbn":"二级 ","Name":"其他 ","HasChild":"2 ","parent":"8 "}]}]}



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
6时间段查找报修记录     主要测试一下啊
action=bxcs
kh 客户
kst   开始时间
wct    完成时间
为空全部
?action=bxcs&&
kh=衡中&&kst=2016/08/02%2017:42&&wct=2016/08/10%2017:42
{"Bxts":[{"glx":"其他","bxcs":1},{"glx":"网络问题","bxcs":1}]}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
报修详细
action=bxxx
glx   故障类型
?action=bxxx&&glx=网络问题
{"Bxx":[{"id":1,"bxr":null,"gcs":"cjz","Uid":2,"nr":"服务器故障","kh":"衡中","bxtel":"115689","zzq":"aaaaaaa","kst":"2016/08/02 17:42","wct":"2016/08/03 17:42","glx":"网络问题","fbz":1,"wbz":0,"jsb":1,"Jg":"修理完成","images":"bimages/20167161716194874.jpeg,bimages/20167161716194874.jpeg"},{"id":3,"bxr":null,"gcs":"zyx","Uid":3,"nr":"服务器故障","kh":"衡中","bxtel":"115689","zzq":"aaaaaaa","kst":"2016/08/02 17:42","wct":"2016/08/06 17:42","glx":"网络问题","fbz":1,"wbz":1,"jsb":1,"Jg":"修理完成","images":"bimages/20167161716194874.jpeg"},{"id":4,"bxr":null,"gcs":"zyx","Uid":3,"nr":"服务器故障","kh":"衡中","bxtel":"115689","zzq":"aaaaaaa","kst":"2016/08/02 17:42","wct":"2016/08/10 17:42","glx":"网络问题","fbz":1,"wbz":1,"jsb":1,"Jg":"修理完成","images":"bimages/201689100495329.png"}]}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
新订单查询
action=xddc
gcs  工程师
空则resultcode\":-5
action=xddc&&gcs=cjz
{"Xdc":[{"id":7,"nr":"服务器错误","kh":"二中","bxtel":"衡中","zzq":"2016年08月03日 09:11","glx":"触摸屏问题"},{"id":8,"nr":"服务器错误","kh":"1","bxtel":"110","zzq":"2016年08月03日 09:16","glx":"主板问题 "},
    {"id":9,"nr":null,
        "kh":"二中","bxtel":"12345678","zzq":"2016/08/19 上午","glx":"触摸屏问题 "},
    {"id":10,"nr":null,"kh":"二中","bxtel":"12345678","zzq":" 上午","glx":"触摸屏问题 "}]}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
新订单接受
action=xdjs
id  订单号
空 resultcode\":-5
成功是1 ，不成功是0



//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
未完成订单
action=ydx
gcs     工程师
空resultcode\":-5
?action=ydx&&gcs=cjz
{"Xdc":[{"id":1,"nr":"服务器故障","kh":"衡中","bxtel":"115689","zzq":"aaaaaaa","glx":"网络问题"},{"id":2,"nr":"读卡器错误","kh":"衡中","bxtel":"115689","zzq":"qqq","glx":"其他"},{"id":13,"nr":"看你","kh":"二中","bxtel":"56469785","zzq":"2016/08/11 11:49","glx":"主板问题"}]}


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
提交完成订单
action=wcd
id  订单号
kh  客户
wct 完成时间
jg  完成结果
HttpPostedFile images 上传图片
都不可为空


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
查看完成订单
action=ywcd
gcs   工程师
?action=ywdx&&gcs=zyx







#endif