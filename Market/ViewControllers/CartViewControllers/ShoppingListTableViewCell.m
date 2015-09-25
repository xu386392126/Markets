//
//  ShoppingListTableViewCell.m
//  Market
//
//  Created by Lance_xu on 15/9/25.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "ShoppingListTableViewCell.h"

@implementation ShoppingListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *  给单元格赋值
 *
 *  @param goodsModel 里面存放各个控件需要的数值
 */
-(void)addTheValue:(ShopListGoodsModel *)goodsModel
{
    _goodsImgV.image = [UIImage imageNamed:goodsModel.imageName];
    _goodsTitleLab.text = goodsModel.goodsTitle;
    _priceLab.text = goodsModel.goodsPrice;
    _numCountLab.text = [NSString stringWithFormat:@"%d",goodsModel.goodsNum];
    
    if (goodsModel.selectState)
    {
        _selectState = YES;
        _isSelectImg.image = [UIImage imageNamed:@"ico_radio_checked"];
    }else{
        _selectState = NO;
        _isSelectImg.image = [UIImage imageNamed:@"ico_radio"];
    }
    
}
/**
 *  点击减按钮实现数量的减少
 *
 *  @param sender 减按钮
 */
-(void)deleteBtnAction:(UIButton *)sender
{
    //判断是否选中，选中才能点击
    if (_selectState == YES)
    {
        //调用代理
        [self.delegate btnClick:self andFlag:(int)sender.tag];
    }
    
}
/**
 *  点击加按钮实现数量的增加
 *
 *  @param sender 加按钮
 */
-(void)addBtnAction:(UIButton *)sender
{
    //判断是否选中，选中才能点击
    if (_selectState == YES)
    {
        //调用代理
        [self.delegate btnClick:self andFlag:(int)sender.tag];
    }
    
}
@end
