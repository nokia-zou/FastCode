//
//  BaseProtocol.m
//  FastCode
//
//  Created by LP on 16/9/1.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "BaseProtocol.h"

@interface BaseProtocol ()

@property(nonatomic, strong) NSString *httpMethod;

@property(nonatomic, strong) NSString *httpPath;

@property(nonatomic, assign) BOOL isCancelled;

@property(nonatomic, strong) id resultObject;

@property (nonatomic, strong) NSURLSessionDataTask *URLSessionDataTask;

@end


@implementation BaseProtocol

#pragma mark - property
- (NSString *)httpMethod {
    if (!_httpMethod) {
        _httpMethod = @"GET";
    }
    
    return _httpMethod;
}

#pragma mark - init
- (id)initWithHttpPath:(NSString *)httpPath; {
    if (self = [super init]) {
        _httpPath = httpPath;
    }
    
    return self;
}

#pragma mark - public
- (BOOL)parse:(id)result {
    
    return NO;
}

@end
