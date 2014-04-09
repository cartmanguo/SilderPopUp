//
//  GCValueSlider.h
//  SilderPopUp
//
//  Created by Line_Hu on 14-4-9.
//  Copyright (c) 2014年 Alpha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCSliderValueView.h"
@interface GCValueSlider : UISlider
@property (strong, nonatomic) GCSliderValueView *popup;
@end
