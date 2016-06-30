//
//  NKSendMessageUIView.m
//  CLPDemo
//
//  Created by KyleWong on 6/27/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKSendMessageUIView.h"

@interface NKSendMessageUIView()
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@end

@implementation NKSendMessageUIView
- (instancetype)init{
    if(self = [super init]){
        [self commonInit];
        [self makeConstraints];
        [self updateUIComponents];
    }
    return self;
}

- (void)commonInit{
    [self setBackgroundColor:[UIColor whiteColor]];
    self.titleLabel = [UILabel new];
    [self.titleLabel setTextColor:[UIColor grayColor]];
    [self.titleLabel setFont:FONT(kPixelFrom750(18))];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:self.titleLabel];
    
    self.nameLabel = [UILabel new];
    [self.nameLabel setTextColor:[UIColor grayColor]];
    [self.nameLabel setFont:FONT(kPixelFrom750(22))];
    [self.nameLabel setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:self.nameLabel];
    
    self.contentLabel = [UILabel new];
    [self.contentLabel setTextColor:[UIColor blackColor]];
    [self.contentLabel setFont:FONT(kPixelFrom750(16))];
    [self.contentLabel setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:self.contentLabel];
}

- (void)makeConstraints{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(kPixelFrom750(10));
        make.left.equalTo(self).offset(kPixelFrom750(20));
        make.centerX.equalTo(self);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerX.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kPixelFrom750(10));
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kPixelFrom750(30));
        make.top.equalTo(self.nameLabel.mas_bottom).offset(kPixelFrom750(10));
        make.centerX.equalTo(self);
        make.bottom.lessThanOrEqualTo(self);
    }];
}

- (void)updateUIComponents{
    [super updateUIComponents];
    [self.titleLabel setText:@"发送消息"];
    [self.nameLabel setText:[NSString stringWithFormat:@"To:%@",self.name]];
    [self.contentLabel setText:self.content];
}

- (CGFloat)estimatedHeightWithConstraintWidth:(CGFloat)aConstraintWidth{
    UIView *fakeSupView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, aConstraintWidth, CGFLOAT_MAX)];
    NKSendMessageUIView *msgView = [NKSendMessageUIView new];
    [msgView updateWithName:self.name content:self.content];
    [fakeSupView addSubview:msgView];
    [msgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.equalTo(fakeSupView);
    }];
    [fakeSupView setNeedsLayout];
    [fakeSupView layoutIfNeeded];
    return msgView.bounds.size.height;
}

- (void)updateWithName:(NSString *)aName content:(NSString *)aContent{
    [self setName:aName];
    [self setContent:aContent];
    [self updateUIComponents];
}
@end
