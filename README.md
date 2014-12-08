CircularSlider
==============
To use this control with interface builder you just need to drop RGCircularSlider in for the class of the  
view in the storyboard of .xib file. You can also use initWithFrame: . To get the value of degree and the
state of the button(play or pause) you need to implement the RGCircularSliderDelegate Protocol .

- (void)currentDegree:(NSInteger)degree;
- (void)onPlay:(BOOL)state;

0 ≤ degree ≤ 360
and state is YES when you see the "play button" and NO when you see the "pause button"


