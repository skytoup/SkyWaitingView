//
//  SkyBaseWaitingView.h
//  SkyWaitingView
//
//  Created by skytoup on 15/6/30.
//  Copyright (c) 2015年 skytoup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkyBaseWaitingView : UIView
{
    @protected
    CAGradientLayer *_gl;
    CAShapeLayer *_sl;
}
@property (assign, nonatomic) CGFloat r; // 圆半径
@property (assign, nonatomic) CGFloat ringWidth; // 圆环的宽度
@property (assign, nonatomic) UIColor *ringColor; // 圆环颜色

- (void)updateSubLayerFrame;
@end
