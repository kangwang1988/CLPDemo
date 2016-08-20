//
//  NKAutohomeController.m
//  CLPDemo
//
//  Created by KyleWong on 20/08/2016.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKAutohomeController.h"
#import "NKAutohomeView.h"

@interface NKAutohomeController ()
@property (nonatomic,strong) NKAutohomeView *autohomeView;
@property (nonatomic,strong) NSMutableDictionary *plistDict;
@property (nonatomic,assign) NSInteger reqCnt;
@end

@implementation NKAutohomeController
- (instancetype)init{
    if(self = [super init]){
        [self setPlistDict:[NSMutableDictionary new]];
    }
    return self;
}

- (void)loadView{
    [self setAutohomeView:[NKAutohomeView new]];
    [self setView:self.autohomeView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:kFeatureAutohome];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setReqCnt:0];
    for(NSInteger i=0;i<=300;i++){
        NSString *url = [NSString stringWithFormat:@"http://w.cn/%ld.json",i];
        self.reqCnt++;
        [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if(!error){
                    NSError *err = nil;
                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
                    dict = [dict[@"1"][@"2"] firstObject];
                    NSString *b = dict[@"3"];
                    NSArray *s = dict[@"4"];
                    if(b.length && s.count)
                        [self.plistDict setValue:s forKey:b];
                }
                self.reqCnt--;
            });
        }] resume];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setReqCnt:(NSInteger)reqCnt{
    _reqCnt = reqCnt;
    if(!_reqCnt){
        [self.plistDict writeToFile:[NSTemporaryDirectory() stringByAppendingPathComponent:@"info.plist"] atomically:YES];
    }
}
@end
