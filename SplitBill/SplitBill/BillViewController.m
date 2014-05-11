//
//  BillViewController.m
//  SplitBill
//
//  Created by Eddie Freeman on 5/7/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import "BillViewController.h"

@interface BillViewController ()

// Labels
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *seatLabel;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;

// Fields
@property (weak, nonatomic) IBOutlet UITextField *billTextField;

// Controls
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIStepper *seatStepper;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation BillViewController

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
  self.title = @"Bill Split";
  // Do any additional setup after loading the view from its nib.
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
  // Adjust seat size
  self.seatLabel.text = [NSString stringWithFormat:@"%0.0f",[self.seatStepper value]];
  
  // Set Bill
  float billAmount = [self.billTextField.text floatValue];
  
  // Calculate the tip
  NSArray *tipValues = @[@(0.1), @(0.15), @(0.20)];
  float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
  
  // Add up the total
  float totalAmount = tipAmount + billAmount;
  
  // Calculate individual cost
  float indivCost = totalAmount/[self.seatLabel.text integerValue];
  
  // Set the labels
  self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
  
  self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
  
  self.costLabel.text = [NSString stringWithFormat:@"$%0.2f", indivCost];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
*/

@end