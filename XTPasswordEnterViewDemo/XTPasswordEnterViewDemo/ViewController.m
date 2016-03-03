//
//  ViewController.m
//  XTPasswordEnterViewDemo
//
//  Created by Xuting on 16/3/3.
//  Copyright © 2016年 Peter Peng. All rights reserved.
//

#import "ViewController.h"
#import "PasswordEnterView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touch:(id)sender {
    PasswordEnterView *passwordEnterView = [[PasswordEnterView alloc] initWithFrame:self.view.frame];
    passwordEnterView.centerFirstText = @"银行卡充值";
    passwordEnterView.centerSecondText = @"100元";
    
    [passwordEnterView showInSuperVC:self];
    passwordEnterView.passwordEnterChangedBlock = ^(NSString * password)
    {
        //判断输入的交易密码是否正确,并且提交订单
        if ([password isKindOfClass:[NSString class]]) {
            if (password.length == 6) {
                NSLog(@"The password length is six.");
            }
            
        }
    };
    passwordEnterView.bottomClicked = ^(id sender)
    {
        NSLog(@"忘交易密码");
    };

}

@end
