//
//  TestTableViewController.m
//  FastCode
//
//  Created by LP on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "TestTableViewController.h"
#import "HUD.h"
#import "DBManager.h"
#import "BaseModel.h"

@interface TestTableViewController ()
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) DBTable *db;


@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    _db = [DBManager tableWithName:@"test1"];
    
//    [self saveData];
    [self readData];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [HUD hideProgressInView:self.view];
}

#pragma mark - db test
- (void)saveData {
    BaseModel *model = [[BaseModel alloc] init];
    model.ID = @"10000";
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 100; i++) {
        BaseModel *model = [[BaseModel alloc] init];
        model.ID = [NSString stringWithFormat:@"%ld",(long)i];
        [array addObject:model];
    }
    
    [_db asyncRefresh:array];
}

- (void)readData {
    __weak typeof(self) weakSelf = self;
    [_db asyncReadData:^(NSArray *result, NSError *error) {
        weakSelf.dataArray = result;
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    }
    
    cell.textLabel.text = [_dataArray[indexPath.row] ID];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [HUD tip:@"我我我我我我我"];
            break;
        case 1:
            [HUD tip:@"0" icon:kHUDOkIcon yOffset:-100];
            break;
        case 2:
            [HUD tipText:@"我我我我我我我我我我我我我"];
            break;
        case 3:
            [HUD showProgress:@"请稍后..."];
            break;
        default:
            break;
    }
}

@end
