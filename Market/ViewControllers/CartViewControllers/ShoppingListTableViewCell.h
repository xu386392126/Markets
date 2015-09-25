//
//  ShoppingListTableViewCell.h
//  Market
//
//  Created by Lance_xu on 15/9/25.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopListGoodsModel.h"
//添加代理，用于按钮加减的实现
@protocol ShopListCellDelegate <NSObject>

-(void)btnClick:(UITableViewCell *)cell andFlag:(int)flag;

@end

@interface ShoppingListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *isSelectImg;

@property (weak, nonatomic) IBOutlet UIImageView *goodsImgV;
@property (weak, nonatomic) IBOutlet UILabel *goodsTitleLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *numCountLab;


@property(assign,nonatomic)BOOL selectState;//选中状态

@property(assign,nonatomic)id<ShopListCellDelegate>delegate;

@end
