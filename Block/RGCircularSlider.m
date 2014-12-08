//
//  RGCircularSlider.m
//  Block
//
//  Created by ROBERA GELETA on 12/7/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//
#define HANDLE 57
#define RADIUS 20
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

#import "RGCircularSlider.h"

@implementation RGCircularSlider

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    //inital angle
    self.angle = 99;
    self.pressed = YES;
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
//    [self drawCanvas2WithFrame:rect sizeOfOuterCircle:self.frame.size.width];
    
    //adding panning gesture recognizer to figure out the translation
    UIPanGestureRecognizer *panning = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panning:)];
    [self addGestureRecognizer:panning];
    
    //adding tap gesture recognizer to figure
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];

    [self drawCanvas2WithFrame:rect sizeOfOuterCircle:self.frame.size.width angle:self.angle pauseButton:!self.pressed playButton:self.pressed leftPauseBar:21];
}

- (void)drawCanvas2WithFrame: (CGRect)frame sizeOfOuterCircle: (CGFloat)sizeOfOuterCircle angle: (CGFloat)angle pauseButton: (BOOL)pauseButton playButton: (BOOL)playButton leftPauseBar: (CGFloat)leftPauseBar
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color7 = [UIColor colorWithRed: 0.137 green: 0.525 blue: 0.242 alpha: 1];
    UIColor* color8 = [UIColor colorWithRed: 0.219 green: 0.286 blue: 0.25 alpha: 1];
    UIColor* color10 = [UIColor colorWithRed: 0.206 green: 0.662 blue: 0.287 alpha: 1];
    UIColor* color11 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Variable Declarations
    CGFloat sizeOfInnerCircle = sizeOfOuterCircle / 2.0;
    CGPoint innerCircleCenter = CGPointMake(sizeOfOuterCircle / 4.0, sizeOfOuterCircle / 4.0);
    CGFloat playPauseButtonScale = sizeOfOuterCircle / 100.0;
    CGPoint expression = CGPointMake(sizeOfOuterCircle / 2.40, sizeOfOuterCircle / 2.90);
    CGFloat rightPauseBar = leftPauseBar - 10;
    
    //// Oval 3 Drawing
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 0, sizeOfOuterCircle, sizeOfOuterCircle)];
    [color8 setFill];
    [oval3Path fill];
    
    
    //// Oval Drawing
    CGRect ovalRect = CGRectMake(0, 0, sizeOfOuterCircle, sizeOfOuterCircle);
    UIBezierPath* ovalPath = UIBezierPath.bezierPath;
    [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: 0 * M_PI/180 endAngle: -(angle + 112) * M_PI/180 clockwise: YES];
    [ovalPath addLineToPoint: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect))];
    [ovalPath closePath];
    
    [color10 setFill];
    [ovalPath fill];
    
    
    //// Oval 2 Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame), CGRectGetMinY(frame));
    
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(innerCircleCenter.x, innerCircleCenter.y, sizeOfInnerCircle, sizeOfInnerCircle)];
    [color7 setFill];
    [oval2Path fill];
    
    CGContextRestoreGState(context);
    
    
    //// Group
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, (expression.x + 0.0833333333333), expression.y);
        
        
        
        if (playButton)
        {
            //// Bezier Drawing
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, 3, -0);
            CGContextScaleCTM(context, playPauseButtonScale, playPauseButtonScale);
            
            UIBezierPath* bezierPath = UIBezierPath.bezierPath;
            [bezierPath moveToPoint: CGPointMake(0, 0)];
            [bezierPath addLineToPoint: CGPointMake(0, 26)];
            [bezierPath addLineToPoint: CGPointMake(22.29, 15.53)];
            [bezierPath addLineToPoint: CGPointMake(0, 0)];
            [color11 setFill];
            [bezierPath fill];
            
            CGContextRestoreGState(context);
        }
        
        
        if (pauseButton)
        {
            //// Group 2
            {
                //// Rectangle Drawing
                CGContextSaveGState(context);
                CGContextTranslateCTM(context, (leftPauseBar - 21), 0.83);
                CGContextScaleCTM(context, playPauseButtonScale, playPauseButtonScale);
                
                UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 8, 24)];
                [UIColor.whiteColor setFill];
                [rectanglePath fill];
                
                CGContextRestoreGState(context);
                
                
                //// Rectangle 2 Drawing
                CGContextSaveGState(context);
                CGContextTranslateCTM(context, (rightPauseBar - 11), 0.83);
                CGContextScaleCTM(context, playPauseButtonScale, playPauseButtonScale);
                
                UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(10.38, 0, 8, 24)];
                [UIColor.whiteColor setFill];
                [rectangle2Path fill];
                
                CGContextRestoreGState(context);
            }
        }
        
        
        
        CGContextRestoreGState(context);
    }
}


- (void)panning:(UIPanGestureRecognizer *)panning
{

    //    CGPoint translation = [pan translationInView:self];
    CGPoint currentTouch = [panning locationInView:self];
    self.angle =  - RADIANS_TO_DEGREES(pToA(currentTouch, self));
    NSLog(@"%d",self.angle);
    
    if(self.angle > 0 )
    {
        self.angle = -360 + self.angle;
    }
    
    //Redraw
    [self setNeedsDisplay];
}

- (void)tap:(UITapGestureRecognizer *)touch
{
    
    //compute the box for the inner circle
    NSInteger bigBoxSize = self.bounds.size.width;
    CGFloat quarterSize = self.bounds.size.width /4;


    CGPoint touchLocation = [touch locationInView:self];
    NSInteger x = touchLocation.x;
    NSInteger y = touchLocation.y;
    BOOL withInXRange = (x > quarterSize && x < (bigBoxSize - quarterSize));
    BOOL withInYRange = (y > quarterSize && y < (bigBoxSize - quarterSize));
    if( withInXRange && withInYRange)
    {
        self.pressed = !self.pressed;
        [self setNeedsDisplay];
    }
    
    
}


static CGFloat pToA (CGPoint loc, UIView* self) {
    
    CGPoint c = CGPointMake(CGRectGetMidX(self.bounds),
                            CGRectGetMidY(self.bounds));
    
    return atan2(loc.y - c.y, loc.x - c.x);
}

@end
