//
//  RPTunnelView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 24-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPFractalView.h"

@implementation RPFractalView

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
    
    CGContextTranslateCTM(ctx, self.frame.size.width/2, self.frame.size.height/2);

    //Configuramos las lineas
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 1.0f);
    
    //Configs
    float sizer = self.frame.size.height;
    int triangulos = 8;
    float suma = (2*M_PI)/triangulos;
    float start = 0;
    int dim = 2;
    float sumStart = M_PI/triangulos;
    //Fractal
    while (sizer > 2)
    {
        //Bounds
        //CGContextAddEllipseInRect(ctx, CGRectMake(-sizer/2, -sizer/2, sizer,sizer));
        float xb = sizer/dim * cos(start);
        float yb = sizer/dim * sin(start);
        CGContextMoveToPoint(ctx, xb, yb);
        for (float i = start; i<start+(suma*triangulos); i += suma )
        {
            float xt = (sizer) * cos(i+suma/2);
            float yt = (sizer) * sin(i+suma/2);
            CGContextAddLineToPoint(ctx, xt, yt);
            xb = (sizer)/dim * cos(i+suma);
            yb = (sizer)/dim * sin(i+suma);
            CGContextAddLineToPoint(ctx, xb, yb);

        }
        start += sumStart;
        sizer /= dim;
    }
    CGContextStrokePath(ctx);
}

@end
