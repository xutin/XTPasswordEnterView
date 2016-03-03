//
//  UITextField+CharactorLimit.h
//  MoneyOrg
//
//  Created by Jeffrey on 15/11/3.
//  Copyright © 2015年 sheely.paean.coretest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CharactorLimit)

//在UITextFieldTextDidChangeNotification的回调方法中调用此方法
- (void)limitToNumberOfCharactors:(NSUInteger)numberOfCharactors;

@end
