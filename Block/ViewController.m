//
//  ViewController.m
//  Block
//
//  Created by ROBERA GELETA on 12/5/14.
//  Copyright (c) 2014 ROBERA GELETA. All rights reserved.
//

#import "ViewController.h"
#import "RGCircularSlider.h"

@interface ViewController () <RGCircularSliderDelegate>
@property (weak, nonatomic) IBOutlet RGCircularSlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *degree;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slider.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Slider Delegate 
- (void)currentDegree:(NSInteger)degree
{
    self.degree.text = [NSString stringWithFormat:@"%d",degree];
    
}

- (void)onPlay:(BOOL)state
{
    
}

@end
