//
//  CommonDef.h
//  FastCode
//
//  Created by LP on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#ifndef CommonDef_h
#define CommonDef_h


#pragma - 应用信息
#define kAppDisplayName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

#define kAppVersion     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define kAppBundleID    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

#define kSystemVersion  [UIDevice currentDevice].systemVersion.floatValue


#pragma - debug
//  debug
#ifdef DEBUG
#define LOG(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define LOG(format, ...)
#endif


#pragma - UI
//  color
#define RGB(A,B,C) [UIColor colorWithRed:((float)A)/255.0 green:((float)B)/255.0 blue:((float)C)/255.0 alpha:1.0]

//  single line
#define kSingleLineHeight           (1 / [UIScreen mainScreen].scale)
#define kSingleLinePositionOffSet   ((1 / [UIScreen mainScreen].scale) / 2)

//  screen size
#define kUIScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kUIScreenHeight ([UIScreen mainScreen].bounds.size.height)


#endif /* CommonDef_h */
