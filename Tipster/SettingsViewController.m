//
//  SettingsViewController.m
//  Tipster
//
//  Created by Githel Lynn Suico on 6/23/20.
//  Copyright © 2020 Githel Lynn Suico. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *tipSwitch;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)switchSwapped:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:self.tipSwitch.on forKey:@"customTip"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  BOOL test= [[NSUserDefaults standardUserDefaults] boolForKey:@"customTip"];
  NSLog(@"%@",test?@"YES":@"NO");
  [self.tipSwitch setOn:test animated:YES];
}

@end
