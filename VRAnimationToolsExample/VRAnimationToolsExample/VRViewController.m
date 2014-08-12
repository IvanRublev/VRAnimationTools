//
//  VRViewController.m
//  VRAnimationToolsExample
//
//  Created by Ivan Rublev on 8/12/14.
//  Copyright (c) 2014 Ivan Rublev http://ivanrublev.me. All rights reserved.
//

#import "VRViewController.h"

@interface VRViewController () {
    BOOL firstViewIsHidden;
}

@end

@implementation VRViewController

- (void)viewDidLoad
{
    firstViewIsHidden = self.view1.hidden;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    [UIView changeVisibilityWithDuration:0.3
                  firstGroupHiddenSwitch:&firstViewIsHidden
                              firstGroup:@[self.view1]
                             secondGroup:@[self.view2]
                                   visibleAlpha:0.8
                                 finally:nil
                                animated:YES];
//    NSArray * show;
//    NSArray * hide;
//    if (firstViewIsHidden) {
//        show = @[self.view1];
//        hide = @[self.view2];
//    } else {
//        show = @[self.view2];
//        hide = @[self.view1];
//    }
//    firstViewIsHidden = !firstViewIsHidden;
//
//    [UIView changeVisibilityWithDuration:0.3
//                                toHidden:hide
//                               toVisible:show
//                                   alpha:0.8
//                                 finally:nil
//                                animated:YES];
}

@end
