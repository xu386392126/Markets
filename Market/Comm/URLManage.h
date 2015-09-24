//
//  URLManage.h
//  Market
//
//  Created by YAO on 15/9/24.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLManage : NSObject

+ (instancetype)sharedManager;

- (NSString *)baseUrl;

@end
