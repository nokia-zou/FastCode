//
//  HUD.m
//  FastCode
//
//  Created by LP on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "HUD.h"
#import "MBProgressHUD.h"

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
    [MBProgressHUD hideAllHUDsForView:window animated:NO];
    
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 37, 37)];
    iconView.image = [UIImage imageNamed:icon];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
    hud.yOffset = yOffset;
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = tip;
    hud.customView = iconView;
    [window addSubview:hud];
    
    [hud show:YES];
    [hud hide:YES afterDelay:1.6];
}

+ (void)warning:(NSString *)tip {
    [HUD tip:tip icon:kHUDWarningIcon yOffset:0];
}

+ (void)tipText:(NSString *)text {
    [HUD tipText:text yOffset:0];
}

+ (void)tipMultiLineText:(NSString *)text {
    
    //  window
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    //  移除旧提示
    [MBProgressHUD hideAllHUDsForView:window animated:NO];
    
    //  新提示
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
    hud.mode = MBProgressHUDModeText;
    hud.margin = 20.f;
    hud.yOffset = 15.f;
    //    hud.labelText = text;
    hud.detailsLabelText = text;
    hud.detailsLabelFont = [UIFont systemFontOfSize:16]; //Johnkui - added
    [window addSubview:hud];
    
    [hud show:YES];
    [hud hide:YES afterDelay:1.4];
}

+ (void)tipText:(NSString *)text yOffset:(CGFloat)yOffset  {
    
    //  window
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    //  移除旧提示
    [MBProgressHUD hideAllHUDsForView:window animated:NO];
    
    //  新提示
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
    hud.yOffset = yOffset;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    [window addSubview:hud];
    
    [hud show:YES];
    [hud hide:YES afterDelay:1.4];
}

+ (void)showProgress:(NSString *)title {
    //  window
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
    //  移除旧提示
    [MBProgressHUD hideAllHUDsForView:window animated:NO];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
    hud.labelText = title;
    [window addSubview:hud];
    [hud show:YES];
}

+ (void)hideProgress {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [MBProgressHUD hideHUDForView:window animated:NO];
}

@end
