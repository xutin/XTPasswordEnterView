//
//  PasswordEnterView.m
//  DBCustomer
//
//  Created by Xuting on 16/1/20.
//  Copyright © 2016年 7. All rights reserved.
//

#import "PasswordEnterView.h"
#define mainViewWidth 270.f
#define mainViewHeight 245.f
#define selfWidth CGRectGetWidth(self.frame)
#define selfHeight CGRectGetHeight(self.frame)
#define kFont_System_10 [UIFont systemFontOfSize:10.f]
#define kFont_System_11 [UIFont systemFontOfSize:11.f]
#define kFont_System_12 [UIFont systemFontOfSize:12.f]
#define kFont_System_13 [UIFont systemFontOfSize:13.f]
#define kFont_System_15 [UIFont systemFontOfSize:15.f]
#define kFont_System_16 [UIFont systemFontOfSize:16.f]
#define kFont_System_17 [UIFont systemFontOfSize:17.f]
#define kFont_System_18 [UIFont systemFontOfSize:18.f]
#define kFont_System_21 [UIFont systemFontOfSize:21.f]
#define kFont_System_23 [UIFont systemFontOfSize:23.f]

@interface PasswordEnterView()
@property (nonatomic, strong) UILabel * topTextLabel;
@property (nonatomic, strong) UILabel * centerFirstLabel;
@property (nonatomic, strong) UILabel * centerSecondLabel;
@property (nonatomic, strong) UIButton * bottomButton;
@property (nonatomic, strong) UIView * mainView;
@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UIButton * closeButton;
@property (nonatomic, strong) UIViewController * vc;

@end

@implementation PasswordEnterView

- (void)dealloc
{
    [self.passwordField removeObserver:self forKeyPath:@"self.password" context:nil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}
- (void)initialization
{

    
    [self.passwordField addObserver:self forKeyPath:@"self.password" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    self.bgColor = [UIColor clearColor];
    self.mainViewBGColor = [UIColor whiteColor];
    self.topTextColor = [UIColor redColor];;
    self.centerFirstTextColor = [UIColor lightGrayColor];
    self.centerSecondTextColor = [UIColor redColor];
    self.bottomTextColor = [UIColor orangeColor];
    self.lineColor = [UIColor lightGrayColor];
    self.topText = @"请输入交易密码";
    self.centerFirstText = @"账户余额";
    self.centerSecondText = @"1，000，000元";
    self.bottomButtonTitle = @"忘记交易密码？";
    [self addSubview:self.mainView];
    [self.mainView addSubview:self.topTextLabel];
    [self.mainView addSubview:self.closeButton];
    [self.mainView addSubview:self.line];
    [self.mainView addSubview:self.centerFirstLabel];
    [self.mainView addSubview:self.centerSecondLabel];
    [self.mainView addSubview:self.passwordField];
    [self.mainView addSubview:self.bottomButton];

}
- (void)layoutSubviews
{
    self.mainView.layer.cornerRadius = 5.f;
    self.mainView.layer.masksToBounds = YES;
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"self.password"]) {
        if (self.passwordEnterChangedBlock) {
            NSString *password = [change valueForKey:@"new"];
            _passwordEnterChangedBlock(password);
        }
        
    }
}
#pragma mark -- Actions
- (void)closeButtonClicked:(UIButton *)button
{
    [self dismiss];
}
- (void)bottomButtonClicked:(UIButton *)button
{
    if (self.bottomClicked) {
        _bottomClicked(button);
    }
}
#pragma mark - Public methods

- (void)showInSuperVC:(UIViewController *)vc;
{
    self.vc = vc;
    self.frame = vc.view.frame;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1.f animations:^{
        weakSelf.bgColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        [vc.view addSubview:weakSelf];
        
    } completion:^(BOOL finished) {
        
    }];
}
- (void)dismiss
{
    [self.passwordField clearPasswordField];
    [self removeFromSuperview];
}

#pragma mark -- Getters
- (UIView *)mainView
{
    if (_mainView == nil) {
        CGFloat startY = 0.f;
        if (selfWidth < 375.f) {
            startY = 100.f;
        }else {
            startY = 150.f;
        }
        _mainView = [[UIView alloc] initWithFrame:CGRectMake((selfWidth - mainViewWidth)/2, startY, mainViewWidth, mainViewHeight)];
    }
    return _mainView;
}
- (UILabel *)topTextLabel
{
    if (_topTextLabel == nil) {
        _topTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(40.f, 0, mainViewWidth - 40.f*2, 45.f)];
        _topTextLabel.backgroundColor = [UIColor clearColor];
        _topTextLabel.font = [UIFont systemFontOfSize:16.f];
        _topTextLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _topTextLabel;
}
- (UIButton *)closeButton
{
    if (_closeButton == nil) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _closeButton.backgroundColor = [UIColor clearColor];
        [_closeButton setImage:[UIImage imageNamed:@"btn_close"] forState:UIControlStateNormal];
        _closeButton.frame = CGRectMake(mainViewWidth - 20.f - 24.f, 16.f, 24.f, 24.f);
        [_closeButton addTarget:self action:@selector(closeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (UIView *)line
{
    if (_line == nil) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, self.topTextLabel.frame.size.height, mainViewWidth, 1)];
        
    }
    return _line;
}
- (UILabel *)centerFirstLabel
{
    if (_centerFirstLabel == nil) {
        _centerFirstLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.line.frame.origin.y + self.line.frame.size.height + 29, mainViewWidth, 15.f)];
        _centerFirstLabel.backgroundColor = [UIColor clearColor];
        _centerFirstLabel.font = kFont_System_13;
        _centerFirstLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _centerFirstLabel;
}
- (UILabel *)centerSecondLabel
{
    if (_centerSecondLabel == nil) {
        _centerSecondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,self.centerFirstLabel.frame.origin.y + self.centerFirstLabel.frame.size.height + 15.f, mainViewWidth, 25.f)];
        _centerSecondLabel.backgroundColor = [UIColor clearColor];
        _centerSecondLabel.font = kFont_System_23;
        _centerSecondLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _centerSecondLabel;
}
- (DQPasswordField *)passwordField
{
    if (_passwordField == nil) {
        _passwordField = [[DQPasswordField alloc] initWithFrame:CGRectMake(15, self.centerSecondLabel.frame.origin.y + self.centerSecondLabel.frame.size.height + 25.f, mainViewWidth - 15.f * 2, 40)];
        _passwordField.borderColor = [UIColor lightGrayColor];
        _passwordField.separatorColor = [UIColor lightGrayColor];
        _passwordField.backColor = [UIColor grayColor];
        _passwordField.cornerRadius = 5.f;
    }
    return _passwordField;
}
- (UIButton *)bottomButton
{
    if (_bottomButton == nil) {
        _bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomButton.backgroundColor = [UIColor clearColor];
        _bottomButton.frame = CGRectMake(mainViewWidth - 15 - 120.f, mainViewHeight - 18.f - 14.f, 120.f, 14.f);
        _bottomButton.titleLabel.font = kFont_System_12;
        _bottomButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_bottomButton addTarget:self action:@selector(bottomButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _bottomButton;
}
- (void)setBgColor:(UIColor *)bgColor
{
    self.backgroundColor = bgColor;
}
- (void)setMainViewBGColor:(UIColor *)mainViewBGColor
{
    _mainViewBGColor = mainViewBGColor;
    self.mainView.backgroundColor = mainViewBGColor;
}

- (void)setTopText:(NSString *)topText
{
    _topText = topText;
    self.topTextLabel.text = topText;
}

- (void)setTopTextColor:(UIColor *)topTextColor
{
    _topTextColor = topTextColor;
    self.topTextLabel.textColor = topTextColor;
}
- (void)setBottomTextColor:(UIColor *)bottomTextColor
{
    _bottomTextColor = bottomTextColor;
    [self.bottomButton setTitleColor:bottomTextColor forState:UIControlStateNormal];
    
}
- (void)setBottomButtonTitle:(NSString *)bottomButtonTitle
{
    _bottomButtonTitle = bottomButtonTitle;
    [self.bottomButton setTitle:bottomButtonTitle forState:UIControlStateNormal];
}


- (void)setCenterFirstText:(NSString *)centerFirstText
{
    _centerFirstText = centerFirstText;
    self.centerFirstLabel.text = centerFirstText;
}
- (void)setCenterFirstTextColor:(UIColor *)centerFirstTextColor
{
    _centerSecondTextColor = centerFirstTextColor;
    self.centerFirstLabel.textColor = centerFirstTextColor;
}
- (void)setCenterSecondText:(NSString *)centerSecondText
{
    _centerSecondText = centerSecondText;
    self.centerSecondLabel.text = centerSecondText;
}
- (void)setCenterSecondTextColor:(UIColor *)centerSecondTextColor
{
    _centerSecondTextColor = centerSecondTextColor;
    self.centerSecondLabel.textColor = centerSecondTextColor;
}

- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    self.line.backgroundColor = lineColor;
}
@end
