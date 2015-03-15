//
//  AddMedViewController.m
//  MedRecord
//
//  Created by Satoshi Ohtani on 3/15/15.
//  Copyright (c) 2015 Satoshi Ohtani. All rights reserved.
//

#import "AddMedViewController.h"

@interface AddMedViewController ()

@end

@implementation AddMedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)okTapped:(id)sender {
    [_viewController addMedWithName:_medCountText.text necessaryCount:[_medCountText.text intValue]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)viewTapped:(id)sender {
    [self.view endEditing:YES];
}

@end
