//
//  SkyBaseWaitingView.m
//  SkyWaitingView
//
//  Created by skytoup on 15/6/30.
//  Copyright (c) 2015年 skytoup. All rights reserved.
//

#import "SkyBaseWaitingView.h"

@interface SkyBaseWaitingView ()

@end

@implementation SkyBaseWaitingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self skyBaseInitSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self skyBaseInitSelf];
    }
    return self;
}

- (void)skyBaseInitSelf {
    _gl = [CAGradientLayer layer];
    _sl = [CAShapeLayer layer];
    
    _gl.startPoint = CGPointMake(.0f, .5f);
    _gl.endPoint = CGPointMake(1.f, .5f);
    _sl.fillColor = [UIColor clearColor].CGColor;
    _sl.strokeColor = [UIColor clearColor].CGColor;
    _sl.lineCap = kCALineCapRound;
    _sl.lineJoin = kCALineJoinRound;
    _gl.mask = _sl;
    
    [self.layer addSublayer:_gl];
    
    _r = 30.f;
    _ringWidth = 3.f;
    
    [self updateSubLayerFrame];
}


- (void)updateSubLayerFrame {
    CGFloat s = _r*2.f+_ringWidth;
    CGRect r = CGRectMake(.0f, .0f, s, s);
    _gl.frame = r;
    _sl.frame = r;
}


- (void)setR:(CGFloat)r {
    _r = r>.0f?r:1.f;
    [self updateSubLayerFrame];
}

- (void)setRingWidth:(CGFloat)ringWidth {
    _ringWidth = ringWidth>.0f?ringWidth:1.f;
    _sl.lineWidth = _ringWidth;
    [self updateSubLayerFrame];
}

- (void)setRingColor:(UIColor *)ringColor {
    _ringColor = ringColor;
}


- (CGSize)sizeThatFits:(CGSize)size {
    [super sizeThatFits:size];
    CGFloat s = _r*2.f+_ringWidth;
    return CGSizeMake(s, s);
}

- (void)sizeToFit {
    [super sizeToFit];
    CGFloat s = _r*2.f+_ringWidth;
    self.frame = (CGRect){ self.frame.origin, {s,s} };
}

@end
