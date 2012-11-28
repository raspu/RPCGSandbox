//
//  RPImageView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 27-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPImageView.h"

@implementation RPImageView

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
    
    UIImage *img = [UIImage imageNamed:@"turtle.jpeg"];
    [img drawAtPoint:CGPointMake(center.x-img.size.width/2, center.y-img.size.height/2)];
    //Siempre es preferible que la imágen o el texto se auto dibujen.
    
}

@end
