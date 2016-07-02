//
//  FCTabBarController.m
//  FastCode
//
//  Created by LP on 16/7/2.
//  Copyright © 2016年 zou. All rights reserved.
//

#import "FCTabBarController.h"
#import "BaseViewController.h"

@interface FCTabBarController ()

@end

@implementation FCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewControllers = [self tabBarViewControllers];
}

#pragma mark - create view controllers 
- (NSArray *)tabBarViewControllers {
    NSMutableArray *array = [NSMutableArray array];
    
    //  nav
    BaseViewController *viewController = [[BaseViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [array addObject:nav];
    
    //  nav2
    viewController = [[BaseViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [array addObject:nav];
    
    //  nav3
    viewController = [[BaseViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [array addObject:nav];
    
    //  nav4
    viewController = [[BaseViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [array addObject:nav];
    
    //  nav5
    viewController = [[BaseViewController alloc] init];
    nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    [array addObject:nav];
    
    return array;
}


@end
