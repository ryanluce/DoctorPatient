//
//  DataCoordinator.m
//  Example1
//
//  Created by Ryan Luce on 10/27/14.
//  Copyright (c) 2014 Ryan Luce. All rights reserved.
//

#import "DataCoordinator.h"
#import "Doctor.h"
#import "Patient.h"
#import <UIKit/UIKit.h>

/* sample doctor object
 {
 "firstName": "James",
 "lastName": "Downing",
 "hospitalName": "Johnson City Medical Center",
 "pictureName": "doctor2.jpeg"
 }
*/
//JSON keys match core data keys
#define kDoctorKeyFirstName @"firstName"
#define kDoctorKeyLastName @"lastName"
#define kDoctorKeyHospitalName @"hospitalName"
#define kDoctorKeyPictureName @"pictureName"

/* sample person object
 {
 "firstName": "Jane",
 "lastName": "Smith",
 "dateOfBirth": "October 15, 1989",
 "gender": "Female",
 "medicalNote": "If an illness occurs when the clinic is closed and you get a note from a physician off campus – make sure it is on their professional letterhead. Only the attending physician who personally diagnosed the student at the time of their illness can write the note.",
 "pictureName": "patient1.jpeg"
 }
 */
#define kPatientKeyFirstName @"firstName"
#define kPatientKeyLastName @"lastName"
#define kPatientKeyDateOfBirth @"dateOfBirth"
#define kPatientKeyGender @"gender"
#define kPatientKeyMedicalNote @"medicalNote"
#define kPatientKeyPictureName @"pictureName"

@implementation DataCoordinator

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (instancetype)sharedDataCoordinator
{
    static DataCoordinator *sharedDataCoordinator;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedDataCoordinator = [[self alloc] init];
    });
    return sharedDataCoordinator;
}

#pragma mark - JSON

- (void)loadDoctorJSONIntoCoreData
{
    NSString *doctorJSONPath = [[NSBundle mainBundle] pathForResource:@"Doctors" ofType:@"json"];
    NSError *stringError;
    NSString *doctorJSON = [NSString stringWithContentsOfFile:doctorJSONPath
                                                     encoding:NSUTF8StringEncoding
                                                        error:&stringError];
    NSError *serializationError;
    NSArray *doctorJSONObject = [NSJSONSerialization
                                      JSONObjectWithData:[doctorJSON dataUsingEncoding:NSUTF8StringEncoding]
                                                 options:0
                                      error:&serializationError];
    for(NSDictionary *doctorDictionary in doctorJSONObject)
    {
        if(![self doctorWithFirstName:doctorDictionary[kDoctorKeyFirstName]
                          andLastName:doctorDictionary[kDoctorKeyLastName]])
        {
            //If it doesn't exist already, create the object
            NSEntityDescription *doctorEntityDescription = [NSEntityDescription entityForName:[Doctor entityName]
                                                                 inManagedObjectContext:self.managedObjectContext];
            Doctor *doctorToSave = [[Doctor alloc] initWithEntity:doctorEntityDescription
                                   insertIntoManagedObjectContext:self.managedObjectContext];
            doctorToSave.firstName = doctorDictionary[kDoctorKeyFirstName];
            doctorToSave.lastName = doctorDictionary[kDoctorKeyLastName];
            doctorToSave.hospitalName = doctorDictionary[kDoctorKeyHospitalName];
            doctorToSave.pictureName = doctorDictionary[kDoctorKeyPictureName];
            
        }
    }
    [self saveContext];
    
}

- (void)loadPatientJSONIntoCoreData
{
    NSString *patientJSONPath = [[NSBundle mainBundle] pathForResource:@"Patients" ofType:@"json"];
    NSError *stringError;
    NSString *patientJSON = [NSString stringWithContentsOfFile:patientJSONPath
                                                     encoding:NSUTF8StringEncoding
                                                        error:&stringError];
    NSError *serializationError;
    NSArray *patientJSONObject = [NSJSONSerialization
                                 JSONObjectWithData:[patientJSON dataUsingEncoding:NSUTF8StringEncoding]
                                 options:0
                                 error:&serializationError];
    for(NSDictionary *patientDictionary in patientJSONObject)
    {
        if(![self patientWithFirstName:patientDictionary[kPatientKeyFirstName]
                          andLastName:patientDictionary[kPatientKeyLastName]])
        {
            Patient *patientToSave = [NSEntityDescription insertNewObjectForEntityForName:[Patient entityName]
                                                                   inManagedObjectContext:self.managedObjectContext];

            patientToSave.firstName = patientDictionary[kPatientKeyFirstName];
            patientToSave.lastName = patientDictionary[kPatientKeyLastName];
            patientToSave.gender = patientDictionary[kPatientKeyGender];
            patientToSave.medicalNote = patientDictionary[kPatientKeyMedicalNote];
            patientToSave.dateOfBirth = patientDictionary[kPatientKeyDateOfBirth];
            patientToSave.pictureName = patientDictionary[kPatientKeyPictureName];
        }
    }
    [self saveContext];
}


#pragma mark - CoreData Helpers

- (Doctor *)doctorWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName
{
    NSFetchRequest *doctorFetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Doctor entityName]];
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"firstName = %@ AND lastName = %@", firstName, lastName];

    doctorFetchRequest.predicate = namePredicate;
    
    NSError *fetchError;
    NSArray *fetchResults = [self.managedObjectContext executeFetchRequest:doctorFetchRequest
                                                                     error:&fetchError];
    if(fetchResults.count != 0)
    {
        return fetchResults[0];
    }
    
    return nil;
}

- (Patient *)patientWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName
{
    NSFetchRequest *patientFetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Patient entityName]];
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"firstName = %@ AND lastName = %@",
                                                                  firstName,
                                                                  lastName];

    patientFetchRequest.predicate = namePredicate;
    
    NSError *fetchError;
    NSArray *fetchResults = [self.managedObjectContext executeFetchRequest:patientFetchRequest
                                                                     error:&fetchError];
    if(fetchResults.count != 0)
    {
        return fetchResults[0];
    }
    
    return nil;
}

- (NSInteger)numberOfPatients
{
    NSFetchRequest *patientFetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Patient entityName]];
    NSError *fetchError;
    NSArray *fetchResults = [self.managedObjectContext executeFetchRequest:patientFetchRequest
                                                                     error:&fetchError];

    return fetchResults.count;
}

- (NSInteger)numberOfDoctors
{
    NSFetchRequest *doctorFetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Doctor entityName]];
    NSError *fetchError;
    NSArray *fetchResults = [self.managedObjectContext executeFetchRequest:doctorFetchRequest
                                                                     error:&fetchError];
    return fetchResults.count;
}


#pragma mark - CoreData Setup
- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.ryanluce.Example1" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Example1" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Example1.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
