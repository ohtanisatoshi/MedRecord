//
//  Medicine.h
//  MedRecord
//
//  Created by Satoshi Ohtani on 3/15/15.
//  Copyright (c) 2015 Satoshi Ohtani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Medicine : NSObject <NSCoding>

@property NSString *medName;
@property NSInteger necessaryCount;
@property NSInteger takenCount;

- (id) initWithMedName:(NSString*)medName necessaryCount:(NSInteger) neccesaryCount;
- (void) incrementTakenCount;
- (void) decrementTakenCount;

@end
