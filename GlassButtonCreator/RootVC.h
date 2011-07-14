//
//  RootVC.h
//  GlassButtonCreator
//
//  Created by David Hamrick on 7/13/11.
//  Copyright 2011 David Hamrick. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootVC : UIViewController 
{
    UIButton* _glassButton;
    
    UISlider* _redSlider;
    UISlider* _greenSlider;
    UISlider* _blueSlider;
    UISlider* _alphaSlider;
    UISwitch* _selectedSwitch;
    UISlider* _widthSlider;
    UISlider* _heightSlider;
    
    UILabel* _redLabel;
    UILabel* _greenLabel;
    UILabel* _blueLabel;
    UILabel* _alphaLabel;
    UILabel* _widthLabel;
    UILabel* _heightLabel;
}
@property (nonatomic, retain) IBOutlet UIButton *glassButton;
@property (nonatomic, retain) IBOutlet UISlider *redSlider;
@property (nonatomic, retain) IBOutlet UISlider *greenSlider;
@property (nonatomic, retain) IBOutlet UISlider *blueSlider;
@property (nonatomic, retain) IBOutlet UISlider *alphaSlider;
@property (nonatomic, retain) IBOutlet UISwitch *selectedSwitch;
@property (nonatomic, retain) IBOutlet UISlider *widthSlider;
@property (nonatomic, retain) IBOutlet UISlider *heightSlider;
@property (nonatomic, retain) IBOutlet UILabel *redLabel;
@property (nonatomic, retain) IBOutlet UILabel *greenLabel;
@property (nonatomic, retain) IBOutlet UILabel *blueLabel;
@property (nonatomic, retain) IBOutlet UILabel *alphaLabel;
@property (nonatomic, retain) IBOutlet UILabel *widthLabel;
@property (nonatomic, retain) IBOutlet UILabel *heightLabel;

- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)selectedSwitchValueChanged:(id)sender;
- (IBAction)saveButtonPressed:(id)sender;

- (void)resetButton;

@end
