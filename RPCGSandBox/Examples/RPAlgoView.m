//
//  RPAlgoView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 24-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPAlgoView.h"

@implementation RPAlgoView

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
    
    //Las lineas serán grises
    CGContextSetLineWidth(ctx, 2.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor darkGrayColor].CGColor);
    
    //Dibujamos!
    //Estructura
    CGContextAddRect(ctx, CGRectMake(center.x-100, center.y-100, 200, 150));
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1].CGColor);
    CGContextFillPath(ctx);
    CGContextAddRect(ctx, CGRectMake(center.x-100, center.y-100, 200, 150));
    CGContextStrokePath(ctx);
    
    //Ventanas
    CGContextSetStrokeColorWithColor(ctx, [UIColor brownColor].CGColor);
    
    CGContextAddRect(ctx, CGRectMake(center.x-75, center.y-50, 40, 40));
    CGContextAddRect(ctx, CGRectMake(center.x+35, center.y-50, 40, 40));
    CGContextStrokePath(ctx);
    
    CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:0 green:0 blue:1 alpha:0.7].CGColor);
    CGContextAddRect(ctx, CGRectMake(center.x-75, center.y-50, 40, 40));
    CGContextFillPath(ctx);
    
    CGContextAddRect(ctx, CGRectMake(center.x+35, center.y-50, 40, 40));
    CGContextFillPath(ctx);
    
    CGContextMoveToPoint(ctx, center.x+55, center.y-50);
    CGContextAddLineToPoint(ctx, center.x+55, center.y-10);
    CGContextMoveToPoint(ctx, center.x+35, center.y-30);
    CGContextAddLineToPoint(ctx, center.x+75, center.y-30);
    CGContextMoveToPoint(ctx, center.x-55, center.y-50);
    CGContextAddLineToPoint(ctx, center.x-55, center.y-10);
    CGContextMoveToPoint(ctx, center.x-75, center.y-30);
    CGContextAddLineToPoint(ctx, center.x-35, center.y-30);
    CGContextStrokePath(ctx);
    CGContextSetStrokeColorWithColor(ctx, [UIColor darkGrayColor].CGColor);

    
    //Puerta
    CGContextAddRect(ctx, CGRectMake(center.x-15, center.y, 30, 50));
    CGContextSetFillColorWithColor(ctx, [UIColor brownColor].CGColor);
    CGContextFillPath(ctx);
    CGContextAddRect(ctx, CGRectMake(center.x-15, center.y, 30, 50));
    CGContextStrokePath(ctx);


    //Techo
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, center.x-150, center.y-100);
    CGPathAddLineToPoint(path, NULL, center.x, center.y-150);
    CGPathAddLineToPoint(path, NULL, center.x+150, center.y-100);
    CGContextAddPath(ctx, path);
    CGContextStrokePath(ctx);
    CGPathCloseSubpath(path);
    CGContextAddPath(ctx, path);
    CGContextSetFillColorWithColor(ctx, [UIColor brownColor].CGColor);
    CGContextFillPath(ctx);
    
    
}
@end
