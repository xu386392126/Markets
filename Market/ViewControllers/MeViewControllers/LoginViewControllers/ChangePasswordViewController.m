//
//  ChangePasswordViewController.m
//  Market
//
//  Created by Lance_xu on 15/9/24.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()<UITextFieldDelegate>

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.oldPassword .delegate =self;
    self.PasswordNew.delegate = self;
    self.passwordNewAgain.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITextfieldDelegate 


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changePswAction:(id)sender {
    
}
@end
