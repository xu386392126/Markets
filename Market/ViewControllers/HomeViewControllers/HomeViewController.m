//
//  HomeViewController.m
//  Market
//
//  Created by YAO on 15/9/23.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "HomeViewController.h"
#import "XScrollViewCell.h"
#import "ASOXScrollTableViewCell.h"
#import "HomeService.h"



@interface HomeViewController () <ASOXScrollTableViewCellDelegate,HomeDelgate> {
    
     NSArray *_xScrollDataSource;
    
    ASOXScrollTableViewCell *_xScrollTableViewCell;
}

@property (nonatomic, strong) HomeService *homeService;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarbg"] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarbg"] forBarMetrics:UIBarMetricsDefaultPrompt];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"scan"] style:UIBarButtonItemStyleDone target:self action:@selector(scanAction:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mesg"] style:UIBarButtonItemStyleDone target:self action:@selector(messageAction:)];

    self.homeService = [[HomeService alloc]init];
    self.homeService.delgate = self;
    [self.homeService homeList];
    11111111
}

- (void)scanAction:(id)sender
{
    
}

- (void)messageAction:(id)sender
{
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Synchronize the height of each table row which hold the ASOXScrollTableViewCell.
    CGFloat result = _xScrollTableViewCell.contentCellSize.height;
    
    return result;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of category in the Data Source
    return [_xScrollDataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return 1; // In this example only one row of horizontal scrolled contents view for each section.
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [[_xScrollDataSource objectAtIndex:section] category];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    _xScrollTableViewCell = [ASOXScrollTableViewCell tableView:tableView cellForRowInTableViewIndexPath:indexPath withReusableCellIdentifier:cellIdentifier delegate:self];
    
    
    return _xScrollTableViewCell;
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

#pragma mark homedelegate
- (void)requestHomeList
{
    
    
}

- (void)requestHomeListFinishing:(HomeListModel *)model
{
    
    
    
}

- (void)requestHomeListFailed:(NSString *)errorString
{
    
    
    
}



@end
