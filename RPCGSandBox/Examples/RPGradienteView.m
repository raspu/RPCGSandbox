//
//  RPGradienteView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 23-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPGradienteView.h"

@implementation RPGradienteView

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
    
    
    
    //Configuramos los colores
    CGColorRef top = [UIColor blueColor].CGColor;
    CGColorRef bot = [UIColor yellowColor].CGColor;
    NSArray *colores = @[(__bridge id)top,(__bridge id)bot];
    //Configuramos el gradiente
    CGFloat l[] = {0,1};
    CGGradientRef grad =  CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), (__bridge_retained CFArrayRef) colores, l);
    
    //Dibujamos el gradiente
    CGContextSaveGState(ctx); //Guardamos el estado original.
    CGContextClipToRect(ctx, CGRectMake(center.x-50, center.y-50, 100, 100)); //Cortamos la zona de dibujo a un cuadrado
    CGContextDrawLinearGradient(ctx, grad, CGPointMake(center.x, center.y-50), CGPointMake(center.x, center.y+50), 0);
    CGContextRestoreGState(ctx); //Restauramos el contexto
    
    //Libreamos los colores...
    CGColorRelease(top);
    CGColorRelease(bot);
    
    //Llenamos el Path que llevamos hasta el momento
    CGContextAddRect(ctx, CGRectMake(center.x-50, center.y-50, 100, 100));
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextStrokePath(ctx);
}

@end
