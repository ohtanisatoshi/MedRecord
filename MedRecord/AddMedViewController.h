//
//  AddMedViewController.h
//  MedRecord
//
//  Created by Satoshi Ohtani on 3/15/15.
//  Copyright (c) 2015 Satoshi Ohtani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AddMedViewController : UIViewController

@property ViewController *viewController;
@property (weak, nonatomic) IBOutlet UITextField *medNameText;
@property (weak, nonatomic) IBOutlet UITextField *medCountText;

- (IBAction)okTapped:(id)sender;
- (IBAction)cancelTapped:(id)sender;
- (IBAction)viewTapped:(id)sender;

@end
