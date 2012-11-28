//
//  RPTransparenciaView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 27-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPTransparenciaView.h"

@implementation RPTransparenciaView

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
    //Obtenemos el contexto
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //Guardamos el punto del centro.
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    CGContextSetStrokeColorWithColor(ctx,[UIColor blackColor].CGColor );
    
    //Añadimos un cuadrado al path
    CGContextAddRect(ctx, CGRectMake(center.x-75, center.y-75, 100, 100));
    CGContextStrokePath(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5].CGColor);
    CGContextAddRect(ctx, CGRectMake(center.x-75, center.y-75, 100, 100));
    CGContextFillPath(ctx);
    
    //Añadimos otro cuadrado al path
    CGContextAddRect(ctx, CGRectMake(center.x-25, center.y-25, 100, 100));
    CGContextStrokePath(ctx);
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0 green:0 blue:1 alpha:0.5].CGColor);
    CGContextAddRect(ctx, CGRectMake(center.x-25, center.y-25, 100, 100));
    CGContextFillPath(ctx);
}

@end
