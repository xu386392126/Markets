//
//  NSDictionary+slb.m
//  Market
//
//  Created by YAO on 15/9/25.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "NSDictionary+slb.h"

@implementation NSDictionary (slb)


- (id)dictionaryForKey
{
    return [self objectForKey:@"body"];
}

- (BOOL)successful
{
    NSInteger code = [[self valueForKey:@"ecode"] integerValue];
    return  code == 0 ? YES : NO;
}

- (NSString *)errorString
{
    return [self valueForKey:@"msg"];
}


@end
