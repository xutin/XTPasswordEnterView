//
//  PasswordEnterView.h
//  DBCustomer
//
//  Created by Xuting on 16/1/20.
//  Copyright © 2016年 7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQPasswordField.h"
typedef void (^BottomButtonClickedBlock)(id);
typedef void (^PasswordEnterChangedBlock)(NSString *);
@interface PasswordEnterView : UIView
@property (nonatomic, strong) UIColor * bgColor;
@property (nonatomic, strong) UIColor * mainViewBGColor;

@property (nonatomic, strong) UIColor * topTextColor;
@property (nonatomic, strong) NSString * topText;

@property (nonatomic, strong) UIColor * centerFirstTextColor;
@property (nonatomic, strong) NSString * centerFirstText;

@property (nonatomic, strong) UIColor * centerSecondTextColor;
@property (nonatomic, strong) NSString * centerSecondText;

@property (nonatomic, strong) UIColor * bottomTextColor;
@property (nonatomic, strong) NSString * bottomButtonTitle;


@property (nonatomic, strong) UIColor * lineColor;
@property (nonatomic, strong) DQPasswordField *passwordField;


@property (nonatomic, copy) BottomButtonClickedBlock  bottomClicked;
@property (nonatomic, copy) PasswordEnterChangedBlock passwordEnterChangedBlock;

- (void)showInSuperVC:(UIViewController *)vc;
- (void)dismiss;



@end
