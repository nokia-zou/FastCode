//
//  BaseDataSource.h
//  FastCode
//
//  Created by LP on 16/9/1.
//  Copyright © 2016年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"

@interface BaseDataSource : NSObject
@property (nonatomic, strong, readonly) NSMutableArray *dataArray;
@property (nonatomic, assign, readonly) BOOL isLoadingMore;
@property (nonatomic, assign, readonly) BOOL isRefresh;
@property (nonatomic, assign, readonly) BOOL isCancelled;
@property (nonatomic, assign, readonly) BOOL hasMore;

//  send
- (void)sendProtocol:(BaseProtocol *)protocol
           isRefresh:(BOOL)isRefresh
              finish:(void (^)(BOOL isSuccess, NSError *error))finish;

//  overide
- (void)handleProtocol:(BaseProtocol *)protocol isSuccess:(BOOL)isSuccess;

//  cancel
- (void)cancelCurrentRequest;

//  适用于信息流类应用
- (void)refreshData:(void (^)(BOOL isSuccess, NSError *error))finish;

- (void)loadMoreData:(void (^)(BOOL isSuccess, NSError *error))finish;

@end
