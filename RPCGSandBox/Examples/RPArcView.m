//
//  RPArc.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 23-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPArcView.h"

@implementation RPArcView

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
    
    //Nos movemos al punto de partida del arco
    CGContextMoveToPoint(ctx, center.x-100, center.y);
    
    //Añadimos un arco al path
    CGContextAddQuadCurveToPoint(ctx, center.x, center.y-100, center.x+100, center.y);
    
    //Configuramos el color para las lineas del path
    CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);
    //Configuramos el grosor de las lineas del path
    CGContextSetLineWidth(ctx, 3.0f);
    //Dibujamos el Path que llevamos hasta el momento
    CGContextStrokePath(ctx);    
    
    
}

@end
