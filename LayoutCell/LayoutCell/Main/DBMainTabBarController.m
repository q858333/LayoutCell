//
//  DBMainTabBarController.m
//  LayoutCell
//
//  Created by dengbin on 17/5/9.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import "DBMainTabBarController.h"
#import "DBRecentListVC.h"
#import "DBFriendListVC.h"
#import "DBFunctionVC.h"
#import "DBSettingVC.h"

@interface DBMainTabBarController ()

@end

@implementation DBMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
-(void)configViewControllers
{
    NSArray *titleArr = @[@"最近",@"联系人",@"功能",@"设置"];
    NSArray *classArr = @[@"DBRecentListVC",@"DBFriendListVC",@"DBFunctionVC",@"DBSettingVC"];
    NSMutableArray *navs = [[NSMutableArray alloc] init];

    [classArr enumerateObjectsUsingBlock:^(NSString *className, NSUInteger idx, BOOL * _Nonnull stop) {

        Class class = NSClassFromString(className);
        UIViewController *vc = [[class alloc] init];

        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];

        UITabBarItem *item= [[UITabBarItem alloc] initWithTitle:titleArr[idx] image:nil tag:idx];

        vc.tabBarItem=item;
        [navs addObject:nav];


    }];

    
    self.viewControllers=[NSArray arrayWithArray:navs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
