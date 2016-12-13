//
//  DBMessageCell.h
//  LayoutCell
//
//  Created by dengbin on 16/12/5.
//  Copyright © 2016年 dengbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DBMessageModel;
@interface DBMessageCell : UITableViewCell

@property(nonatomic,strong)UILabel        *userNameLabel;
@property(nonatomic,strong)UILabel        *contentLabel;
@property(nonatomic,strong)UILabel        *titleLabel;
@property(nonatomic,strong)UILabel        *dateLabel;

@property(nonatomic,strong)UIImageView    *contentImgView;

@property(nonatomic,strong)DBMessageModel *messageModel;
@end
