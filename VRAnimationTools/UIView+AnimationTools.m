//
//  UIView+AnimationTools.m
//  VRAnimationTools
//
//  Created by Ivan Rublev on 8/12/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "UIView+AnimationTools.h"

@implementation UIView (AnimationTools)

+ (void)changeVisibilityWithDuration:(NSTimeInterval)duration
                            toHidden:(NSArray *)hidden
                           toVisible:(NSArray *)visible
                               visibleAlpha:(CGFloat)alpha
                             finally:(void (^)(NSArray *, NSArray *))finally
                            animated:(BOOL)animated
{
    [self changeVisibilityWithDuration:duration toHidden:hidden toVisible:visible visibleAlphas:@[@(alpha)] finally:finally animated:animated];
}

+ (void)changeVisibilityWithDuration:(NSTimeInterval)duration
                            toHidden:(NSArray *)hidden
                           toVisible:(NSArray *)visible
                       visibleAlphas:(NSArray *)alphas
                             finally:(void (^)(NSArray * hiddenViews, NSArray * visibleViews))finally
                            animated:(BOOL)animated;
{
    [[CPAnimationSequence sequenceWithSteps:
      [CPAnimationStep for:duration
       animate:^{
           [hidden enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
               ((UIView *)obj).alpha = 0.0;
           }];
           [visible enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
               NSNumber * alphaNumber;
               if (idx < [alphas count]) {
                   alphaNumber = alphas[idx];
               } else {
                   alphaNumber = [alphas lastObject];
               }
               ((UIView *)obj).alpha = [alphaNumber doubleValue];
           }];
       }],
      [CPAnimationStep after:0.0 animate:^{
        if (finally) {
            finally(hidden, visible);
        }
    }],
      nil] runAnimated:animated];
}

+ (void)changeVisibilityWithDuration:(NSTimeInterval)duration
              firstGroupHiddenSwitch:(BOOL *)pFirstHidden
                          firstGroup:(NSArray *)group1
                         secondGroup:(NSArray *)group2
                               visibleAlpha:(CGFloat)alpha
                             finally:(void (^)(NSArray * hiddenViews, NSArray * visibleViews))finally
                            animated:(BOOL)animated
{
    NSAssert(pFirstHidden, @"pFirstHidden must not be zero.");
    NSAssert(group1, @"group1 must be set.");
    NSAssert(group1, @"group2 must be set.");
    NSArray * show;
    NSArray * hide;
    if (!*pFirstHidden) {
        show = group1;
        hide = group2;
    } else {
        show = group2;
        hide = group1;
    }
    *pFirstHidden = !*pFirstHidden;
    [self changeVisibilityWithDuration:duration
                              toHidden:hide
                             toVisible:show
                                 visibleAlpha:alpha
                               finally:finally
                              animated:animated];
}


@end
