//
//  BaseDataSource.m
//  FastCode
//
//  Created by LP on 16/9/1.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "BaseDataSource.h"
#import "ProtocolSender.h"

@interface BaseDataSource ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) BOOL isRefresh;
@property (nonatomic, assign) BOOL isLoadingMore;
@property (nonatomic, assign) BOOL isCancelled;
@property (nonatomic, assign) BOOL hasMore;

@property (nonatomic, strong) NSURLSessionDataTask *currentSessionDataTask;

@end

@implementation BaseDataSource

#pragma mark - init
- (void)dealloc
{
    [self cancelCurrentRequest];
}

#pragma mark - public

- (void)refreshData:(void (^)(BOOL isSuccess, NSError *error))finish {
    if (finish) {
        finish(NO, nil);
    }
}

- (void)loadMoreData:(void (^)(BOOL isSuccess, NSError *error))finish {
    if (finish) {
        finish(NO, nil);
    }
}

#pragma mark - private send request
- (void)cancelCurrentRequest {
    [_currentSessionDataTask cancel];
}

- (void)sendProtocol:(BaseProtocol *)protocol
           isRefresh:(BOOL)isRefresh
              finish:(void (^)(BOOL isSuccess, NSError *error))finish {
    
    //  cancel last
    [self cancelCurrentRequest];
    
    //  request type
    if(isRefresh) {
        _isRefresh = YES;
        _isLoadingMore = NO;
    }
    else {
        _isRefresh = NO;
        _isLoadingMore = YES;
    }
    
    //  send request
    __weak typeof(self) weakSelf = self;
    _currentSessionDataTask = [ProtocolSender sendProtocol:protocol result:^(BOOL isSuccess, NSError *error) {
        [weakSelf onSendProtocolFinished:protocol isSuccess:isSuccess error:error finish:finish];
    }];
}

- (void)onSendProtocolFinished:(BaseProtocol *)protocol
                     isSuccess:(BOOL)isSuccess
                         error:(NSError *)error
                        finish:(void (^)(BOOL isSuccess, NSError *error))finish {
    if(protocol.URLSessionDataTask != self.currentSessionDataTask) {
        if(finish) {
            finish(NO, [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorCancelled userInfo:nil]);
        }
    }
    else {
        self.currentSessionDataTask = nil;
        [self onFinished:protocol isSuccess:isSuccess error:error finish:finish];
    }
}

- (void)onFinished:(BaseProtocol *)protocol
         isSuccess:(BOOL)isSuccess
             error:(NSError *)error
            finish:(void (^)(BOOL isSuccess, NSError *error))finish {
    
    //  vaule
    _isCancelled = protocol.isCancelled;
    
    [self handleProtocol:protocol isSuccess:isSuccess];
    
    [self resetRequestState];
    
    if(finish) {
        finish(isSuccess, error);
    }
}

- (void)resetRequestState {
    _isLoadingMore = NO;
    _isRefresh = NO;
}

//  sun class overite
- (void)handleProtocol:(BaseProtocol *)protocol isSuccess:(BOOL)isSuccess {
    
}

@end
