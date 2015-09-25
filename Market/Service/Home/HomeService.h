//
//  HomeService.h
//  Market
//
//  Created by YAO on 15/9/25.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "BaseService.h"
#import "HomeListModel.h"

@protocol HomeDelgate;

@interface HomeService : BaseService

- (void)homeList;

@property (nonatomic, weak) id <HomeDelgate> delgate;

@end



@protocol HomeDelgate <NSObject>

- (void)requestHomeList;

- (void)requestHomeListFinishing:(HomeListModel *)model;

- (void)requestHomeListFailed:(NSString *)errorString;

@end