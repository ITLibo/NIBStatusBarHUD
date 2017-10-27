//
//  NIBStatusBarHUD.m
//  NIBStatusBarHUD
//
//  Created by 李博 on 2017/10/24.
//  Copyright © 2017年 libo2130. All rights reserved.
//

#import "NIBStatusBarHUD.h"

#define XMGMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const XMGMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const XMGAnimationDuration = 0.25;

@implementation NIBStatusBarHUD

static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;
/**
 * 显示窗口
 */
+ (void)showWindow{
    

    CGFloat windowH = 30;
    
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //防止window销毁不及时 带来的影响
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.frame = frame;
    //[window_ setBackgroundColor:[UIColor whiteColor]];
    //最高级别
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        window_.frame = frame;
    } completion:nil];
}
/**
 * 显示错误信息
 */
+ (void)showError:(NSString *)error{

    [self showMessage:error image:[UIImage imageNamed:@"NIBStatusBarHUD.bundle/HUDerror"]];
}
/**
 * 显示成功信息
 */
+ (void)showSucces:(NSString *)success{

    [self showMessage:success image:[UIImage imageNamed:@"NIBStatusBarHUD.bundle/HUDsuccess"]];
    
}
/**
 * 显示文字
 */
+ (void)showMessage:(NSString *)message{
    
    [self showMessage:message image:nil];
    
}
/**
* 显示普通信息
* @param msg       文字
* @param image     图片
*/
+ (void)showMessage:(NSString *)msg image:(UIImage *)image{
    
    // 停止定时器
    [timer_ invalidate];
    
    [self showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.frame;
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:msg forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    [window_ addSubview:button];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        [self dismiss];
//    });
}
/**
 * 显示正在处理的信息
 */
+ (void)showLoading:(NSString *)load{
    
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    
    UIActivityIndicatorView *loginView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGSize sizes = [load sizeWithAttributes:@{NSFontAttributeName:XMGMessageFont}];
    
    loginView.center =CGPointMake(window_.frame.size.width * 0.5 - sizes.width,window_.frame.size.height * 0.5);
    
    [loginView startAnimating];
    [window_ addSubview:loginView];
    UILabel *title = [[UILabel alloc]init];
    title.frame = window_.frame;
    [title setFont:XMGMessageFont];
    [title setTextColor:[UIColor whiteColor]];
    [title setTextAlignment:NSTextAlignmentCenter];
    title.text = load;
    [window_ addSubview:title];
    
}/**
  * 隐藏
  */
+ (void)dismiss{
    
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
    
   
}

@end
