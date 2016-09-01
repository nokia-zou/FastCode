//
//  ProtocolSender.m
//  FastCode
//
//  Created by LP on 16/9/1.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "ProtocolSender.h"
#import "BaseProtocol.h"
#import "AFNetworking.h"

#pragma mark - BaseProtocol
@interface BaseProtocol ()
@property (nonatomic, assign) BOOL isCancelled;
@property (nonatomic, strong) NSURLSessionDataTask *URLSessionDataTask;

@end


#pragma mark - ProtocolSender
@interface ProtocolSender ()
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end


@implementation ProtocolSender

#pragma mark - static init

+ (instancetype)sharedInstance {
    static ProtocolSender * _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ProtocolSender alloc] init];
    });
    
    return _sharedInstance;
}

#pragma mark - init
- (id)init {
    self = [super init];
    if (self) {
        _sessionManager = [AFHTTPSessionManager manager];
    }
    
    return self;
}

#pragma mark - send
+ (NSURLSessionDataTask *)sendProtocol:(BaseProtocol*)protocol
                                result:(void (^)(BOOL isSuccess, NSError *error))result {
    
    //  error
    if (![protocol isKindOfClass:[BaseProtocol class]]) {
        if (result) {
            result(NO, nil);
        }
        return nil;
    }
    
    if ([@"get" isEqualToString:protocol.httpMethod.lowercaseString]) {
        return [[[ProtocolSender sharedInstance] sessionManager] GET:protocol.httpPath parameters:protocol.httpParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            protocol.URLSessionDataTask = task;
            [protocol parse:responseObject];
            if (result) {
                result(YES, nil);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            protocol.URLSessionDataTask = task;

            if (NSURLErrorCancelled) {
                protocol.isCancelled = YES;
            }
            if (result) {
                result(NO, error);
            }
        }];
    }
    else if ([@"post" isEqualToString:protocol.httpMethod.lowercaseString]) {
        return [[[ProtocolSender sharedInstance] sessionManager] POST:protocol.httpPath parameters:protocol.httpParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            protocol.URLSessionDataTask = task;
            [protocol parse:responseObject];
            if (result) {
                result(YES, nil);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            protocol.URLSessionDataTask = task;
            if (NSURLErrorCancelled) {
                protocol.isCancelled = YES;
            }
            if (result) {
                result(NO, error);
            }
        }];
    }
    
    return nil;
}

@end
