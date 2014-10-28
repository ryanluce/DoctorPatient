//
//  DataCoordinator.h
//  Example1
//
//  Created by Ryan Luce on 10/27/14.
//  Copyright (c) 2014 Ryan Luce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DataCoordinator : NSObject

+ (instancetype)sharedDataCoordinator;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (void)loadDoctorJSONIntoCoreData;
- (void)loadPatientJSONIntoCoreData;

- (NSInteger)numberOfPatients;
- (NSInteger)numberOfDoctors;

@end
