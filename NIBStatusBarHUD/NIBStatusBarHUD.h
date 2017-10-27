//
//  NIBStatusBarHUD.h
//  NIBStatusBarHUD
//
//  Created by 李博 on 2017/10/24.
//  Copyright © 2017年 libo2130. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NIBStatusBarHUD : NSObject

+ (void)showError:(NSString *)error;
+ (void)showSucces:(NSString *)success;
+ (void)showMessage:(NSString *)message image:(UIImage *)image;
+ (void)showMessage:(NSString *)message;
+ (void)showLoading:(NSString *)load;
+ (void)dismiss;


@end
