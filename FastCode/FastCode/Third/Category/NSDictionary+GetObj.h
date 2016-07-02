//
//  NSDictionary+GetObj.h
//  FastCode
//
//  Created by LP on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (GetObj)

/**
 *  获取NSInteger值
 *
 *  @param key key
 *
 *  @return 默认返回：0
 */
- (NSInteger)integerValueForKey:(NSString *)key;

- (NSInteger)integerValueForKey:(NSString *)key defaultValue:(NSInteger)value;

/**
 *  获取CGFloat值
 *
 *  @param key key
 *
 *  @return 默认返回：0
 */
- (CGFloat)floatValueForKey:(NSString *)key;

/**
 *  获取BOOL值
 *
 *  @param key key
 *
 *  @return 默认返回：NO
 */
- (BOOL)boolValueForKey:(NSString *)key;

- (BOOL)boolValueForKey:(NSString *)key defaultValue:(BOOL)value;

/**
 *  获取NSString值
 *
 *  @param key key
 *
 *  @return 默认返回：nil
 */
- (NSString *)stringValueForKey:(NSString *)key;

- (NSString *)stringValueForKey:(NSString *)key defaultValue:(NSString *)value;

- (NSDictionary *)dictionaryValueForKey:(NSString *)key;

- (NSArray *)arrayValueForKey:(NSString *)key;


/**
 *  获取NSNumber值
 *
 *  @param key key
 *
 *  @return 默认返回：nil
 */
- (NSNumber *)floatNumberValueForKey:(NSString *)key;

/**
 *  获取NSNumber值,值为NSInteger类型
 *
 *  @param key key
 *
 *  @return 默认返回：nil
 */
- (NSNumber *)integerNumberValueForKey:(NSString *)key;


/**
 *  获取 id 值
 *
 *  @param key       key
 *  @param goalClass 期望返回数据的类型，不符合返回 nil
 *
 *  @return id
 */
- (id)valueForKey:(NSString *)key valueGoalClass:(Class)goalClass;

@end
