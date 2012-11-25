//
//  RPEXLinea.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 23-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPLineaView.h"

@implementation RPLineaView

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

    
    //Nos movemos al punto de partida de la linea
    CGContextMoveToPoint(ctx, center.x-100, center.y-100);
    //Creamos una linea en el path actual hasta el punto siguiente.
    CGContextAddLineToPoint(ctx, center.x + 100, center.y+100);
    
    //Nos movemos al punto de partida de la siguiente linea
    CGContextMoveToPoint(ctx, center.x+100, center.y-100);
    //Creamos otra linea en el path actual hasta el punto siguiente.
    CGContextAddLineToPoint(ctx, center.x - 100, center.y+100);
    
    
    //Configuramos el color para las lineas del path
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    //Configuramos el grosor de las lineas del path
    CGContextSetLineWidth(ctx, 3.0f);
    //Configuramos un patron de dashing
    CGFloat l[] ={5,2,2,2};
    CGContextSetLineDash(ctx, 0, l, 4);
    //Dibujamos el Path que llevamos hasta el momento
    CGContextStrokePath(ctx);
    
}

@end
