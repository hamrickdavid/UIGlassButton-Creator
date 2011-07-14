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
@synthesize redLabel = _redLabel;
@synthesize greenLabel = _greenLabel;
@synthesize blueLabel = _blueLabel;
@synthesize alphaLabel = _alphaLabel;

- (void)dealloc
{
    [_glassButton release], _glassButton = nil;
    [_redSlider release], _redSlider = nil;
    [_greenSlider release], _greenSlider = nil;
    [_blueSlider release], _blueSlider = nil;
    [_alphaSlider release], _alphaSlider = nil;
    [_selectedSwitch release], _selectedSwitch = nil;
    [_redLabel release], _redLabel = nil;
    [_greenLabel release], _greenLabel = nil;
    [_blueLabel release], _blueLabel = nil;
    [_alphaLabel release], _alphaLabel = nil;
    
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
    self.redLabel = nil;
    self.greenLabel = nil;
    self.blueLabel = nil;
    self.alphaLabel = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"UIGlassButton Creator";
    
    Class glassButtonClass = NSClassFromString(@"UIGlassButton");
    self.glassButton = [[[glassButtonClass alloc] initWithFrame:CGRectMake(10, 10, 140, 50)] autorelease];
    [self.glassButton setValue:[UIColor colorWithRed:0.7f green:0.1f blue:0.1f alpha:1.0f] forKey:@"tintColor"];
    [self.glassButton setTitle:@"Stop" forState:UIControlStateNormal];
    [self.view addSubview:self.glassButton];
    [self.glassButton setHighlighted:YES];
    
    self.glassButton.layer.borderColor = [UIColor blackColor].CGColor;
    
    [self sliderValueChanged:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)sliderValueChanged:(id)sender
{
    self.redLabel.text = [NSString stringWithFormat:@"Red = %0.2f",self.redSlider.value];
    self.greenLabel.text = [NSString stringWithFormat:@"Green = %0.2f",self.greenSlider.value];
    self.blueLabel.text = [NSString stringWithFormat:@"Blue = %0.2f",self.blueSlider.value];
    self.alphaLabel.text = [NSString stringWithFormat:@"Alpha = %0.2f",self.alphaSlider.value];
    
    [self.glassButton setValue:[UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:self.alphaSlider.value] forKey:@"tintColor"];
}

- (IBAction)selectedSwitchValueChanged:(id)sender
{
    [self.glassButton setHighlighted:self.selectedSwitch.on];
}

@end
