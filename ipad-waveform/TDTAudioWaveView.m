//
//  TDTAudioWaveView.m
//  Speech Wave
//
//  Created by Amit Chowdhary on 09/07/13.
//  Copyright (c) 2013 Amit Chowdhary. All rights reserved.
//

#import "TDTAudioWaveView.h"

@implementation TDTAudioWaveView

@synthesize typeOfView = typeOfView_;
@synthesize maxWaveHeight = maxWaveHeight_;

- (id)initWithFrame:(CGRect)frame type:(int)type alpha:(float)alpha maxWaveHeight:(float)maxWaveHeight cycle:(int)cycle lineWidth:(float)lineWidth;
{
  self = [super initWithFrame:frame];
  if (self) {
      self.typeOfView = type;
      self.maxWaveHeight = maxWaveHeight;
      self.alpha = alpha;
      self.cycle = cycle;
      self.lineWidth = lineWidth;
  }
  return self;
}

- (void)drawRect:(CGRect)rect
{
  const CGFloat strokeColour1[4] = {238.0/255.0, 98.0/255.0,0,self.alpha};
  float tempY = self.maxWaveHeight;
  float w = 0;
  float y = rect.size.height;
  float width = rect.size.width;
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGMutablePathRef path = CGPathCreateMutable();
  int count = 0;
  switch (self.typeOfView) {
    case 0:
    case 1:
    case 3:
    case 4:
    {
      if (self.maxWaveHeight < 10) self.maxWaveHeight = 7;
      if (self.typeOfView == 3 || self.typeOfView == 4) {
        CGContextSetLineWidth(context, 2);
      }
      CGContextSetStrokeColor(context,strokeColour1);
      int cycles = 8 + arc4random_uniform(7);
      NSLog(@"cycles %d",cycles);
      if (cycles % 2 == 0) cycles++;
      float x = width/cycles;
      int cyclesByTwo = cycles/2;
      CGContextSetStrokeColor(context,strokeColour1);
      float n;
      while (w <= width) {
        n = cycles - abs(cyclesByTwo - count);
        self.maxWaveHeight = n*n*n*tempY/(cycles*cycles*cycles);
        CGPathMoveToPoint(path, NULL, w,y/2);
        CGPathAddQuadCurveToPoint(path, NULL, w + x/4, y/2 - self.maxWaveHeight, w + x/2, y/2);
        CGPathAddQuadCurveToPoint(path, NULL, w + 3*x/4, y/2 + self.maxWaveHeight, w + x, y/2);
        w+=x;
        count++;
      }
      CGContextAddPath(context, path);
      break;
    }
    case 2:
    {
      int cycles = 4 + arc4random_uniform(5);
        NSLog(@"cycles %d",cycles);
      if (cycles % 2 == 0) cycles++;
      float x = width/cycles;
      CGContextSetStrokeColor(context,strokeColour1);
      while (w <= width) {
        CGPathMoveToPoint(path, NULL, w,y/2);
        CGPathAddQuadCurveToPoint(path, NULL, w + x/4, y/2 - self.maxWaveHeight, w + x/2, y/2);
        CGPathAddQuadCurveToPoint(path, NULL, w + 3*x/4, y/2 + self.maxWaveHeight, w + x, y/2);
        w+=x;
      }
      CGContextAddPath(context, path);
      break;
    }
    case 5:
    {
      CGContextSetStrokeColor(context,strokeColour1);
      int cycles = 22;
        NSLog(@"cycles %d",cycles);
      float x = width/cycles;
      int cyclesByFour = cycles/4;
      float n;
      while (w <= width) {
        n = cycles - abs(cyclesByFour - count);
        self.maxWaveHeight = n*n*n*tempY/(cycles*cycles*cycles);
        CGPathMoveToPoint(path, NULL, w,y/2);
        CGPathAddQuadCurveToPoint(path, NULL, w + x/4, y/2 - self.maxWaveHeight, w + x/2, y/2);
        CGPathAddQuadCurveToPoint(path, NULL, w + 3*x/4, y/2 + self.maxWaveHeight, w + x, y/2);
        w+=x;
        count++;
        count %= 9;
      }
      CGContextAddPath(context, path);
      break;
    }
    case 6:
      {
          CGContextSetLineWidth(context, 2);
          CGContextSetStrokeColor(context,strokeColour1);
          int cycles = self.cycle;// + arc4random_uniform(7);
//          NSLog(@"cycles %d",cycles);
          if (cycles % 2 == 0) cycles++;
          float x = width/cycles;
          int cyclesByTwo = cycles/2;
          CGContextSetStrokeColor(context,strokeColour1);
          float n;
          while (w <= width) {
              n = cycles - abs(cyclesByTwo - count);
              self.maxWaveHeight = n*n*n*tempY/(cycles*cycles*cycles);
              CGPathMoveToPoint(path, NULL, w,y/2);
              CGPathAddQuadCurveToPoint(path, NULL, w + x/4, y/2 - self.maxWaveHeight, w + x/2, y/2);
              CGPathAddQuadCurveToPoint(path, NULL, w + 3*x/4, y/2 + self.maxWaveHeight, w + x, y/2);
              w+=x;
              count++;
          }
          CGContextAddPath(context, path);
          break;
      }
    default:
      break;
  }
  CGContextDrawPath(context, kCGPathStroke);
}

@end
