//
//  ChangePasswordViewController.h
//  Market
//
//  Created by Lance_xu on 15/9/24.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *oldPassword;

@property (weak, nonatomic) IBOutlet UITextField *PasswordNew;
@property (weak, nonatomic) IBOutlet UITextField *passwordNewAgain;


- (IBAction)changePswAction:(id)sender;

@end
