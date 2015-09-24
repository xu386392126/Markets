//
//  URLManage.m
//  Market
//
//  Created by YAO on 15/9/24.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "URLManage.h"

@implementation URLManage

+ (instancetype)sharedManager
{
   static URLManage *url = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        url = [[URLManage alloc]init];
    });
    return url;
}

- (NSString *)baseUrl
{
    return  @"http://60.190.129.49:6600/jxshop/api/";
}

@end
