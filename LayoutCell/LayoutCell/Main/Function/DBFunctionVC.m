//
//  DBFunctionVC.m
//  LayoutCell
//
//  Created by dengbin on 17/5/9.
//  Copyright © 2017年 dengbin. All rights reserved.
//

#import "DBFunctionVC.h"
#import "Masonry.h"
#import "DBNewsVC.h"

@interface DBFunctionVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_titles;
}
@end

@implementation DBFunctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"功能";
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"function_cell"];
    [self.view addSubview:tableView];


    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.bottom.equalTo(@0);
    }];

    _titles = @[@"朋友圈"];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifierString = @"function_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString forIndexPath:indexPath];
    cell.textLabel.text = _titles[indexPath.row];
    // Configure the cell...

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DBNewsVC *newsVC = [sb instantiateViewControllerWithIdentifier:@"DBNewsVC"];
    newsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:newsVC animated:YES];
    
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
