//
//  HUD.h
//  FastCode
//
//  Created by LP on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kHUDOkIcon          @"HUD_ok_icon.png"
#define kHUDWarningIcon     @"HUD_warning_icon.png"

@interface HUD : NSObject

//  提示，带ok图片
+ (void)tip:(NSString *)tip;

//  提示，带warning图片
+ (void)warning:(NSString *)tip;

//  提示，图片name自备
+ (void)tip:(NSString *)tip icon:(NSString *)icon;

//  提示，图片name自备，偏移位置
+ (void)tip:(NSString *)tip icon:(NSString *)icon yOffset:(CGFloat)yOffset;

//  文字提示
+ (void)tipText:(NSString *)text;

//  文字提示，偏移位置
+ (void)tipText:(NSString *)text yOffset:(CGFloat)yOffset;

//  等待框
+ (void)showProgress:(NSString *)title;

+ (void)showProgress:(NSString *)title inView:(UIView *)view;

//  隐藏等待框
+ (void)hideProgress;

+ (void)hideProgressInView:(UIView *)view;

@end
