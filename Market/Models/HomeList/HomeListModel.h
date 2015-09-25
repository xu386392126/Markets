//
//  HomeListModel.h
//  Market
//
//  Created by YAO on 15/9/25.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "Jastor.h"
#import "ListModel.h"

@interface HomeListModel : Jastor

@property (nonatomic ,strong) NSArray *newest;

@property (nonatomic ,strong) NSArray *recomment;

@property (nonatomic ,strong) NSArray *selling;

@end
