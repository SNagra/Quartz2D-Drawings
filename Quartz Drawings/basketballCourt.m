//
//  basketballCourt.m
//  Drawings2
//
//  Created by Saranpreet Nagra on 1/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "basketballCourt.h"

@implementation basketballCourt

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
    
    //Gradient
    CGGradientRef myGradient;
    CGColorSpaceRef myColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 245.0/255.0, 142.0/255.0, 0.0/255.0, 1.0,  // Start color
        215.0/255.0, 87.0/255.0, 0.0/255.0, 1.0}; // End color
    
    myColorspace = CGColorSpaceCreateDeviceRGB();
    myGradient = CGGradientCreateWithColorComponents(myColorspace, components, locations, num_locations);
    CGPoint myStartPoint, myEndPoint;
    CGFloat myStartRadius, myEndRadius;
    myStartPoint.x = 320;
    myStartPoint.y = 260;
    myEndPoint.x = 300;
    myEndPoint.y = 300;
    myStartRadius = 0;
    myEndRadius = 200;
    
    CGContextDrawRadialGradient(context, myGradient, myStartPoint, myStartRadius, myEndPoint, myEndRadius, kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(myGradient); 
    //
    
    //Bounds lines
    CGRect inBounds = CGRectMake(0, 70, 320, 320);
    CGContextSetLineWidth(context, 3.0);
    CGContextAddRect(context, inBounds);
    CGContextStrokePath(context);
    //
    
    //3-POINT LINES
    //3-Point Line Straight parts
    CGContextMoveToPoint(context, 0, 97);
    CGContextAddLineToPoint(context, 40, 97);
    CGContextStrokePath(context);  
    
    CGContextMoveToPoint(context, 0, 366);
    CGContextAddLineToPoint(context, 40, 366);
    CGContextStrokePath(context);
    
    //Arc of HS 3-Point Line
//    CGContextMoveToPoint(context, 40, 97);
//    CGContextAddCurveToPoint(context, 211, 100, 211, 360, 40, 366);
//    CGContextStrokePath(context);
    
    //Arc of College 3-Point Line
    CGContextMoveToPoint(context, 40, 97);
    CGContextAddCurveToPoint(context, 225, 100, 225, 360, 40, 366);
    CGContextStrokePath(context);
    //
    
    //KEY
    //Key Box
    CGRect key = CGRectMake(0, 190, 128, 80);
    CGContextAddRect(context, key);
    CGContextStrokePath(context);
    
    //Free throw circle
    CGRect circle = CGRectMake(88, 190, 80, 80);
    CGContextAddEllipseInRect(context, circle);
    CGContextStrokePath(context);

    //Backboard Line
    CGContextMoveToPoint(context, 25, 210);
    CGContextAddLineToPoint(context, 25, 246);
    CGContextStrokePath(context);
    
    //Rim
    CGRect rim = CGRectMake(25, 221, 14, 14);
    CGContextAddEllipseInRect(context, rim);
    CGContextStrokePath(context);
    //
    
    //Half-court Circle
    CGRect halfCourt = CGRectMake(280, 190, 80, 80);
    CGContextAddEllipseInRect(context, halfCourt);
    CGContextStrokePath(context);

}


@end
