//
//  NSDictionary+GetObj.m
//  FastCode
//
//  Created by LP on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "NSDictionary+GetObj.h"

@implementation NSDictionary (GetObj)

- (NSInteger)integerValueForKey:(NSString *)key {
    return [self integerValueForKey:key defaultValue:0];
}

- (NSInteger)integerValueForKey:(NSString *)key defaultValue:(NSInteger)value {
    if (nil == key) return value;
    
    id result = [self objectForKey:key];
    if (nil == result || [result isKindOfClass:[NSNull class]]) {
        //        LOG(@"value for key (%@) is nil",key);
        return value;
    }
    
    if ([result isKindOfClass:[NSString class]] || [result isKindOfClass:[NSNumber class]]) {
        return [result integerValue];
    } else {
//        LOG(@"value type error for key (%@)",key);
    }
    
    return value;
}

- (CGFloat)floatValueForKey:(NSString *)key {
    if (nil == key) return 0;
    
    id result = [self objectForKey:key];
    if (nil == result || [result isKindOfClass:[NSNull class]]) {
        //        LOG(@"value for key (%@) is nil",key);
        return 0;
    }
    
    if ([result isKindOfClass:[NSString class]] || [result isKindOfClass:[NSNumber class]]) {
        return [result floatValue];
    } else {
//        LOG(@"value type error for key (%@)",key);
    }
    
    return 0;
}

- (BOOL)boolValueForKey:(NSString *)key {
    return [self boolValueForKey:key defaultValue:NO];
}

- (BOOL)boolValueForKey:(NSString *)key defaultValue:(BOOL)value {
    if (nil == key) return value;
    
    id result = [self objectForKey:key];
    if (nil == result || [result isKindOfClass:[NSNull class]]) {
        //        LOG(@"value for key (%@) is nil",key);
        return value;
    }
    
    if ([result isKindOfClass:[NSString class]] || [result isKindOfClass:[NSNumber class]]) {
        return [result boolValue];
    } else {
//        LOG(@"value type error for key (%@)",key);
    }
    
    return value;
}

- (NSString *)stringValueForKey:(NSString *)key {
    return [self stringValueForKey:key defaultValue:nil];
}

- (NSString *)stringValueForKey:(NSString *)key defaultValue:(NSString *)value {
    if (nil == key) return value;
    
    id result = [self objectForKey:key];
    if (nil == result || [result isKindOfClass:[NSNull class]]) {
        //        LOG(@"string value for key (%@) is nil",key);
        return value;
    }
    
    if ([result isKindOfClass:[NSString class]]) {
        return result;
    }
    
    if ([result isKindOfClass:[NSNumber class]]) {
        return [result stringValue];
    }
    
    return value;
}

- (NSDictionary *)dictionaryValueForKey:(NSString *)key {
    if (nil == key) return nil;
    
    id result = [self objectForKey:key];
    if (nil == result || [result isKindOfClass:[NSNull class]]) {
        //        LOG(@"string value for key (%@) is nil",key);
        return nil;
    }
    
    if ([result isKindOfClass:[NSDictionary class]]) {
        return result;
    }
    
    return nil;
}

- (NSArray *)arrayValueForKey:(NSString *)key {
    if (nil == key) return nil;
    
    id result = [self objectForKey:key];
    if (nil == result || [result isKindOfClass:[NSNull class]]) {
        //        LOG(@"string value for key (%@) is nil",key);
        return nil;
    }
    
    if ([result isKindOfClass:[NSArray class]]) {
        return result;
    }
    
    return nil;
}

- (NSNumber *)floatNumberValueForKey:(NSString *)key {
    if (nil == key) return nil;
    
    id result = [self objectForKey:key];
    if (nil == result || [result isKindOfClass:[NSNull class]]) {
        //        LOG(@"string value for key (%@) is nil",key);
        return nil;
    }
    
    if ([result isKindOfClass:[NSNumber class]]) {
        return result;
    }
    
    if ([result isKindOfClass:[NSString class]]) {
        return [NSNumber numberWithFloat:[result floatValue]];
    }
    
    return nil;
}

- (NSNumber *)integerNumberValueForKey:(NSString *)key {
    if (nil == key) return nil;
    
    id result = [self objectForKey:key];
    if (nil == result || [result isKindOfClass:[NSNull class]]) {
        //                LOG(@"string value for key (%@) is nil",key);
        return nil;
    }
    
    if ([result isKindOfClass:[NSNumber class]]) {
        return result;
    }
    
    if ([result isKindOfClass:[NSString class]]) {
        return [NSNumber numberWithInteger:[result integerValue]];
    }
    
    return nil;
}


- (id)valueForKey:(NSString *)key valueGoalClass:(Class)goalClass {
    if (nil == key) return nil;
    
    id result = [self objectForKey:key];
    if (nil == result || [result isKindOfClass:[NSNull class]]) {
        //        LOG(@"string value for key (%@) is nil",key);
        return nil;
    }
    
    if ([result isKindOfClass:goalClass]) {
        return result;
    }
    
    return nil;
}


@end
