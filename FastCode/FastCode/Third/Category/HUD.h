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

+ (void)tip:(NSString *)tip;

+ (void)tip:(NSString *)tip icon:(NSString *)icon;

+ (void)tip:(NSString *)tip icon:(NSString *)icon yOffset:(CGFloat)yOffset;

+ (void)warning:(NSString *)tip;

+ (void)tipText:(NSString *)text;

+ (void)tipMultiLineText:(NSString *)text;

+ (void)tipText:(NSString *)text yOffset:(CGFloat)yOffset;

+ (void)showProgress:(NSString *)title;

+ (void)hideProgress;

@end
