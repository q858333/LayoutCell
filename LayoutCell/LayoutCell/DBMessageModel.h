//
//  DBMessageModel.h
//  LayoutCell
//
//  Created by dengbin on 16/12/5.
//  Copyright © 2016年 dengbin. All rights reserved.
//


#import <Mantle/Mantle.h>

@interface DBMessageModel : MTLModel<MTLJSONSerializing>
@property(nonatomic,copy)NSString   *title;
@property(nonatomic,copy)NSString   *content;
@property(nonatomic,copy)NSString   *userName;
@property(nonatomic,copy)NSString   *messageDate;
@property(nonatomic,copy)NSString  *imageName;


- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error;

@end
