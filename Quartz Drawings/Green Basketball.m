//
//  Green Basketball.m
//  Drawings
//
//  Created by Saranpreet Nagra on 1/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Green Basketball.h"

@implementation greenBasketball

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Create clipping area circle
    CGRect rectangle = CGRectMake(0, 0, 100, 100);
    CGContextBeginPath(context);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextClip(context);
    
    
    //Gradient for the fill of the circle
    CGGradientRef myGradient;
    CGColorSpaceRef myColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 15.0/255.0, 192.0/255.0, 6.0/255.0, 1.0,  // Start color
        6.0/255.0, 84.0/255.0, 2.0/255.0, 1.0}; // End color
    
    myColorspace = CGColorSpaceCreateDeviceRGB();
    myGradient = CGGradientCreateWithColorComponents(myColorspace, components, locations, num_locations);
    CGPoint myStartPoint, myEndPoint;
    CGFloat myStartRadius, myEndRadius;
    myStartPoint.x = 30;
    myStartPoint.y = 20;
    myEndPoint.x = 30;
    myEndPoint.y = 20;
    myStartRadius = 0;
    myEndRadius = 100;
    
    CGContextDrawRadialGradient(context, myGradient, myStartPoint, myStartRadius, myEndPoint, myEndRadius, kCGGradientDrawsBeforeStartLocation);
    
    CGGradientRelease(myGradient); 
    
    //Drawing the outline of the circle
    CGContextSetLineWidth(context, 4.0);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextClip(context);
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextStrokeEllipseInRect(context, rectangle);
    
    
    //Arc1 on basketball
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, 60, 1);
    CGContextAddCurveToPoint(context, 95, 27, 90, 80, 65, 98);
    CGContextStrokePath(context);
    
    //Arc2 on basketball
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, 20, 10);
    CGContextAddCurveToPoint(context, 70, 10, 79, 50, 91, 22);
    CGContextStrokePath(context);
    
    //Arc3 on basketball
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, 0, 50);
    CGContextAddCurveToPoint(context, 45, 35, 80, 40, 99, 45);
    CGContextStrokePath(context);
    
    //Arc4 on basketball
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, 20, 90);
    CGContextAddCurveToPoint(context, 77, 65, 85, 30, 95, 71);
    CGContextStrokePath(context);
}


@end
