//
//  TDTAudioWaveView.h
//  Speech Wave
//
//  Created by Amit Chowdhary on 09/07/13.
//  Copyright (c) 2013 Amit Chowdhary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDTAudioWaveView : UIView

@property (nonatomic) float maxWaveHeight;
@property (nonatomic) int typeOfView;
@property (nonatomic) float alpha;
@property (nonatomic) int cycle;
@property (nonatomic) float lineWidth;

- (id)initWithFrame:(CGRect)frame type:(int)type alpha:(float)alpha maxWaveHeight:(float)maxWaveHeight cycle:(int)cycle lineWidth:(float)lineWidth;

@end
