//
//  DBMessageModel.m
//  LayoutCell
//
//  Created by dengbin on 16/12/5.
//  Copyright © 2016年 dengbin. All rights reserved.
//

#import "DBMessageModel.h"

@implementation DBMessageModel
- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
    
    // Store a value that needs to be determined locally upon initialization.
    //  _retrievedAt = [NSDate date];
    
    return self;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"title":@"title",
             @"content":@"content",
             @"userName":@"username",
             @"messageDate":@"time",
             @"imageName":@"imageName"
             };
    
}

//+ (NSValueTransformer *)dateJSONTransformer
//{
//    
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(ns *number, BOOL *success, NSError *__autoreleasing *error) {
//        NSTimeInterval secs = [number doubleValue];
//        
//        //把获取到的number类型转化成自己想要的date
//        return [NSDate dateWithTimeIntervalSince1970:secs];
//        
//    } reverseBlock:^id(NSDate *value, BOOL *success, NSError *__autoreleasing *error) {
//        //model变回json串时把date变成number类型
//        NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[value timeIntervalSince1970]];
//        return @([timeSp doubleValue]);
//        
//    }];
//    
//}
//
//+ (NSValueTransformer *)messageDateJSONTransformer
//{
//    return [self dateJSONTransformer];
//}

//+ (NSValueTransformer *)stateJSONTransformer
//{
//    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber *number, BOOL *success, NSError *__autoreleasing *error) {
//        NSString *state = [number stringValue];
//
//        //把获取到的number类型转化成自己想要的date
//        return state;
//
//    } reverseBlock:^id(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
//        //model变回json串时把date变成number类型
//
//        return @([value integerValue]);
//
//    }];
//}



@end
