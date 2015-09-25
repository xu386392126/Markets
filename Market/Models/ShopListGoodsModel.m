//
//  ShopListGoodsModel.m
//  Market
//
//  Created by Lance_xu on 15/9/25.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "ShopListGoodsModel.h"

@implementation ShopListGoodsModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.imageName = dict[@"imageName"];
        self.goodsTitle = dict[@"goodsTitle"];
        self.goodsPrice = dict[@"goodsPrice"];
        self.goodsNum = [dict[@"goodsNum"]intValue];
        self.selectState = [dict[@"selectState"]boolValue];
    }
    return  self;
}

@end
