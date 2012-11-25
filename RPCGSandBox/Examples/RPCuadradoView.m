//
//  RPCuadradoView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 23-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPCuadradoView.h"

@implementation RPCuadradoView

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
    
    //Añadimos un cuadrado al path
    CGContextAddRect(ctx, CGRectMake(center.x-50, center.y-150, 100, 100));
    
    //Configuramos el color para las lineas del path
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    //Configuramos el grosor de las lineas del path
    CGContextSetLineWidth(ctx, 3.0f);
    //Dibujamos el Path que llevamos hasta el momento
    CGContextStrokePath(ctx);
    
    
    //Después de hacer stroke o fill se limpia el path.
    //Añadimos un cuadrado al nuevo path
    CGContextAddRect(ctx, CGRectMake(center.x-50, center.y, 100, 100));
    
    //Configuramos el color para llenar el path
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    //Llenamos el Path que llevamos hasta el momento
    CGContextFillPath(ctx);
}


@end
