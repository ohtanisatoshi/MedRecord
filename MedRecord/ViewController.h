//
//  ViewController.h
//  MedRecord
//
//  Created by Satoshi Ohtani on 3/15/15.
//  Copyright (c) 2015 Satoshi Ohtani. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Medicine.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UITableView *medTable;

- (IBAction)resetTapped:(id)sender;
- (void) addMedWithName:(NSString*)medName necessaryCount:(NSInteger)necessaryCount;

@end

