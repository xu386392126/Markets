//
//  FeedBackViewController.m
//  Market
//
//  Created by Lance_xu on 15/9/24.
//  Copyright (c) 2015年 YAO. All rights reserved.
//

#import "FeedBackViewController.h"
#import "StarRatingControl.h"
@interface FeedBackViewController ()<UITextViewDelegate>

@property (nonatomic,strong) StarRatingControl *imagesRatingControl1;
@property (nonatomic,strong) StarRatingControl *imagesRatingControl2;
@property (nonatomic,strong) StarRatingControl *imagesRatingControl3;

@property (nonatomic,strong) UITextView * adviceTextView;
@end

@implementation FeedBackViewController
@synthesize adviceTextView;

#pragma mark lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"意见反馈";
    
    [self.view setBackgroundColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0]];
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 66, self.view.frame.size.width, 190)];
    backgroundView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:backgroundView];
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width, 33)];
    lab1.text =@"你的反馈是我们改进的动力，谢谢!";
    [self.view addSubview:lab1];
    
    //评价的星星压缩
    UIImage *emptyStar, *fullStar;
    emptyStar= [self reSizeImage:[UIImage imageNamed:@"star"] toSize:CGSizeMake(30, 30)];
    
    fullStar=  [self reSizeImage:[UIImage imageNamed:@"star_checked"] toSize:CGSizeMake(30, 30)];
    
    {
        UILabel * lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, lab1.frame.size.height +90, 80, 33)];
        lab2.text =@"APP易用";
        [self.view addSubview:lab2];
        
        //评价星星
        
        _imagesRatingControl1 = [[StarRatingControl alloc] initWithLocation:CGPointMake(100,lab2.frame.origin.y)
                                                                emptyImage:emptyStar
                                                                solidImage:fullStar
                                                             initialRating:0.0
                                                              andMaxRating:5];
        _imagesRatingControl1.starSpacing=-20;
        [_imagesRatingControl1 setUserInteractionEnabled:YES];
        [self.view addSubview:_imagesRatingControl1];
    }
    {
        UILabel * lab3=[[UILabel alloc]initWithFrame:CGRectMake(10, lab1.frame.size.height +90+45, 80, 33)];
        lab3.text =@"服务态度";
        [self.view addSubview:lab3];
        
        //评价星星
        
        _imagesRatingControl2 = [[StarRatingControl alloc] initWithLocation:CGPointMake(100,lab3.frame.origin.y)
                                                                emptyImage:emptyStar
                                                                solidImage:fullStar
                                                             initialRating:0.0
                                                              andMaxRating:5];
        _imagesRatingControl2.starSpacing=-20;
        [_imagesRatingControl2 setUserInteractionEnabled:YES];
        [self.view addSubview:_imagesRatingControl2];
    }
    {
        UILabel * lab4=[[UILabel alloc]initWithFrame:CGRectMake(10, lab1.frame.size.height +90+45+45, 80, 33)];
        lab4.text =@"发货速度";
        [self.view addSubview:lab4];
        
        //评价星星
        
        _imagesRatingControl3 = [[StarRatingControl alloc] initWithLocation:CGPointMake(100,lab4.frame.origin.y)
                                                                emptyImage:emptyStar
                                                                solidImage:fullStar
                                                             initialRating:0.0
                                                              andMaxRating:5];
        _imagesRatingControl3.starSpacing=-20;
        [_imagesRatingControl3 setUserInteractionEnabled:YES];
        [self.view addSubview:_imagesRatingControl3];
    }
    
    UILabel *lab5 =[[UILabel alloc]initWithFrame:CGRectMake(10, _imagesRatingControl3.frame.origin.y +45, 100, 33)];
    lab5.text = @"意见或反馈";
    [self.view addSubview: lab5];
    
    adviceTextView=[[UITextView alloc]initWithFrame:CGRectMake(0, lab5.frame.origin.y +40, self.view.frame.size.width, 120)];
    adviceTextView.delegate = self;
    adviceTextView.scrollEnabled = NO;
    adviceTextView.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:adviceTextView];
    
}
#pragma mark UItextviewDelegate


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text

{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        return NO;
        
    }
    
    return YES;
    
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    float offset = 0.0f;
    
    if(self.adviceTextView == textView)
        
    {
        
        offset = - 180.0f;
        
    }
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard"context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    float width = self.view.frame.size.width;
    
    float height = self.view.frame.size.height;
    
    CGRect rect = CGRectMake(0.0f, offset , width, height);
    
    self.view.frame = rect;
    
    [UIView  commitAnimations];
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    [adviceTextView resignFirstResponder];
    
    float offset = 0.0f;
    
    NSTimeInterval animationDuration = 0.30f;
    
    [UIView beginAnimations:@"ResizeForKeyBoard"context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    
    float width = self.view.frame.size.width;
    
    float height = self.view.frame.size.height;
    
    CGRect rect = CGRectMake(0.0f, offset , width, height);
    
    self.view.frame = rect;
    
    [UIView commitAnimations];
}

#pragma mark - other

//压缩图片
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

//+ (float) heightForTextView: (UITextView *)textView WithText: (NSString *) strText{
//    float fPadding = 16.0; // 8.0px x 2
//    CGSize constraint = CGSizeMake(textView.contentSize.width - fPadding, CGFLOAT_MAX);
//    
//    CGSize size = [strText sizeWithFont: textView.font constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
//    
//    float fHeight = size.height + 16.0;
//    
//    return fHeight;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
