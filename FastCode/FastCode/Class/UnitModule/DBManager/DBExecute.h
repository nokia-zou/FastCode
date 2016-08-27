//
//  DBExecute.h
//  FastCode
//
//  Created by LP on 16/8/27.
//  Copyright © 2016年 zou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface DBExecute : NSObject

- (id)initWithTableName:(NSString *)name;

- (void)createTableWithDB:(FMDatabase *)db;

- (NSArray *)readWithDB:(FMDatabase *)db;

- (void)refreshDataWithDb:(FMDatabase *)db dataArray:(NSArray *)array;

- (void)addMoreDataWithDB:(FMDatabase *)db dataArray:(NSArray *)array;

- (void)clearWithDB:(FMDatabase *)db;

@end
