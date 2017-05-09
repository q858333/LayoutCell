//
//  DBLoginVC.m
//  LayoutCell
//
//  Created by dengbin on 17/5/9.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import "DBLoginVC.h"
#import "DBRegisterVC.h"
#import "DBMainTabBarController.h"


@interface DBLoginVC ()
{
    UIImageView *_navBarHairlineImageView;
}
@end

@implementation DBLoginVC

//同样的在界面出现时候开启隐藏
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _navBarHairlineImageView.hidden = YES;
}
//在页面消失的时候就让出现
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _navBarHairlineImageView.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]] forBarMetrics:0];
    _navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];

    // Do any additional setup after loading the view.
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
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

- (IBAction)loginButtonClick:(id)sender {


    DBMainTabBarController *mainTabbarController = [[DBMainTabBarController alloc]init];
    [mainTabbarController configureViewControllers];
    [self presentViewController:mainTabbarController animated:YES completion:^{

    }];





}

- (IBAction)registerButtonClick:(id)sender {


    DBRegisterVC *registerVC = [[DBRegisterVC alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];


}
- (UIImage *) createImageWithColor: (UIColor *) color
{
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myImage;
}
@end
