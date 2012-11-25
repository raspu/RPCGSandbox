//
//  RPFingerTrapView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 24-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPFingerTrapView.h"

@implementation RPFingerTrapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    //Configuramos las lineas
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 2.0f);
    
    //Bounding lines
    CGContextMoveToPoint(ctx, -1, center.y-100);
    CGContextAddLineToPoint(ctx, self.frame.size.height+1, center.y-100);
    CGContextMoveToPoint(ctx, -1, center.y+100);
    CGContextAddLineToPoint(ctx, self.frame.size.height+1, center.y+100);
    CGContextStrokePath(ctx);
    
    
    //Traingulos
    int triangulos = 3;
    float suma = self.frame.size.width/triangulos;
    CGContextMoveToPoint(ctx, 0, center.y+100);
    for (int i = 0; i<self.frame.size.width; i += suma )
    {
        CGContextAddLineToPoint(ctx, i+suma/2, center.y-96);
        CGContextAddLineToPoint(ctx, i+suma, center.y+96);
    }
    CGContextStrokePath(ctx);
}


@end
