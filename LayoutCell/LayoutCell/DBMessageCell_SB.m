//
//  DBMessageCell_SB.m
//  LayoutCell
//
//  Created by dengbin on 16/12/6.
//  Copyright © 2016年 dengbin. All rights reserved.
//

#import "DBMessageCell_SB.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

@implementation DBMessageCell_SB

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setMessageModel:(DBMessageModel *)messageModel
{
    
    
    
    _messageModel = messageModel;
    
    
    if([self.messageModel.imageName isEqualToString:@""])
    {
        self.contentImgView_heigh.constant=0;
        
    }else
    {
        self.contentImgView_heigh.constant=100;
        
    }
    self.titleLabel.text = messageModel.title;
    self.contentLabel.text = messageModel.content;
    
    [self.contentImgView setImageWithURL:[NSURL URLWithString:messageModel.imageName] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    if (![messageModel.imageName isEqualToString:@""])
    {
        [self.contentImgView setImageWithURL:[NSURL URLWithString:messageModel.imageName] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
    }
    
    self.userNameLabel.text = messageModel.userName;
    self.dateLabel.text = messageModel.messageDate;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
