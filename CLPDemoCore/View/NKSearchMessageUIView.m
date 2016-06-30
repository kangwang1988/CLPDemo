//
//  NKSearchMessageUIView.m
//  CLPDemo
//
//  Created by KyleWong on 6/29/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKSearchMessageUIView.h"

@interface NKSearchMessageUIView()
@property (nonatomic,copy) NSString *criterion;
@property (nonatomic,copy) NSArray<INMessage *> *msgs;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *criterionLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@end

@implementation NKSearchMessageUIView
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
    
    self.criterionLabel = [UILabel new];
    [self.criterionLabel setTextColor:[UIColor grayColor]];
    [self.criterionLabel setFont:FONT(kPixelFrom750(22))];
    [self.criterionLabel setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:self.criterionLabel];
    
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
    [self.criterionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerX.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kPixelFrom750(10));
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kPixelFrom750(30));
        make.top.equalTo(self.criterionLabel.mas_bottom).offset(kPixelFrom750(10));
        make.centerX.equalTo(self);
        make.bottom.lessThanOrEqualTo(self);
    }];
}

- (void)updateUIComponents{
    [super updateUIComponents];
    [self.titleLabel setText:@"搜索消息"];
    [self.criterionLabel setText:[NSString stringWithFormat:@"%@",self.criterion]];
    [self.contentLabel setText:[NSString stringWithFormat:@"%@",self.msgs]];
}

- (CGFloat)estimatedHeightWithConstraintWidth:(CGFloat)aConstraintWidth{
    UIView *fakeSupView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, aConstraintWidth, CGFLOAT_MAX)];
    NKSearchMessageUIView *msgView = [NKSearchMessageUIView new];
    [msgView updateWithCriterion:self.criterion msgs:self.msgs];
    [fakeSupView addSubview:msgView];
    [msgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.equalTo(fakeSupView);
    }];
    [fakeSupView setNeedsLayout];
    [fakeSupView layoutIfNeeded];
    return msgView.bounds.size.height;
}

- (void)updateWithCriterion:(NSString *)aCriterion msgs:(NSArray<INMessage *> *)aMsgs{
    [self setCriterion:aCriterion];
    [self setMsgs:aMsgs];
    [self updateUIComponents];
}
@end
