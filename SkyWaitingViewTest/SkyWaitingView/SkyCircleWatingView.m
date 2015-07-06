//
//  SkyCircleWatingView.m
//  SkyWaitingView
//
//  Created by skytoup on 15/6/30.
//  Copyright (c) 2015年 skytoup. All rights reserved.
//

#import "SkyCircleWatingView.h"

#define SkyCirCleWatingViewAnimateKey @"SkyCirCleWatingViewAnimateKey"

@implementation SkyCircleWatingView

@synthesize isStartAnimation = _isStartAnimation;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self skyCircelInitSelf];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self skyCircelInitSelf];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self skyCircelInitSelf];
    }
    return self;
}

- (void)skyCircelInitSelf {
    _rate = 3.5f;
    self.ringColor = [UIColor blackColor];
}

- (void)updateSubLayerFrame {
    [super updateSubLayerFrame];
    [self setBezierPathWithEndAngle:(_isStartAnimation?.75f:2.f)*M_PI];
}


- (void)startAnimation {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @0;
    animation.toValue = @(2.f*M_PI);
    animation.duration = _rate;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self->_gl addAnimation:animation forKey:SkyCirCleWatingViewAnimateKey];
}

- (void)stopAnimation {
    [self->_gl removeAnimationForKey:SkyCirCleWatingViewAnimateKey];
}

- (void)setBezierPathWithEndAngle:(CGFloat)endAngle {
    CGFloat cp = self.r+self.ringWidth/2.f;
    UIBezierPath *p = [UIBezierPath bezierPathWithArcCenter:CGPointMake(cp, cp) radius:self.r startAngle:.0f endAngle:endAngle clockwise:YES];
    self->_sl.path = p.CGPath;
}


- (void)setRingColor:(UIColor *)ringColor {
    [super setRingColor:ringColor];
    NSMutableArray *colors = [NSMutableArray new];
    for(int i=10;i>=0;i-=2) {
        [colors addObject:(__bridge id)[self.ringColor colorWithAlphaComponent:i*.1f].CGColor];
    }
    self->_gl.colors = colors;
}

- (void)setRate:(CGFloat)rate {
    if(!_isStartAnimation) {
        _rate = rate>0?rate:3.5f;
    }
}

- (void)setHideRing:(BOOL)hideRing {
    _hideRing = hideRing;
    self->_sl.strokeColor = hideRing?[UIColor clearColor].CGColor:self.ringColor.CGColor;
}


- (void)start {
    if(!_isStartAnimation) {
        _isStartAnimation = YES;
        [self setBezierPathWithEndAngle:.75f*M_PI];
        self->_sl.strokeColor = self.ringColor.CGColor;
        [self startAnimation];
    }
}

- (void)stopWithHidRing:(BOOL)hidden {
    if(_isStartAnimation) {
        self.hideRing = hidden;
        [self stopAnimation];
        _isStartAnimation = NO;
        [self setBezierPathWithEndAngle:2.f*M_PI];
    }
}

@end
