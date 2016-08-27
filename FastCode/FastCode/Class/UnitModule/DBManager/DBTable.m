//
//  DBTable.m
//  FastCode
//
//  Created by LP on 16/8/27.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "DBTable.h"
#import "DBExecute.h"
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface DBTable ()
//  表名
@property (nonatomic, strong) FMDatabaseQueue *dbQueue;
@property (nonatomic, strong) DBExecute *dbExecute;

@end


@implementation DBTable

- (id)initWithTableName:(NSString *)name withDBQueue:(FMDatabaseQueue *)dbQueue {
    if (self = [super init]) {
        //  init value
        _dbQueue = dbQueue;
        _dbExecute = [[DBExecute alloc] initWithTableName:name];
        
        //  创建新表
        [self createDBTable];
    }
    
    return self;
}

- (void)createDBTable {
    __weak typeof(self) weakSelf = self;

    [_dbQueue inDatabase:^(FMDatabase *adb)
     {
         [weakSelf.dbExecute createTableWithDB:adb];
     }];
}

- (void)asyncReadData:(void (^)(NSArray *result, NSError *error))finish {
    __weak typeof(self) weakSelf = self;
    [_dbQueue inDatabase:^(FMDatabase *adb)
     {
         NSArray *array = [weakSelf.dbExecute readWithDB:adb];
         NSError *error = adb.lastError;

         if(finish)
         {
             finish(array, error);
         }
     }];
}

- (void)asyncRefresh:(NSArray *)dataArray {
    __weak typeof(self) weakSelf = self;

    [_dbQueue inDatabase:^(FMDatabase *adb)
     {
         [weakSelf.dbExecute refreshDataWithDb:adb dataArray:dataArray];
     }];
}

- (void)asyncAdd:(NSArray *)dataArray {
    __weak typeof(self) weakSelf = self;

    [_dbQueue inDatabase:^(FMDatabase *adb)
     {
         [weakSelf.dbExecute addMoreDataWithDB:adb dataArray:dataArray];
     }];
}

- (void)asyncClearData {
    __weak typeof(self) weakSelf = self;
    
    [_dbQueue inDatabase:^(FMDatabase *adb)
     {
         [weakSelf.dbExecute clearWithDB:adb];
     }];
}

@end
