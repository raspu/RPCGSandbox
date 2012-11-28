//
//  RPTextView.m
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 27-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import "RPTextView.h"

@implementation RPTextView

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
    
    [@"¡MAGIC!" drawInRect:CGRectMake(center.x-50, center.y-50, 100, 100) withFont:[UIFont fontWithName:@"Helvetica" size:25] lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
    //Siempre es preferible que la imágen o el texto se auto dibujen.
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor) ; //El color de text es color de fill...
    [@"More magic..." drawAtPoint:CGPointMake(center.x-60, center.y) withFont:[UIFont fontWithName:@"Helvetica" size:25]];
    
}


@end
