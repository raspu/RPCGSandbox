//
//  RPAnimatedFractalView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 24-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPAnimatedFractalView.h"

@implementation RPAnimatedFractalView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        stepInterval = 1/20; //30 fps, the iphone screen dosen't support more.
        timer = [NSTimer scheduledTimerWithTimeInterval:stepInterval target:self selector:@selector(animate) userInfo:nil repeats:NO];
        startAngle = M_PI/8;

    }
    return self;
}

-(void) animate
{
    //startAngle += M_PI/450;
    //sizerStart = self.frame.size.height+1;
    sizerStart += 0.5;
    NSLog(@"%f",sizerStart/self.frame.size.height);
    if(sizerStart > self.frame.size.height*1.93) sizerStart = self.frame.size.height*0.52;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(ctx, self.frame.size.width/2, self.frame.size.height/2);
    
    //Configuramos las lineas
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 1.0f);
    
    //Configs
    float sizer = sizerStart;
    int triangulos = 8;
    float suma = (2*M_PI)/triangulos;
    float start = startAngle;
    int dim = 2;
    float sumStart  = startAngle;
    //Fractal
    while (sizer > 2)
    {
        //Bounds
       // CGContextAddEllipseInRect(ctx, CGRectMake(-sizer/2, -sizer/2, sizer,sizer));
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
        CGContextStrokePath(ctx);
        start += sumStart;
        start *= -1;
        sizer /= dim;
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:stepInterval target:self selector:@selector(animate) userInfo:nil repeats:NO];
}


@end
