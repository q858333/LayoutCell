//
//  DBMessageCell_SB.h
//  LayoutCell
//
//  Created by dengbin on 16/12/6.
//  Copyright © 2016年 dengbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBMessageModel.h"
@interface DBMessageCell_SB : UITableViewCell
@property(nonatomic,weak)IBOutlet  UILabel        *userNameLabel;
@property(nonatomic,weak)IBOutlet  UILabel        *contentLabel;
@property(nonatomic,weak)IBOutlet  UILabel        *titleLabel;
@property(nonatomic,weak)IBOutlet  UILabel        *dateLabel;

@property(nonatomic,weak)IBOutlet  UIImageView    *contentImgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentImgView_heigh;

@property(nonatomic,strong)DBMessageModel *messageModel;
@end
