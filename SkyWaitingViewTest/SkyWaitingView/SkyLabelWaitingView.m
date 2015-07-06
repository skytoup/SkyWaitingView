//
//  SkyLabelWaitingView.m
//  SkyWaitingView
//
//  Created by skytoup on 15/6/30.
//  Copyright (c) 2015年 skytoup. All rights reserved.
//

#import "SkyLabelWaitingView.h"

@interface SkyLabelWaitingView ()
@property (strong, nonatomic) CADisplayLink *dl;
@property (copy, nonatomic) SkyLabelTextBlock block;
@end

@implementation SkyLabelWaitingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self skyLabelInitSelf];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self skyLabelInitSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self skyLabelInitSelf];
    }
    return self;
}

- (void)skyLabelInitSelf {
    _label = [UILabel new];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = [UIColor blackColor];
    [self addSubview:_label];
    [self updateSubLayerFrame];
}

- (void)updateSubLayerFrame {
    [super updateSubLayerFrame];
    CGFloat s = self.r*2.f+self.ringWidth;
    CGRect r = CGRectMake(.0f, .0f, s, s);
    _label.frame = r;
}


- (void)skyChangeLabelText:(id)dl {
    _label.text = _block(self);
}


- (void)startWithLabelTextBlock:(SkyLabelTextBlock)block {
    [self start];
    self.block = block;
    _dl = [CADisplayLink displayLinkWithTarget:self selector:@selector(skyChangeLabelText:)];
    _dl.frameInterval = 1.f/self.rate*10;
    [_dl addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopWithHidRing:(BOOL)hidden {
    [super stopWithHidRing:hidden];
    [_dl invalidate];
    _dl = nil;
    self.block = nil;
}

@end