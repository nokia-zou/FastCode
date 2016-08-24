//
//  TestTableViewController.m
//  FastCode
//
//  Created by 朋 邹 on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "TestTableViewController.h"
#import "HUD.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [HUD hideProgressInView:self.view];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [HUD tip:@"我我我我我我我我我我我我我我我我我我我我我我我我我我我我"];
            break;
        case 1:
            [HUD tip:@"0" icon:kHUDOkIcon yOffset:-100];
            break;
        case 2:
            [HUD tipText:@"我我我我我我我我我我我我我我我我我我我我我我我我我我我我"];
            break;
        case 3:
            [HUD showProgress:@"请稍后..."];
            break;
        default:
            break;
    }
}

@end
