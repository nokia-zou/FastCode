//
//  DBExecute.m
//  FastCode
//
//  Created by LP on 16/8/27.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "DBExecute.h"
#import "BaseModel.h"

@interface DBExecute ()
//  表明
@property (nonatomic, strong) NSString *name;

@end

@implementation DBExecute

- (id)initWithTableName:(NSString *)name
{
    if(self = [super init])
    {
        self.name = name;
    }
    return self;
}

- (void)createTableWithDB:(FMDatabase *)db
{
    NSString *tabSql = [NSString stringWithFormat:@"create table IF NOT EXISTS %@ (id text primary key, data BLOB)",_name];
    [db executeUpdate:tabSql];
}

- (NSArray *)readWithDB:(FMDatabase *)db
{
    NSMutableArray *array = [NSMutableArray array];
    NSString *selectSql = [NSString stringWithFormat:@"select * from %@", _name];
    FMResultSet *rs = [db executeQuery:selectSql];
    while ([rs next])
    {
        id temp = [NSKeyedUnarchiver unarchiveObjectWithData:[rs dataForColumn:@"data"]];
        if (temp)
        {
            [array addObject:temp];
        }
    }
    [rs close];
    return array;
}

- (void)refreshDataWithDb:(FMDatabase *)db dataArray:(NSArray *)array
{
    [self clearWithDB:db];
    [self addMoreDataWithDB:db dataArray:array];
}

- (void)addMoreDataWithDB:(FMDatabase *)db dataArray:(NSArray *)array
{
    for(id item in array)
    {
        [self addDataWithDB:db data:item];
    }
}

- (void)addDataWithDB:(FMDatabase *)db data:(id)data
{
    //  只针对 BaseModel
    if (![data isKindOfClass:[BaseModel class]]) return;
    
    BaseModel *model = (BaseModel *)data;
    
    NSString *format = @"insert into %@ (id, data) values (?,?)";
    format = [NSString stringWithFormat:format, _name];
    NSData *archiverData = [NSKeyedArchiver archivedDataWithRootObject:model];
    
    [db executeUpdate:format, [NSString stringWithFormat:@"%@", model.ID], archiverData];
}

- (void)deleteWithDB:(FMDatabase *)db data:(id)data
{
    //  只针对 BaseModel
    if (![data isKindOfClass:[BaseModel class]]) return;
    
    BaseModel *model = (BaseModel *)data;
    
    [db executeUpdate:[NSString stringWithFormat:@"delete from %@ where id = ?", _name], model.ID];
}

- (void)clearWithDB:(FMDatabase *)db
{
    [db executeUpdate:[NSString stringWithFormat:@"delete from %@",_name]];
}

-  (NSInteger)dataCountWithDb:(FMDatabase *)db
{
    NSString *countSql = [NSString stringWithFormat:@"SELECT count(*) as 'count' FROM %@", _name];
    FMResultSet *rs = [db executeQuery:countSql];
    NSInteger count = 0;
    while ([rs next])
    {
        count = [rs intForColumn:@"count"];
    }
    [rs close];
    return count;
}


@end
