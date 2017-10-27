//
//  ViewController.m
//  NIBStatusBarHUDExample
//
//  Created by 李博 on 2017/10/27.
//  Copyright © 2017年 libo2130. All rights reserved.
//

#import "ViewController.h"
#import "NIBStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
/**
 * 显示成功信息
 */
- (IBAction)success:(id)sender {
    
    [NIBStatusBarHUD showSucces:@"加载成功"];
}
/**
 * 显示失败信息
 */
- (IBAction)error:(id)sender {
    
    [NIBStatusBarHUD showError:@"加载失败!"];
}
/**
 * 隐藏
 */
- (IBAction)hide:(id)sender {
    
    [NIBStatusBarHUD dismiss];
}
/**
 * 显示文字
 */
- (IBAction)showMessagee:(id)sender {
    
    [NIBStatusBarHUD showMessage:@"显示文字"];
}

/**
 * 加载中...
 */
- (IBAction)showLoadind:(id)sender{
    
    [NIBStatusBarHUD showLoading:@"正在加载..."];
}

@end
