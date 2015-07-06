//
//  ViewController.m
//  SkyWaitingViewTest
//
//  Created by skytoup on 15/6/30.
//  Copyright (c) 2015年 skytoup. All rights reserved.
//

#import "ViewController.h"
#import "SkyWaitingView/SkyWaitingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSInteger baseY = 30;
    SkyCircleWatingView *v = [SkyCircleWatingView new];
    v.frame = CGRectMake(50, baseY, 0, 0);
    [v sizeToFit];
    [self.view addSubview:v];
    v.rate = 1.f;
    [v start];
    baseY += 80;
    
    SkyCircleWatingView *v1 = [SkyCircleWatingView new];
    v1.ringColor = [UIColor redColor];
    v1.frame = CGRectMake(50, baseY, 0, 0);
    [v1 sizeToFit];
    [self.view addSubview:v1];
    [v1 start];
    baseY += 80;
    
    SkyCircleWatingView *v2 = [SkyCircleWatingView new];
    v2.ringWidth = 10.f;
    v2.r = 50.f;
    v2.rate = 5.f;
    v2.frame = CGRectMake(50, baseY, 0, 0);
    [v2 sizeToFit];
    [self.view addSubview:v2];
    [v2 start];
    baseY += 80;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [v1 stopWithHidRing:NO];
        [v2 stopWithHidRing:YES];
    });
    
    NSInteger __block p = 1;
    SkyLabelTextBlock b = ^NSString *(SkyLabelWaitingView *lv) {
        if(p<100) {
            p+=1;
            return ([[NSNumber numberWithInteger:p].stringValue stringByAppendingString:@"%"]);
        } else {
            [lv stopWithHidRing:NO];
            return @"完成";
        }
    };
    
    baseY = 30;
    
    SkyLabelWaitingView *lv = [SkyLabelWaitingView new];
    lv.ringColor = [UIColor orangeColor];
    lv.ringWidth = 8.f;
    lv.label.font = [UIFont systemFontOfSize:12.f];
    lv.label.text = @"等待中";
    lv.label.textColor = [UIColor purpleColor];
    lv.frame = CGRectMake(160, baseY, 0, 0);
    [lv sizeToFit];
    [self.view addSubview:lv];
    [lv start];
    baseY += 80;
    
    SkyLabelWaitingView *lv1 = [SkyLabelWaitingView new];
    lv1.ringColor = [UIColor blueColor];
    lv1.ringWidth = 8.f;
    lv1.frame = CGRectMake(160, baseY, 0, 0);
    [lv1 sizeToFit];
    [self.view addSubview:lv1];
    [lv1 startWithLabelTextBlock:b];
    baseY += 80;
    
    SkyLabelWaitingView *lv2 = [SkyLabelWaitingView new];
    lv2.label.textColor = [UIColor greenColor];
    lv2.label.font = [UIFont systemFontOfSize:30.f];
    lv2.r = 50;
    lv2.rate = .5f;
    lv2.ringWidth = 8.f;
    lv2.frame = CGRectMake(160, baseY, 0, 0);
    [lv2 sizeToFit];
    [self.view addSubview:lv2];
    [lv2 startWithLabelTextBlock:^NSString *(SkyLabelWaitingView *lv) {
        if(p<100) {
            return ([[NSNumber numberWithInteger:p].stringValue stringByAppendingString:@"%"]);
        } else {
            [lv stopWithHidRing:YES];
            return @"完成2";
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
