//
//  GCSliderValueView.h
//  SilderPopUp
//
//  Created by Line_Hu on 14-4-8.
//  Copyright (c) 2014年 Alpha. All rights reserved.
//

#define ORC_RADIUS 6
@interface GCSliderValueView : UIView {
    CGPoint origin;
    CGPoint point;
    CGSize size;
    UIFont *font;
    UIBezierPath *path;
}
@property (nonatomic, copy) NSString *title;
@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UIColor *fillColor;
- (void)show;
- (void)dismiss;
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event;
@end
