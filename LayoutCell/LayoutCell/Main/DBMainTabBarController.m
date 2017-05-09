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
    NSArray *imageArr = @[@"recent",@"friend",@"function",@"setting"];

    NSArray *classArr = @[@"DBRecentListVC",@"DBFriendListVC",@"DBFunctionVC",@"DBSettingVC"];
    NSMutableArray *navs = [[NSMutableArray alloc] init];

    [classArr enumerateObjectsUsingBlock:^(NSString *className, NSUInteger idx, BOOL * _Nonnull stop) {

        Class class = NSClassFromString(className);
        UIViewController *vc = [[class alloc] init];

        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
      //  [[UINavigationBar appearance] setba]
        [nav.navigationBar setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1] size:CGSizeMake(CGRectGetWidth(self.view.frame), 64)] forBarMetrics:UIBarMetricsDefault];

        nav.navigationBar.translucent = NO;
//        NSDictionary *textAttributes = @{
//                                         NSFontAttributeName: kNavTitleFont,
//                                         NSForegroundColorAttributeName: kNavTitleColor,
//                                         };
//
//        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
//        //去除navbar下的线
//        nav.navigationBar.shadowImage = [[UIImage alloc] init];
//
//        [nav.navigationBar setTitleTextAttributes:textAttributes];
//
//        nav.navigationBar.barTintColor = HEX_COLOR(@"ffda44");
//        nav.navigationBar.tintColor = [UIColor colorWithRed:65.0/255 green:17.0/255 blue:3.0/255 alpha:1];

        UIImage *normal_image = [UIImage imageNamed:imageArr[idx] ];

        /**
         UIImageRenderingModeAutomatic  // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式。
         UIImageRenderingModeAlwaysOriginal   // 始终绘制图片原始状态，不使用Tint Color。
         UIImageRenderingModeAlwaysTemplate   // 始终根据Tint Color绘制图片，忽略图片的颜色信息。
         找不到图片为了好看，使用默认的。如果想要图片效果就使用UIImageRenderingModeAlwaysOriginal
         */
        normal_image = [normal_image imageWithRenderingMode:UIImageRenderingModeAutomatic];



        UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:titleArr[idx] image:normal_image tag:idx];
        vc.tabBarItem=item;
        [navs addObject:nav];


    }];
    [self.tabBar setTintColor:[UIColor redColor]];
    //tabbar背景色
    [self.tabBar setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1] size:CGSizeMake(CGRectGetWidth(self.view.frame), 50)]];
    self.viewControllers=[NSArray arrayWithArray:navs];
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
