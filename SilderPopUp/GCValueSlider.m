//
//  GCValueSlider.m
//  SilderPopUp
//
//  Created by Line_Hu on 14-4-9.
//  Copyright (c) 2014年 Alpha. All rights reserved.
//

#import "GCValueSlider.h"

@implementation GCValueSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.popup = [[GCSliderValueView alloc] initWithFrame:CGRectZero];
        _popup.layer.opacity = 0;
        [self addSubview:_popup];
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.popup = [[GCSliderValueView alloc] initWithFrame:CGRectZero];
        _popup.layer.opacity = 0;
        [self addSubview:_popup];
    }
    return self;
}

- (void)updatePopupPosition
{
    CGRect _thumbRect = [self thumbRect];
    CGRect popupRect = CGRectOffset(_thumbRect, 0, -(_thumbRect.size.height * 1.2));
    _popup.frame = CGRectInset(popupRect, -10, -5);
    //_popup.textLabel.frame = CGRectInset(_popup.bounds, 5, 5);
    _popup.title = [NSString stringWithFormat:@"%.1f",self.value];
    //NSLog(@"%f,%f,%f,%f",popupRect.origin.x,popupRect.origin.y,popupRect.size.width,popupRect.size.height);
}

- (void)setMaximumValue:(float)maximumValue
{
    [super setMaximumValue:maximumValue];
    //[self calculatePopUpViewSize];
}

- (void)setMinimumValue:(float)minimumValue
{
    [super setMinimumValue:minimumValue];
    //[self calculatePopUpViewSize];
}


- (void)setMinimumTrackTintColor:(UIColor *)color
{
    //self.autoAdjustTrackColor = NO; // if a custom value is set then prevent auto coloring
    [super setMinimumTrackTintColor:color];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    BOOL begin = [super beginTrackingWithTouch:touch withEvent:event];
    if (begin) {
        [self.popup setNeedsDisplay];
        [self updatePopupPosition];
        [self.popup show];
    }
    return begin;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    BOOL continueTrack = [super continueTrackingWithTouch:touch withEvent:event];
    if (continueTrack)
    {
        [self updatePopupPosition];
    }//[self positionAndUpdatePopUpView];
    return continueTrack;
}

- (void)cancelTrackingWithEvent:(UIEvent *)event
{
    [super cancelTrackingWithEvent:event];
    [_popup dismiss];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super endTrackingWithTouch:touch withEvent:event];
    [self updatePopupPosition];
    [_popup dismiss];
}

-(CGRect)thumbRect {
    CGRect trackRect = [self trackRectForBounds:self.bounds];
    //NSLog(@"tr:%f,%f,%f,%f",trackRect.origin.x,trackRect.origin.y,trackRect.size.width,trackRect.size.height);
    CGRect thumbR = [self thumbRectForBounds:self.bounds trackRect:trackRect value:self.value];
    //NSLog(@"th:%f,%f,%f,%f",thumbR.origin.x,thumbR.origin.y,thumbR.size.width,thumbR.size.height);
    return thumbR;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
