//
//  SkyLabelWaitingView.h
//  SkyWaitingView
//
//  Created by skytoup on 15/6/30.
//  Copyright (c) 2015年 skytoup. All rights reserved.
//

#import "SkyCircleWatingView.h"

@class SkyLabelWaitingView;

typedef NSString*(^SkyLabelTextBlock)(SkyLabelWaitingView *lv);

/**
 *  带label的圆环等待动画
 */
@interface SkyLabelWaitingView : SkyCircleWatingView
@property (strong, nonatomic) UILabel *label; // 标签

/**
 *  开始动画
 *
 *  @param block 动态显示文字
 */
- (void)startWithLabelTextBlock:(SkyLabelTextBlock)block;
@end
