//
//  RGCircularSlider.h
//  Block
//
//  Created by ROBERA GELETA on 12/7/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGCircularSlider : UIView
@property id delegate;
@end

@protocol RGCircularSliderDelegate <NSObject>

- (void)currentDegree:(NSInteger)degree;
- (void)onPlay:(BOOL)state;

@end
