//
//  ViewController.m
//  Market
//
//  Created by YAO on 15/9/21.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarbg"] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbarbg"] forBarMetrics:UIBarMetricsDefaultPrompt];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
