//
//  TestDataSource.m
//  FastCode
//
//  Created by LP on 16/9/1.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "TestDataSource.h"
#import "TestProtocol.h"
#import "BaseModel.h"

@interface BaseDataSource ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) BOOL hasMore;

@end


@implementation TestDataSource

- (void)refreshData:(void (^)(BOOL isSuccess, NSError *error))finish {
    TestProtocol *protocol = [[TestProtocol alloc] initWithHttpPath:nil];
    [self sendProtocol:protocol isRefresh:YES finish:finish];
}

- (void)loadMoreData:(void (^)(BOOL isSuccess, NSError *error))finish {
    if (finish) {
        finish(NO, nil);
    }
}

//  overide
- (void)handleProtocol:(BaseProtocol *)protocol isSuccess:(BOOL)isSuccess {
    TestProtocol *testProtocol = (TestProtocol *)protocol;
    
    self.dataArray = [NSMutableArray arrayWithCapacity:100];
    
    for (NSInteger i = 0; i < [testProtocol.resultObject count]; i++) {
        BaseModel *model = [[BaseModel alloc] init];
        model.ID = [testProtocol.resultObject objectAtIndex:i];
        [self.dataArray addObject:model];
    }
}

@end
