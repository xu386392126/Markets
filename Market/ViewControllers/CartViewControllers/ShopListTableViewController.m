//
//  ShopListTableViewController.m
//  Market
//
//  Created by Lance_xu on 15/9/25.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "ShopListTableViewController.h"
#import "ShoppingListTableViewCell.h"
#import "ShopListGoodsModel.h"
@interface ShopListTableViewController ()<ShopListCellDelegate>
{
    float allPrice;
    NSMutableArray *infoArr;
}
@property(strong,nonatomic) UIButton *allSelectBtn;
@property(strong,nonatomic) UILabel *allPriceLab;
@property (strong ,nonatomic) UILabel *cardLeftLab;


@end

@implementation ShopListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据
    allPrice = 0.0;
    infoArr = [[NSMutableArray alloc]init];
    
    /**
     *  初始化一个数组，数组里面放字典。字典里面放的是单元格需要展示的数据
     */
    for (int i = 0; i<7; i++)
    {
        NSMutableDictionary *infoDict = [[NSMutableDictionary alloc]init];
        [infoDict setValue:@"img6.png" forKey:@"imageName"];
        [infoDict setValue:@"这是商品标题" forKey:@"goodsTitle"];
        [infoDict setValue:@"2000" forKey:@"goodsPrice"];
        [infoDict setValue:[NSNumber numberWithBool:NO] forKey:@"selectState"];
        [infoDict setValue:[NSNumber numberWithInt:1] forKey:@"goodsNum"];
        
        //封装数据模型
        ShopListGoodsModel *goodsModel = [[ShopListGoodsModel alloc]initWithDict:infoDict];
        
        //将数据模型放入数组中
        [infoArr addObject:goodsModel];
        
    }
    self.shopListTableview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-88) ;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
/**
 *  创建表格尾部视图
 *
 *  @return 返回一个UIView 对象视图，作为表格尾部视图
 */
-(UIView *)creatFootView{
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    
    //添加全选图片按钮
    _allSelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _allSelectBtn.frame = CGRectMake(10, 10, 50, 50);
    [_allSelectBtn setImage:[UIImage imageNamed:@"ico_radio"] forState:UIControlStateNormal];
    [_allSelectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:_allSelectBtn];
    
    //添加一个全选文本框标签
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, 60, 30)];
    lab.text = @"全选";
    [footView addSubview:lab];
    
   
    
    //添加小结文本框
    UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 5, 60, 30)];
    //lab2.textColor = [UIColor redColor];
    lab2.text = @"合计:";
    [footView addSubview:lab2];
    
    //添加一个总价格文本框，用于显示总价
    _allPriceLab = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50+60, 5, 100, 30)];
    _allPriceLab.textColor = [UIColor redColor];
    _allPriceLab.text = @"0.0";
    [footView addSubview:_allPriceLab];
    
    UILabel * left =[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, 37, 60, 30)];
    left.text= @"饭卡余额:";
    left.font = [UIFont systemFontOfSize:12];
    [footView addSubview:left];
    
    _cardLeftLab =[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50+63, 37, 100, 30)];
    _cardLeftLab.text =@"1111.0";
    _cardLeftLab.font =[UIFont systemFontOfSize:12];
    [footView addSubview:_cardLeftLab];
    
    
    //添加一个结算按钮
    UIButton *settlementBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [settlementBtn setTitle:@"确定下单" forState:UIControlStateNormal];
    settlementBtn .titleLabel.font = [UIFont systemFontOfSize:20];
    [settlementBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    settlementBtn.frame = CGRectMake(self.view.frame.size.width-100, 0, 100, 44);
    settlementBtn.backgroundColor = [UIColor orangeColor];
    [settlementBtn addTarget:self action:@selector(orderMarket) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:settlementBtn];
    
    
    return footView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120 ;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [self creatFootView];
}
//单元格选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  判断当期是否为选中状态，如果选中状态点击则更改成未选中，如果未选中点击则更改成选中状态
     */
    ShopListGoodsModel *model = infoArr[indexPath.row];
    
    if (model.selectState)
    {
        model.selectState = NO;
    }
    else
    {
        model.selectState = YES;
    }
    
    //刷新整个表格
    //    [_MyTableView reloadData];
    
    //刷新当前行
    [self.shopListTableview reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self totalPrice];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return infoArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * CellIdentifier = @"Cell";
    ShoppingListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray * nibViews = [[NSBundle mainBundle] loadNibNamed:@"ShoppingListTableViewCell" owner:nil options:nil];
        cell = [nibViews objectAtIndex:0];
    }
    
    //调用方法，给单元格赋值
    [cell addTheValue:infoArr[indexPath.row]];
    
    return cell ;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/




#pragma mark - other

- (void) orderMarket
{
    
}
/**
 *  全选按钮事件
 *
 *  @param sender 全选按钮
 */
-(void)selectBtnClick:(UIButton *)sender
{
    //判断是否选中，是改成否，否改成是，改变图片状态
    sender.tag = !sender.tag;
    if (sender.tag)
    {
        [sender setImage:[UIImage imageNamed:@"ico_radio_checked"] forState:UIControlStateNormal];
        
    }else{
        [sender setImage:[UIImage imageNamed:@"ico_radio"] forState:UIControlStateNormal];
    }
    //改变单元格选中状态
    for (int i=0; i<infoArr.count; i++)
    {
        ShopListGoodsModel *model = [infoArr objectAtIndex:i];
        model.selectState = sender.tag;
    }
    //计算价格
    [self totalPrice];
    //刷新表格
    [self.shopListTableview reloadData];
    
}
#pragma mark - 全选总价计算
-(void)totalPrice
{
    //遍历整个数据源，然后判断如果是选中的商品，就计算价格（单价 * 商品数量）
    for ( int i =0; i<infoArr.count; i++)
    {
        ShopListGoodsModel *model = [infoArr objectAtIndex:i];
        if (model.selectState)
        {
            allPrice = allPrice + model.goodsNum *[model.goodsPrice intValue];
        }
    }
    
    //给总价文本赋值
    _allPriceLab.text = [NSString stringWithFormat:@"%.2f",allPrice];
    NSLog(@"%f",allPrice);
    
    //每次算完要重置为0，因为每次的都是全部循环算一遍
    allPrice = 0.0;
}

@end
