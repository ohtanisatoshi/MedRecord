//
//  ViewController.m
//  MedRecord
//
//  Created by Satoshi Ohtani on 3/15/15.
//  Copyright (c) 2015 Satoshi Ohtani. All rights reserved.
//

#import "ViewController.h"
#import "AddMedViewController.h"

@interface ViewController () {
    NSMutableArray *_medArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _medTable.delegate = self;
    _medTable.dataSource = self;
    _medTable.allowsMultipleSelectionDuringEditing = NO;
    

    [self loadMedArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_medArray count];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_medArray removeObjectAtIndex:indexPath.row];
        [_medTable deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self saveMedArray];
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"medCell" forIndexPath:indexPath];
    
    Medicine *medicine = _medArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ (%ld) %ld", [medicine medName], (long)[medicine necessaryCount], (long)[medicine takenCount]];
    
    if ([medicine takenCount] < [medicine necessaryCount]) {
        cell.textLabel.textColor = [UIColor redColor];
    } else {
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //set the position of the button
    button.frame = CGRectMake(cell.frame.size.width - 70, 5, 50, 30);
    [button setTitle:@"Reset" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(medResetTapped:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor= [UIColor clearColor];
    button.tag = indexPath.row;
    
    [cell.contentView addSubview:button];
    
    return cell;

}

- (void) medResetTapped:(id)sender {
    NSInteger index = [sender tag];
    Medicine *medicine = _medArray[index];
    medicine.takenCount = 0;
    
    [_medTable reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Medicine *medicine = _medArray[indexPath.row];
    [medicine incrementTakenCount];
    
    [self saveMedArray];
    [_medTable reloadData];
}

- (IBAction)resetTapped:(id)sender {
    for (Medicine *medicine in _medArray) {
        medicine.takenCount = 0;
    }
    
    [self saveMedArray];
    [_medTable reloadData];
}

- (void) saveMedArray {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"medarray"];
    BOOL result = [NSKeyedArchiver archiveRootObject:_medArray toFile:filePath];
    if (result == NO) {
        NSLog(@"Save data failed.");
    }
}

- (void) loadMedArray {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"medarray"];
  
    _medArray = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    if (_medArray == nil) {
        _medArray = [[NSMutableArray alloc] init];
        
        // create dummy med data
        Medicine *med;
        med = [[Medicine alloc] initWithMedName:@"マルチビタミン" necessaryCount:1];
        [_medArray addObject:med];
        med = [[Medicine alloc] initWithMedName:@"ブルーベリー" necessaryCount:2];
        [_medArray addObject:med];
        med = [[Medicine alloc] initWithMedName:@"亜鉛" necessaryCount:1];
        [_medArray addObject:med];
        med = [[Medicine alloc] initWithMedName:@"DHA" necessaryCount:4];
        [_medArray addObject:med];
        med = [[Medicine alloc] initWithMedName:@"マルチミネラル" necessaryCount:3];
        [_medArray addObject:med];
        
        [self saveMedArray];
    }
}

- (void) addMedWithName:(NSString*)medName necessaryCount:(NSInteger)necessaryCount {
    Medicine *medicine = [[Medicine alloc] initWithMedName:medName necessaryCount:necessaryCount];
    [_medArray addObject:medicine];
    [self saveMedArray];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"addMed"]) {
        AddMedViewController *vc = [segue destinationViewController];
        vc.ViewController = self;
    }
}

@end
