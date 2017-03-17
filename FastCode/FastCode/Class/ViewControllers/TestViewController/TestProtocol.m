//
//  TestProtocol.m
//  FastCode
//
//  Created by LP on 16/9/1.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "TestProtocol.h"
#import "NSDictionary+GetObj.h"

// http://ic.snssdk.com/neihan/stream/mix/v1/?content_type=-101&app_name=joke_essay&version_code=5.5.0&count=30
#define kTestHttpPath   @"http://ic.snssdk.com/neihan/stream/mix/v1/"


@interface BaseProtocol ()
@property (nonatomic, strong) id resultObject;

@end


@implementation TestProtocol

#pragma mark - property
- (NSMutableDictionary *)httpParameters {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:@"-101" forKey:@"content_type"];
    [dic setObject:@"joke_essay" forKey:@"app_name"];
    [dic setObject:@"5.5.0" forKey:@"version_code"];
    [dic setObject:@"30" forKey:@"count"];
    
    return dic;
}

#pragma mark - init

- (id)initWithHttpPath:(NSString *)httpPath {
    if (self = [super initWithHttpPath:kTestHttpPath]) {
        
    }
    
    return self;
}

- (BOOL)parse:(id)result {
    if (![result isKindOfClass:[NSDictionary class]]) return NO;
    
    NSDictionary *dic = (NSDictionary *)result;
    
    NSArray *dataArray = [[dic dictionaryValueForKey:@"data"] arrayValueForKey:@"data"];
    
    self.resultObject = [NSMutableArray array];
    
    for (NSDictionary *postDic in dataArray) {
        NSString *text = [[postDic dictionaryValueForKey:@"group"] stringValueForKey:@"text"];
        if (text) {
            [self.resultObject addObject:text];
        }
    }
    
    return YES;
}

@end
