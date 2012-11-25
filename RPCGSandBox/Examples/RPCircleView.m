//
//  RPCircleView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 23-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPCircleView.h"

@implementation RPCircleView

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
    
    /*
     Círculo Simple
    */
    
    //Añadimos un círculo al path
    CGContextAddEllipseInRect(ctx, CGRectMake(center.x-50, center.y-150, 100, 100));
    
    //Configuramos el color para las lineas del path
    CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);
    //Configuramos el grosor de las lineas del path
    CGContextSetLineWidth(ctx, 3.0f);
    //Dibujamos el Path que llevamos hasta el momento
    CGContextStrokePath(ctx);
    
    
    /*
     Círculo Compuesto
    */
    
    //Definimos un nuevo path, para poder luego reutilizarlo...
    CGMutablePathRef path = CGPathCreateMutable();
    
    //Añadimos un cuadrado al path (no al contexto), no aplicamos transformacion
    CGPathAddEllipseInRect(path, NULL , CGRectMake(center.x-50, center.y, 100, 100));
    
    //Añadimos el path al contexto para hacer el llenado
    CGContextAddPath(ctx, path);
    //Configuramos el color para llenar el path
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    //Llenamos el Path que llevamos hasta el momento
    CGContextFillPath(ctx);
    
    //Añadimos nuevamente el path al contexto para hacer las lineas
    CGContextAddPath(ctx, path);
    //Configuramos el color para la linea del path
    CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);
    //Dibujamos el Path que llevamos hasta el momento
    CGContextStrokePath(ctx);
    
}

@end
