//
//  UITextField+CharactorLimit.m
//  MoneyOrg
//
//  Created by Jeffrey on 15/11/3.
//  Copyright © 2015年 sheely.paean.coretest. All rights reserved.
//

#import "UITextField+CharactorLimit.h"

@implementation UITextField (CharactorLimit)

- (void)limitToNumberOfCharactors:(NSUInteger)numberOfCharactors; {
    NSString *lang = self.textInputMode.primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [self markedTextRange];
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            if (self.text.length > numberOfCharactors) {
                self.text = [self.text substringToIndex:numberOfCharactors];
            }
        }
    } else {
        if (self.text.length > numberOfCharactors) {
            self.text = [self.text substringToIndex:numberOfCharactors];
        }
    }
}

@end
