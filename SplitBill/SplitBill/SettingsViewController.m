//
//  SettingsViewController.m
//  SplitBill
//
//  Created by Eddie Freeman on 5/10/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

// Interface
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UITextField *seatTextField;

// Actions
- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
  // Grab Defaults
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSInteger tipDefault = [defaults integerForKey:@"tipDefault"];
  NSInteger seatDefault = [defaults integerForKey:@"seatDefault"];
  
  // Set Defaults
  self.seatTextField.text = [[NSString alloc] initWithFormat:@"%d", seatDefault];
  self.tipControl.selectedSegmentIndex = tipDefault;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
  [self.view endEditing:YES];
  [self updateValues];
}

- (void)updateValues {
  // Update the settings
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setInteger:self.tipControl.selectedSegmentIndex forKey:@"tipDefault"];
  [defaults setInteger:[self.seatTextField.text integerValue] forKey:@"seatDefault"];
  [defaults synchronize];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 // TODO Synchronize settings
 }
 */

@end
