//
//  ViewController.m
//  TipCalculator
//
//  Created by  Pratibha Dhok on 1/20/17.
//  Copyright © 2017 Pratibha Dhok. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;



@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateBillAmount];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTapAction:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateBillAmount];
}
- (IBAction)onTipPercentageChange:(UISegmentedControl *)sender {
    [self updateBillAmount];
}

- (void) updateBillAmount {
    // Get Entered bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // Compute tip amount
    NSArray *tipValues = @[@(0.15), @(.20), @(0.30)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    
    // Update UI with values
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
}

@end
