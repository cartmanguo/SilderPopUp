//
//  ViewController.m
//  SilderPopUp
//
//  Created by Line_Hu on 14-4-8.
//  Copyright (c) 2014年 Alpha. All rights reserved.
//

#import "ViewController.h"
#import "GCValueSlider.h"

@interface ViewController ()
{
    GCSliderValueView *view;
    IBOutlet GCValueSlider *slider;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    show = YES;
    slider.popup.fillColor = slider.tintColor;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
