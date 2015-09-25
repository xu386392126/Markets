//
//  ShopListGoodsModel.h
//  Market
//
//  Created by Lance_xu on 15/9/25.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopListGoodsModel : NSObject

@property(strong,nonatomic)NSString *imageName;//商品图片
@property(strong,nonatomic)NSString *goodsTitle;//商品标题
@property(strong,nonatomic)NSString *goodsPrice;//商品单价
@property(assign,nonatomic)BOOL selectState;//是否选中状态
@property(assign,nonatomic)int goodsNum;//商品个数

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
