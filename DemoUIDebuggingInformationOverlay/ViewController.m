//
//  ViewController.m
//  DemoUIDebuggingInformationOverlay
//
//  Created by 吴珂 on 2017/5/31.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)showOverlayAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)showOverLay
{
    Class class = NSClassFromString(@"UIDebuggingInformationOverlay");
    SEL selector = NSSelectorFromString(@"prepareDebuggingOverlay");
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [class performSelector:selector];
    SEL overlaySelector = NSSelectorFromString(@"overlay");
    SEL toggleVisibilitySelector = NSSelectorFromString(@"toggleVisibility");
    
    [[class performSelector:overlaySelector] performSelector:toggleVisibilitySelector];
#pragma clang diagnostic pop
}

- (IBAction)showOverlayAction:(id)sender {
    [self showOverLay];
}
@end
