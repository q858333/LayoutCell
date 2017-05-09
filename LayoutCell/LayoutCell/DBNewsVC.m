//
//  ViewController.m
//  LayoutCell
//
//  Created by dengbin on 16/12/5.
//  Copyright © 2016年 dengbin. All rights reserved.
//

#import "DBNewsVC.h"
#import "DBMessageModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "DBMessageCell.h"
#import "DBMessageModel.h"
@interface DBNewsVC ()
{
    NSMutableArray  *_datas;//数据源
    
    
    
}
@end

@implementation DBNewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //  [self.tableView registerClass:[DBMessageCell class] forCellReuseIdentifier:@"cell"];
 //   [self.tableView registerNib:[UINib nibWithNibName:@"DBMessageCell_SB" bundle:nil] forCellReuseIdentifier:@"cell"];

    
    [self buildTestDataThen:^{
        [self.tableView reloadData];
    }];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)buildTestDataThen:(void (^)(void))then {
    // Simulate an async request
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // Data from `data.json`
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *feedDicts = rootDict[@"feed"];
        
        // Convert to `FDFeedEntity`
        NSMutableArray *entities = @[].mutableCopy;
        [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            

            
            [entities addObject:[MTLJSONAdapter modelOfClass:[DBMessageModel class] fromJSONDictionary:obj error:nil]];
        }];
        
        _datas = entities;
        
        // Callback
        dispatch_async(dispatch_get_main_queue(), ^{
            !then ?: then();
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(DBMessageCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    //当如果是用纯frame的计算时候，是要zhe代码的操作。;默认是等于YES的。在使用Masonry时候不用进行这些操作。
  //  cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
  //  cell.fd_enforceFrameLayout = YES; // Enable to use "-sizeThatFits:"

   // [cell systemLayoutSizeFittingSize];
    cell.messageModel = _datas[indexPath.row];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    FDSimulatedCacheMode mode = self.cacheModeSegmentControl.selectedSegmentIndex;
//    switch (mode) {
//        case FDSimulatedCacheModeNone:
            return [tableView fd_heightForCellWithIdentifier:@"cell" configuration:^(DBMessageCell *cell) {
                
                [self configureCell:cell atIndexPath:indexPath];
            }];
//        case FDSimulatedCacheModeCacheByIndexPath:
//            return [tableView fd_heightForCellWithIdentifier:@"cell" cacheByIndexPath:indexPath configuration:^(DBMessageCell *cell) {
//                
//                [self configureCell:cell atIndexPath:indexPath];
//            }];
//        case FDSimulatedCacheModeCacheByKey: {
//            FDFeedEntity *entity = self.feedEntitySections[indexPath.section][indexPath.row];
//            
//            return [tableView fd_heightForCellWithIdentifier:@"FDFeedCell" cacheByKey:entity.identifier configuration:^(FDFeedCell *cell) {
//                [self configureCell:cell atIndexPath:indexPath];
//            }];
//        };
//            
//        default:
//            break;
//    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_datas removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


@end
