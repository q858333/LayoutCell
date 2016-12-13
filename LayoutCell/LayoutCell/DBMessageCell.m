//
//  DBMessageCell.m
//  LayoutCell
//
//  Created by dengbin on 16/12/5.
//  Copyright © 2016年 dengbin. All rights reserved.
//

#import "DBMessageCell.h"
#import "DBMessageModel.h"
#import "Masonry.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
@implementation DBMessageCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        self.contentView.bounds = [UIScreen mainScreen].bounds;

        [self configView];
        
    }
    
    
    return self;
}

-(void)configView
{
    _userNameLabel = [self createLabelWithFont:[UIFont systemFontOfSize:17] textColor:[UIColor blueColor]];
    _titleLabel = [self createLabelWithFont:[UIFont boldSystemFontOfSize:17] textColor:[UIColor blackColor]];
    _contentLabel = [self createLabelWithFont:[UIFont systemFontOfSize:17] textColor:[UIColor blackColor]];
    _dateLabel = [self createLabelWithFont:[UIFont systemFontOfSize:15] textColor:[UIColor grayColor]];
    _contentImgView = [[UIImageView alloc]init];
    //_contentImgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_contentImgView];
    
    [self setViewAutoLayout];

    
}

-(UILabel *)createLabelWithFont:(UIFont *)font textColor:(UIColor *)textColor
{
    UILabel *label = [[UILabel alloc]init];
    label.font = font;
    label.textColor = textColor;
    label.numberOfLines = 0;
    label.lineBreakMode = 0|1;
    
    [self.contentView addSubview:label];
    
    return label;
    
    
}

-(void)setViewAutoLayout
{
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@15);
        make.right.equalTo(@(-15));
        make.height.equalTo(@15);

        
        
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_userNameLabel.mas_bottom).offset(15);
        make.left.right.equalTo(_userNameLabel);
        make.height.equalTo(@15);

        
    }];
    
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       // make.top.mas_equalTo(_contentLabel.mas_bottom).offset(10);
        
         make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
        make.left.right.equalTo(_userNameLabel);
        make.height.equalTo(@15);
        
        
    }];

    
 
//    
//    
    [_contentImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_dateLabel.mas_top).offset(-10);
        make.left.right.equalTo(_userNameLabel);
      //  make.height.equalTo(@100);
        if([self.messageModel.imageName isEqualToString:@""])
        {
            make.height.equalTo(@0);

        }else
        {
            make.height.equalTo(@100);

        }
        
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(10);
        make.right.equalTo(_userNameLabel);
        make.left.equalTo(_userNameLabel);
        
        make.bottom.mas_equalTo(_contentImgView.mas_top).offset(-10);
        
        
    }];
    
//
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setMessageModel:(DBMessageModel *)messageModel
{

    
    
    _messageModel = messageModel;

    
    [_contentImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
     
        make.bottom.mas_equalTo(_dateLabel.mas_top).offset(-10);
        make.left.right.equalTo(_userNameLabel);
        //  make.height.equalTo(@100);
        if([self.messageModel.imageName isEqualToString:@""])
        {
            make.height.equalTo(@0);
            
        }else
        {
            make.height.equalTo(@100);
            
        }
        
    }];
    self.titleLabel.text = messageModel.title;
    self.contentLabel.text = messageModel.content;
    
    [self.contentImgView setImageWithURL:[NSURL URLWithString:messageModel.imageName] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    
    
    if (![messageModel.imageName isEqualToString:@""])
    {
        [self.contentImgView setImageWithURL:[NSURL URLWithString:messageModel.imageName] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates usingActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];

    }
//
//
//        [_contentImgView remakeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(_dateLabel.mas_top).offset(-10);
//            make.left.right.equalTo(_userNameLabel);
//            //  make.height.equalTo(@100);
//            make.height.equalTo(@0);
//
//            
//        }];
//
//        
//      
//    }else
//    {
//        [_contentImgView remakeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(_dateLabel.mas_top).offset(-10);
//            make.left.right.equalTo(_userNameLabel);
//            //  make.height.equalTo(@100);
//            make.height.equalTo(@100);
//            
//            
//        }];
//
//    }
//    [self.contentView setNeedsUpdateConstraints];
//    
//    // update constraints now so we can animate the change
//    [self.contentView updateConstraintsIfNeeded];
//    //
//    [self.contentView layoutIfNeeded];
    
//    {
    
    

  //  [self.contentImgView sd_setImageWithURL:[NSURL URLWithString:messageModel.imageName] placeholderImage:[UIImage imageNamed:@"default.jog"] options:];
    
   // self.contentImgView.image = entity.imageName.length > 0 ? [UIImage imageNamed:entity.imageName] : nil;
    self.userNameLabel.text = messageModel.userName;
    self.dateLabel.text = messageModel.messageDate;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}
//- (CGSize)sizeThatFits:(CGSize)size {
//    CGFloat totalHeight = 0;
//    totalHeight += [self.titleLabel sizeThatFits:size].height;
//    totalHeight += [self.contentLabel sizeThatFits:size].height;
//    totalHeight += [self.userNameLabel sizeThatFits:size].height;
//    totalHeight += [self.contentImgView sizeThatFits:size].height;
//    totalHeight += [self.dateLabel sizeThatFits:size].height;
//
//    totalHeight += 40; // margins
//    return CGSizeMake(size.width, totalHeight);
//}

@end
