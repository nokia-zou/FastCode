//
//  DBTable.h
//  FastCode
//
//  Created by LP on 16/8/27.
//  Copyright © 2016年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseQueue.h"

@interface DBTable : NSObject

- (id)initWithTableName:(NSString *)name withDBQueue:(FMDatabaseQueue *)dbQueue;

- (void)asyncReadData:(void (^)(NSArray *result, NSError *error))finish;

- (void)asyncRefresh:(NSArray *)dataArray;

- (void)asyncAdd:(NSArray *)dataArray;

- (void)asyncClearData;

@end
