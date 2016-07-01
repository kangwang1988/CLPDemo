//
//  NKSendPaymentUIView.m
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKSendPaymentUIView.h"

@interface NKSendPaymentUIView()
@property (nonatomic,copy) NSString *payee;
@property (nonatomic,copy) NSString *amount;
@property (nonatomic,copy) NSString *note;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *payeeLabel;
@property (nonatomic,strong) UILabel *amountLabel;
@property (nonatomic,strong) UILabel *noteLabel;
@end

@implementation NKSendPaymentUIView
- (instancetype)initWithPayee:(NSString *)aPayee amount:(NSString *)aAmount note:(NSString *)aNote{
    if(self = [super init]){
        _payee = aPayee;
        _amount = aAmount;
        _note = aNote;
        [self commonInit];
        [self makeConstraints];
        [self updateUIComponents];
    }
    return self;
}

- (void)commonInit{
    [super commonInit];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.titleLabel = [UILabel new];
    [self.titleLabel setTextColor:[UIColor grayColor]];
    [self.titleLabel setFont:FONT(kPixelFrom750(20))];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.titleLabel];
    
    self.payeeLabel = [UILabel new];
    [self.payeeLabel setTextColor:[UIColor grayColor]];
    [self.payeeLabel setFont:FONT(kPixelFrom750(16))];
    [self.payeeLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.payeeLabel];
    
    self.amountLabel = [UILabel new];
    [self.amountLabel setTextColor:[UIColor grayColor]];
    [self.amountLabel setFont:FONT(kPixelFrom750(18))];
    [self.amountLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.amountLabel];
    
    self.noteLabel = [UILabel new];
    [self.noteLabel setTextColor:[UIColor orangeColor]];
    [self.noteLabel setFont:FONT(kPixelFrom750(16))];
    [self.noteLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.noteLabel];
}

- (void)makeConstraints{
    [super makeConstraints];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(kPixelFrom750(10));
        make.centerX.equalTo(self);
    }];
    [self.payeeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.left.centerX.equalTo(self.titleLabel);
    }];
    [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.payeeLabel.mas_bottom);
        make.left.centerX.equalTo(self.payeeLabel);
    }];
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(kPixelFrom750(-40));
        make.left.centerX.equalTo(self);
    }];
}

- (void)updateUIComponents{
    [super updateUIComponents];
    [self.titleLabel setText:@"支付一笔款项"];
    [self.payeeLabel setText:_payee];
    [self.amountLabel setText:_amount];
    [self.noteLabel setText:_note];
}

- (CGFloat)estimatedHeightWithConstraintWidth:(CGFloat)aConstraintWidth{
    UIView *fakeSupView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, aConstraintWidth, CGFLOAT_MAX)];
    NKSendPaymentUIView *msgView = [[NKSendPaymentUIView alloc] initWithPayee:self.payee amount:self.amount note:self.note];
    [fakeSupView addSubview:msgView];
    [msgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.equalTo(fakeSupView);
    }];
    [fakeSupView setNeedsLayout];
    [fakeSupView layoutIfNeeded];
    return msgView.bounds.size.height;
}
@end
