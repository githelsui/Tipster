//
//  ViewController.m
//  Tipster
//
//  Created by Githel Lynn Suico on 6/23/20.
//  Copyright © 2020 Githel Lynn Suico. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIView *resultsView;
@property (weak, nonatomic) IBOutlet UITextField *inputView;
@property (weak, nonatomic) IBOutlet UILabel *billMessage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultsView.alpha = 0;
    self.tipControl.alpha = 0;
    
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)editingBegins:(id)sender {
    
    CGRect inputFrame = self.inputView.frame;
    inputFrame.origin.y -= 250;
       
    [UIView animateWithDuration:0.2 animations:^{
            self.inputView.frame = inputFrame;
            self.resultsView.alpha = 1;
            self.tipControl.alpha = 1;
            self.billMessage.alpha = 0;
    }];
}

- (IBAction)editingEnds:(id)sender {
    CGRect inputFrame = self.inputView.frame;
    inputFrame.origin.y += 250;
    
    [UIView animateWithDuration:0.2 animations:^{
            self.inputView.frame = inputFrame;
            self.resultsView.alpha = 0;
            self.tipControl.alpha = 0;
            self.billMessage.alpha = 1;
    }];
}

@end
