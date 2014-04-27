//
//  APTViewController.m
//  Appium-test
//
//  Created by 比留間 和也 on 2014/04/24.
//  Copyright (c) 2014年 比留間 和也. All rights reserved.
//

#import "APTViewController.h"

@interface APTViewController ()

@end

@implementation APTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.accessibilityIdentifier = @"testview";

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(5, 5, 310, 320)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(3, 3, 300, 300)];
    subview.backgroundColor = [UIColor greenColor];
    [view addSubview:subview];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, 200, 150)];
    [subview addSubview:textView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 100, 50)];
    [button setTitle:@"Button"
            forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.accessibilityElementsHidden = NO;
    button.accessibilityLabel = @"testbutton";
    [button addTarget:self
               action:@selector(tap)
     forControlEvents:UIControlEventTouchUpInside];
    [subview addSubview:button];
}

- (void)tap
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tap in a button"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tap in a view"
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK",nil];
    [alert show];
}

@end
