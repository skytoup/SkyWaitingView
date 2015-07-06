//
//  SkyCircleWatingView.h
//  SkyWaitingView
//
//  Created by skytoup on 15/6/30.
//  Copyright (c) 2015年 skytoup. All rights reserved.
//

#import "SkyBaseWaitingView.h"

/**
 *  圆环等待动画
 */
@interface SkyCircleWatingView : SkyBaseWaitingView
@property (assign, nonatomic) CGFloat rate; // 秒/圈，动画开始后不能修改
@property (assign, nonatomic) BOOL hideRing; // 隐藏圆环
@property (assign, nonatomic, readonly) BOOL isStartAnimation; // 是否开始了动画

/**
 *  开始动画
 */
- (void)start;

/**
 *  恢复动画，当从后台进入app的时候，需要调用一下才能恢复动画
 */
- (void)resume;

/**
 *  停止动画
 *
 *  @param hidden 是否隐藏圆环
 */
- (void)stopWithHidRing:(BOOL)hidden;
@end
