#import "GCSliderValueView.h"

@implementation GCSliderValueView
- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        path = [[UIBezierPath alloc] init];
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 40, 30)];
        _textLabel.numberOfLines = 0;
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [_textLabel setBackgroundColor: [UIColor clearColor]];
        font = [UIFont fontWithName:@"TrebuchetMS-Italic" size:12];
        _textLabel.font = font;
        [self setBackgroundColor: [UIColor clearColor]];
        [self setAlpha:0.8];
        [self addSubview: _textLabel];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _textLabel.text = title;
    //[self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    if(self.fillColor)
    {
        [_fillColor setFill];
    }
    else
    {
        [[UIColor grayColor] setFill];
    }
    [self drawShape];
    [path fill];
}

- (BOOL)pointInside:(CGPoint)p withEvent:(UIEvent *)event
{
    return [path containsPoint:p];
}

-(void)drawShape
{
    double h = self.frame.size.height - ORC_RADIUS*3;
    double bw = (self.frame.size.width - ORC_RADIUS*3)/2;
    CGPoint p = CGPointMake(ORC_RADIUS, 0);//start point
    [path moveToPoint:p];
    p.x += self.frame.size.width - ORC_RADIUS*2;
    [path addLineToPoint: p];
    p.y += ORC_RADIUS;
    [path addArcWithCenter:p
                    radius:ORC_RADIUS
                startAngle:M_PI*1.5
                  endAngle:0
                 clockwise:YES];
    p.x += ORC_RADIUS;
    p.y += h;
    [path addLineToPoint: p];
//
    p.x -= ORC_RADIUS;
    [path addArcWithCenter:p
                    radius:ORC_RADIUS
                startAngle:0
                  endAngle:M_PI_2
                 clockwise:YES];
    p.y += ORC_RADIUS;
    p.x -= bw;
    [path addLineToPoint: p];
//
    p.x -= ORC_RADIUS/2;
    p.y += ORC_RADIUS;
    [path addLineToPoint: p];
    //NSLog(@"%f",p.y);
    p.x -= ORC_RADIUS/2;
    p.y -= ORC_RADIUS;
    [path addLineToPoint: p];
    p.x -= bw;
    [path addLineToPoint: p];
    p.y -= ORC_RADIUS;
    [path addArcWithCenter:p
                    radius:ORC_RADIUS
                startAngle:M_PI_2
                  endAngle:M_PI
                 clockwise:YES];
    p.x -= ORC_RADIUS;
    p.y -= h;
    [path addLineToPoint: p];
    p.x += ORC_RADIUS;
    [path addArcWithCenter:p
                    radius:ORC_RADIUS
                startAngle:M_PI
                  endAngle:M_PI*1.5
                 clockwise:YES];
    [path closePath];
}

- (void)show
{
    self.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1.3);
    self.layer.opacity = 0;
    [UIView animateWithDuration:0.5f animations:^{
        self.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
        self.layer.opacity = 1.0;
    }completion:^(BOOL finished){
        
    }];
}

- (void)dismiss
{
    self.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
    self.layer.opacity = 1;
    [UIView animateWithDuration:0.5f animations:^{
        self.layer.transform = CATransform3DMakeScale(0.6, 0.5, 0.5);
        self.layer.opacity = 0.0;
    }completion:^(BOOL finished){
        //[self removeFromSuperview];
    }];
}

@end