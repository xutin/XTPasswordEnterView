//
//  DQPasswordField.h
//  DBCustomer
//
//  Created by Jeffrey on 16/1/20.
//  Copyright © 2016年 7. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^DQPasswordInputCompleteBlock)(NSString *password);

IB_DESIGNABLE
@interface DQPasswordField : UIView

@property (nonatomic) IBInspectable BOOL showShadow;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat lineWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *backColor;
@property (nonatomic, strong) IBInspectable UIColor *separatorColor;


@property (nonatomic, strong, readonly) NSString *password;

- (void)clearPasswordField;

@property (nonatomic, strong) DQPasswordInputCompleteBlock completeBlock;

@end
