//
//  HUD.m
//  FastCode
//
//  Created by LP on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "HUD.h"
#import "MBProgressHUD.h"

#define kHUDBackgroundColor [UIColor colorWithWhite:0 alpha:0.7]

@implementation HUD

+ (void)tip:(NSString *)tip {
    [HUD tip:tip icon:kHUDOkIcon yOffset:0];
}

+ (void)tip:(NSString *)tip icon:(NSString *)icon {
    [HUD tip:tip icon:icon yOffset:0];
}

+ (void)tip:(NSString *)tip icon:(NSString *)icon yOffset:(CGFloat)yOffset {
    
    //  window
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    //  移除旧
    [MBProgressHUD hideHUDForView:window animated:NO];
    
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    iconView.image = [UIImage imageNamed:icon];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window];
    [hud setOffset:CGPointMake(0, yOffset)];
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabel.text = tip;
    hud.detailsLabel.font = [UIFont systemFontOfSize:16];
    hud.customView = iconView;
    [window addSubview:hud];
    
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:1.6];
}

+ (void)warning:(NSString *)tip {
    [HUD tip:tip icon:kHUDWarningIcon yOffset:0];
}

+ (void)tipText:(NSString *)text {
    [HUD tipText:text yOffset:0];
}

+ (void)tipText:(NSString *)text yOffset:(CGFloat)yOffset  {
    
    //  window
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    //  移除旧提示
    [MBProgressHUD hideHUDForView:window animated:NO];
    
    //  新提示
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window];
    [hud setOffset:CGPointMake(0, yOffset)];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = text;
    hud.detailsLabel.font = [UIFont systemFontOfSize:16];
    [window addSubview:hud];
    
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:1.6];
}

+ (void)showProgress:(NSString *)title {
    //  window
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    //  显示
    [HUD showProgress:title inView:window];
}

+ (void)showProgress:(NSString *)title inView:(UIView *)view {
    
    //  移除旧提示
    [MBProgressHUD hideHUDForView:view animated:NO];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.label.text = title;
    hud.label.textColor = [UIColor whiteColor];
    [view addSubview:hud];
    
    [hud showAnimated:YES];
}

+ (void)hideProgress {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [HUD hideProgressInView:window];
}

+ (void)hideProgressInView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
