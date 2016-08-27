//
//  DBManager.m
//  FastCode
//
//  Created by LP on 16/8/27.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "DBManager.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import "DBTable.h"

@interface DBManager ()
@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

@end


@implementation DBManager

#pragma mark - static

+ (instancetype)sharedInstance {
    static DBManager * _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DBManager alloc] init];
    });
    
    return _sharedInstance;
}

+ (DBTable *)tableWithName:(NSString *)name {
    DBManager *manager = [DBManager sharedInstance];
    return [[DBTable alloc] initWithTableName:name withDBQueue:manager.dbQueue];
}

#pragma mark - init

- (id)init
{
    if(self = [super init])
    {
        //  init db
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        NSString *newDbPath = [documentDirectory stringByAppendingPathComponent:@"Database.db"];
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:newDbPath];
    }
    return self;
}

@end
