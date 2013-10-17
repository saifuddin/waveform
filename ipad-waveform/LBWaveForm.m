//
//  LBWaveForm.m
//  waveform
//
//  Created by saifuddin on 17/10/13.
//  Copyright (c) 2013 saifuddin. All rights reserved.
//

#import "LBWaveForm.h"
#import "TDTAudioWaveView.h"

@interface LBWaveForm ()
@property (nonatomic) float speed;
@end

@implementation LBWaveForm

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // max 4
        CGFloat factor = 20;
        CGFloat width = self.frame.size.width*factor;
        for (int i = 1; i < 5; i++)
        {
            CGFloat alpha = (i == 4) ? 1 : (0.1 + i*0.1);
            int cycle = 9 + i*4;
//            cycle = 20;//4 + arc4random_uniform(5);
            TDTAudioWaveView *w = [[TDTAudioWaveView alloc] initWithFrame:CGRectMake(-width + self.frame.size.width, 0, width, self.frame.size.height)
                                                                     type:6
                                                                    alpha:alpha
                                                            maxWaveHeight:(100 + i*15)
                                                                    cycle:cycle
                                                                lineWidth:(0.5 + i*0.1)];
            w.backgroundColor = [UIColor clearColor];
            w.tag = i;
            [self addSubview:w];
        }
    }
    return self;
}
- (void)animateWave
{
    for (int i = 1; i < 6; i++)
    {
        CGFloat duration = (9 + i*0.5);
        TDTAudioWaveView *w = (TDTAudioWaveView *)[self viewWithTag:i];
        [UIView animateWithDuration:duration
                              delay:0.0
                            options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat
                         animations:^{
                             w.frame = CGRectMake(0, w.frame.origin.y, w.frame.size.width, w.frame.size.height);
                         }
                         completion:nil];
    }
}

@end
