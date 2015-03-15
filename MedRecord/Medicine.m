//
//  Medicine.m
//  MedRecord
//
//  Created by Satoshi Ohtani on 3/15/15.
//  Copyright (c) 2015 Satoshi Ohtani. All rights reserved.
//

#import "Medicine.h"

#define kMedName @"MedName"
#define kNecessaryCount @"NecessaryCount"
#define kTakenCount @"TakenCount"

@implementation Medicine

- (id) initWithMedName:(NSString*)medName necessaryCount:(NSInteger) neccesaryCount {
    self = [super init];
    
    _medName = medName;
    _necessaryCount = neccesaryCount;
    _takenCount = 0;
    
    return self;
}

- (id) initWithMedName:(NSString*)medName necessaryCount:(NSInteger) neccesaryCount takenCount:(NSInteger) takenCount {
    self = [super init];
    
    _medName = medName;
    _necessaryCount = neccesaryCount;
    _takenCount = takenCount;
    
    return self;
}

- (void) incrementTakenCount {
    _takenCount ++;
}

- (void) decrementTakenCount {
    _takenCount --;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_medName forKey:kMedName];
    [aCoder encodeInt64:_necessaryCount forKey:kNecessaryCount];
    [aCoder encodeInt64:_takenCount forKey:kTakenCount];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    NSString *medName = [aDecoder decodeObjectForKey:kMedName];
    NSInteger necessaryCount = [aDecoder decodeInt64ForKey:kNecessaryCount];
    NSInteger takenCount = [aDecoder decodeInt64ForKey:kTakenCount];
    return [self initWithMedName:medName necessaryCount:necessaryCount takenCount:takenCount];
}

@end
