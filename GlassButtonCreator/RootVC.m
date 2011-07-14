//
//  RootVC.m
//  GlassButtonCreator
//
//  Created by David Hamrick on 7/13/11.
//  Copyright 2011 David Hamrick. All rights reserved.
//

#import "RootVC.h"
#import <QuartzCore/QuartzCore.h>

@implementation RootVC
@synthesize glassButton = _glassButton;
@synthesize redSlider = _redSlider;
@synthesize greenSlider = _greenSlider;
@synthesize blueSlider = _blueSlider;
@synthesize alphaSlider = _alphaSlider;
@synthesize selectedSwitch = _selectedSwitch;
@synthesize widthSlider = _widthSlider;
@synthesize heightSlider = _heightSlider;
@synthesize redLabel = _redLabel;
@synthesize greenLabel = _greenLabel;
@synthesize blueLabel = _blueLabel;
@synthesize alphaLabel = _alphaLabel;
@synthesize widthLabel = _widthLabel;
@synthesize heightLabel = _heightLabel;

- (void)dealloc
{
    [_glassButton release], _glassButton = nil;
    [_redSlider release], _redSlider = nil;
    [_greenSlider release], _greenSlider = nil;
    [_blueSlider release], _blueSlider = nil;
    [_alphaSlider release], _alphaSlider = nil;
    [_selectedSwitch release], _selectedSwitch = nil;
    [_widthSlider release], _widthSlider = nil;
    [_heightSlider release], _heightSlider = nil;
    [_redLabel release], _redLabel = nil;
    [_greenLabel release], _greenLabel = nil;
    [_blueLabel release], _blueLabel = nil;
    [_alphaLabel release], _alphaLabel = nil;
    [_widthLabel release], _widthLabel = nil;
    [_heightLabel release], _heightLabel = nil;
    
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.glassButton = nil;
    self.redSlider = nil;
    self.greenSlider = nil;
    self.blueSlider = nil;
    self.alphaSlider = nil;
    self.selectedSwitch = nil;
    self.widthSlider = nil;
    self.heightSlider = nil;
    self.redLabel = nil;
    self.greenLabel = nil;
    self.blueLabel = nil;
    self.alphaLabel = nil;
    self.widthLabel = nil;
    self.heightLabel = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"UIGlassButton Creator";
    
    Class glassButtonClass = NSClassFromString(@"UIGlassButton");
    self.glassButton = [[[glassButtonClass alloc] initWithFrame:CGRectMake(10, 10, 140, 50)] autorelease];
    [self.view addSubview:self.glassButton];
    
    [self.widthSlider setMinimumValue:30.0f];
    [self.widthSlider setMaximumValue:320.0f];
    
    [self.heightSlider setMinimumValue:30.0f];
    [self.heightSlider setMaximumValue:100.0f];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Some Default Values
    [self.redSlider setValue:0.14f];
    [self.greenSlider setValue:0.73f];
    [self.blueSlider setValue:0.25f];
    [self.alphaSlider setValue:1.0f];
    
    [self.widthSlider setValue:140.0f];
    [self.heightSlider setValue:50.0f];
    
    [self resetButton];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)sliderValueChanged:(id)sender
{
    [self resetButton];
}

- (IBAction)selectedSwitchValueChanged:(id)sender
{
    [self resetButton];
}

- (IBAction)saveButtonPressed:(id)sender
{    
    UIGraphicsBeginImageContextWithOptions(self.glassButton.bounds.size, NO, 2.0f);
    [self.glassButton.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [UIImagePNGRepresentation(image) writeToFile:[NSString stringWithFormat:@"%@/Documents/test1.png",NSHomeDirectory()] atomically:YES];
}

- (void)resetButton
{
    self.redLabel.text = [NSString stringWithFormat:@"Red = %0.2f",self.redSlider.value];
    self.greenLabel.text = [NSString stringWithFormat:@"Green = %0.2f",self.greenSlider.value];
    self.blueLabel.text = [NSString stringWithFormat:@"Blue = %0.2f",self.blueSlider.value];
    self.alphaLabel.text = [NSString stringWithFormat:@"Alpha = %0.2f",self.alphaSlider.value];
    self.widthLabel.text = [NSString stringWithFormat:@"Width = %d",(int)self.widthSlider.value];
    self.heightLabel.text = [NSString stringWithFormat:@"Height = %d",(int)self.heightSlider.value];
    
    [self.glassButton setValue:[UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value] forKey:@"tintColor"];
    [self.glassButton setHighlighted:self.selectedSwitch.on];
    
    [self.glassButton setFrame:CGRectMake(10, 10, (int)self.widthSlider.value, (int)self.heightSlider.value)];
}

@end
