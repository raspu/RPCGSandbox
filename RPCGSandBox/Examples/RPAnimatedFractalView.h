//
//  RPAnimatedFractalView.h
//  RPCGSandBox
//
//  Created by Juan Pablo Illanes Sotta on 24-11-12.
//  Copyright (c) 2012 Raspu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPAnimatedFractalView : UIView
{
    NSTimer *timer;
    float stepInterval;
    float startAngle;
    float sizerStart;
}
@end
