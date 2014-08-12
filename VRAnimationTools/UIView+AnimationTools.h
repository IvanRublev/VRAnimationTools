//
//  UIView+AnimationTools.h
//  VRAnimationTools
//
//  Created by Ivan Rublev on 8/12/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPAnimationProgram.h"
#import "CPAnimationSequence.h"

@interface UIView (AnimationTools)
+ (void)changeVisibilityWithDuration:(NSTimeInterval)duration
                            toHidden:(NSArray *)hidden
                           toVisible:(NSArray *)visible
                        visibleAlpha:(CGFloat)alpha
                             finally:(void (^)(NSArray * hiddenViews, NSArray * visibleViews))finally
                            animated:(BOOL)animated;

+ (void)changeVisibilityWithDuration:(NSTimeInterval)duration
                            toHidden:(NSArray *)hidden
                           toVisible:(NSArray *)visible
                       visibleAlphas:(NSArray *)alphas
                             finally:(void (^)(NSArray * hiddenViews, NSArray * visibleViews))finally
                            animated:(BOOL)animated;

+ (void)changeVisibilityWithDuration:(NSTimeInterval)duration
              firstGroupHiddenSwitch:(BOOL *)pFirstHidden
                          firstGroup:(NSArray *)group1
                         secondGroup:(NSArray *)group2
                        visibleAlpha:(CGFloat)alpha
                             finally:(void (^)(NSArray * hiddenViews, NSArray * visibleViews))finally
                            animated:(BOOL)animated;

@end
