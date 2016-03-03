//
//  DQPasswordField.m
//  DBCustomer
//
//  Created by Jeffrey on 16/1/20.
//  Copyright © 2016年 7. All rights reserved.
//

#import "DQPasswordField.h"
#import "UITextField+CharactorLimit.h"

@interface DQPasswordField ()

@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong, readwrite) NSString *password;

@end

@implementation DQPasswordField

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ([super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.borderColor = [UIColor redColor];
    self.lineWidth = 1.0;
    self.separatorColor = [UIColor lightGrayColor];
    self.cornerRadius = 3.0;
    self.backColor = [UIColor whiteColor];
    
    [self addSubview:self.passwordField];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self addGestureRecognizer:tap];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)layoutSubviews {
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);

    self.layer.cornerRadius = self.cornerRadius;
    
    if (self.showShadow) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-0.5, -0.5, width+1, height+1) cornerRadius:self.cornerRadius];
        self.layer.shadowPath = path.CGPath;
        self.layer.shadowColor = self.borderColor.CGColor;
        self.layer.shadowOffset = CGSizeZero;
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowRadius = self.cornerRadius;
    }

    [self.passwordField becomeFirstResponder];
}

#pragma mark - Events and Actions
- (void)textFieldTextDidChangeNotification:(NSNotification *)notification {
    [self.passwordField limitToNumberOfCharactors:6];
    self.password = self.passwordField.text;
    [self setNeedsDisplay];
    
    if (self.password.length == 6) {
        if (self.completeBlock && [self.passwordField isFirstResponder]) {
            self.completeBlock(self.password);
        }
    }
}

- (void)tapped:(UITapGestureRecognizer *)tapGesture {
    [self.passwordField becomeFirstResponder];
}
- (void)clearPasswordField
{
    self.passwordField.text = @"";
    self.password = @"";
    [self setNeedsDisplay];

}

- (void)drawRect:(CGRect)rect {
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    [self.borderColor setStroke];
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.lineWidth/2, self.lineWidth/2, width-self.lineWidth, height-self.lineWidth) cornerRadius:self.cornerRadius];
    borderPath.lineWidth = self.lineWidth;
    [borderPath stroke];

    [self.backColor setFill];
    UIBezierPath *backPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.lineWidth, self.lineWidth, width-2*self.lineWidth, height-2*self.lineWidth) cornerRadius:self.cornerRadius];
    [backPath fill];
    
    [self.separatorColor setStroke];
    CGFloat divideWidth = CGRectGetWidth(rect)/6;
    for (NSInteger i = 0; i < 5; i++) {
        UIBezierPath *dividePath = [UIBezierPath new];
        dividePath.lineWidth = self.lineWidth;
        [dividePath moveToPoint:CGPointMake(divideWidth*(i+1), self.lineWidth)];
        [dividePath addLineToPoint:CGPointMake(divideWidth*(i+1), CGRectGetHeight(rect)-self.lineWidth)];
        [dividePath stroke];
    }
    
    NSInteger numberOfWord = self.password.length;
    CGFloat dotWidth = 12;
    [[UIColor blackColor] setFill];
    for (NSInteger i = 0; i < numberOfWord; i++) {
        UIBezierPath *dotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake((divideWidth-dotWidth)/2+i*divideWidth, (height-dotWidth)/2, dotWidth, dotWidth)];
        [dotPath fill];
    }
}

#pragma mark - Getters and Setters
- (UITextField *)passwordField {
    if (_passwordField == nil) {
        _passwordField = [[UITextField alloc] initWithFrame:CGRectZero];
        _passwordField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _passwordField;
}

@end
