//
//  MySettingTableViewController.m
//  Market
//
//  Created by Lance_xu on 15/9/24.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "MySettingTableViewController.h"
#import "SettinglistTableViewCell.h"
#import "SettingLoginTableViewCell.h"
#import "OrderViewController.h"
#import "AdressManageViewController.h"
#import "FeedBackViewController.h"
#import "QRcodeShareViewController.h"
#import "AboutAPPViewController.h"
#import "ChangePasswordViewController.h"
#import <MessageUI/MessageUI.h>


@interface MySettingTableViewController ()<MFMessageComposeViewControllerDelegate>

@property (nonatomic ,strong) NSArray *tabImage1;
@property (nonatomic ,strong) NSArray *tabImage2;
@property (nonatomic ,strong) NSArray *cellNameArr1;
@property (nonatomic ,strong) NSArray *cellNameArr2;

@end

@implementation MySettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabImage1=[NSArray arrayWithObjects:@"ico_u_01",@"ico_u_02",@"ico_u_03",@"ico_u_04",@"ico_u_05", nil];
    self.tabImage2 =[NSArray arrayWithObjects:@"ico_u_06",@"ico_u_07",@"ico_u_08",@"ico_u_09", nil];
    self.cellNameArr1 =[NSArray arrayWithObjects:@"我的订单",@"地址管理",@"意见反馈",@"修改密码",@"修改手势密码", nil];
    self.cellNameArr2 =[NSArray arrayWithObjects:@"短信分享",@"二维码分享",@"版本检测",@"关于", nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark  -Tableview  Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section =[indexPath section];
    if ( 0 == section) {
        return 88;
    }
    else
        
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section =[indexPath section];
    if (0 == section) {
        
    }
    else if (1 == section) {
        switch (indexPath.row) {
            case 0:
            {
                OrderViewController *orderVC=[[OrderViewController alloc]init];
                [self.navigationController pushViewController:orderVC animated:YES];
            }
                break;
            case 1:
            {
                AdressManageViewController *addressManVC=[[AdressManageViewController alloc]initWithNibName:@"AdressManageViewController" bundle:nil];
                [self.navigationController pushViewController:addressManVC animated:YES];
            }
                break;
            case 2:
            {
                FeedBackViewController *feedBackVC=[[FeedBackViewController alloc]initWithNibName:@"FeedBackViewController" bundle:nil];
                [self.navigationController pushViewController:feedBackVC animated:YES];
            }
                break;
            case 3:
            {
                ChangePasswordViewController *changePSW=[[ChangePasswordViewController alloc]initWithNibName:@"ChangePasswordViewController" bundle:nil];
                [self.navigationController pushViewController:changePSW animated:YES];
            }
                break;
            case 4:
            {
                
            }
                break;
            default:
                break;
        }
        
    }
    else if( 2== section){
        switch (indexPath.row) {
            case 0:
            {
                [self showSMSPicker];
            }
                break;
            case 1:
            {
                QRcodeShareViewController *qrCode=[[QRcodeShareViewController alloc]initWithNibName:@"QRcodeShareViewController" bundle:nil];
                [self.navigationController pushViewController:qrCode animated:YES];
                
            }
                break;
            case 2:
            {
                UIAlertView *tip=[[UIAlertView alloc]initWithTitle:@"tip" message:@"need to do " delegate:self cancelButtonTitle:@"YES" otherButtonTitles:nil, nil];
                [tip show];
            }
                break;
            case 3:
            {
                AboutAPPViewController *aboutVC=[[AboutAPPViewController alloc]initWithNibName:@"AboutAPPViewController" bundle:nil];
                [self.navigationController pushViewController:aboutVC animated:YES];
            }
                break;
            
            default:
                break;
        }

    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (0 == section) {
        return 1;
    }
    else if (1 == section){
        return self.tabImage1.count;
    }
    else if (2 == section){
        return self.tabImage2.count;
    }
    else
        
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger  section =[indexPath section];
    
    if (1 ==section || 2== section) {
        static NSString * CellIdentifier = @"Cell";
        SettinglistTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray * nibViews = [[NSBundle mainBundle] loadNibNamed:@"SettinglistTableViewCell" owner:nil options:nil];
            cell = [nibViews objectAtIndex:0];
        }
        NSInteger index = [indexPath row];
        
        if (1== section) {
            [cell.listImage setImage:[UIImage imageNamed:self.tabImage1[index]]];
            cell.listTitle.text = self.cellNameArr1[index];
        }
        else if (2 == section){
            [cell.listImage setImage:[UIImage imageNamed:self.tabImage2[index]]];
            cell.listTitle.text = self.cellNameArr2[index];
        }
        
        return cell;
    }
    else if ( 0 == section)
    {
        static NSString * CellIdentifier = @"Cell";
        SettingLoginTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSArray * nibViews = [[NSBundle mainBundle] loadNibNamed:@"SettingLoginTableViewCell" owner:nil options:nil];
            cell = [nibViews objectAtIndex:0];
        }
        return  cell;
    }
    
    return nil;
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

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - message share

-(void)showSMSPicker{
    
    Class messageClass = (NSClassFromString(@"MFMessageComposeViewController"));
    
    
    
    if (messageClass != nil) {
        
        // Check whether the current device is configured for sending SMS messages
        
        if ([messageClass canSendText]) {
            
            [self displaySMSComposerSheet];
            
        }
        
        else {
            
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@""message:@"设备不支持短信功能" delegate:self cancelButtonTitle:@"确定"otherButtonTitles:nil];
            
            [alert show];
            
            
            
            
        }
        
    }
    
    else {
        
    }
    
}

-(void)displaySMSComposerSheet

{
    
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    
    picker.messageComposeDelegate =self;
    
    NSString *smsBody =[NSString stringWithFormat:@"我分享了文件给您，地址是%@",@"www.baidu.com"] ;
    
    picker.body=smsBody;
    
    [self presentModalViewController:picker animated:YES];
    

    
}
#pragma mark - MFMessageComposeViewControllerDelegate

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
            
            break;
        case MessageComposeResultFailed:
            
            break;
        case MessageComposeResultSent:
            
            break;
            
        default:
            break;
            
    }
    [self dismissModalViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
