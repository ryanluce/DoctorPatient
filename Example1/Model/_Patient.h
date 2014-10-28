// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Patient.h instead.

#import <CoreData/CoreData.h>

extern const struct PatientAttributes {
	__unsafe_unretained NSString *dateOfBirth;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *gender;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *medicalNote;
	__unsafe_unretained NSString *pictureName;
} PatientAttributes;

extern const struct PatientRelationships {
	__unsafe_unretained NSString *doctor;
} PatientRelationships;

@class Doctor;

@interface PatientID : NSManagedObjectID {}
@end

@interface _Patient : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PatientID* objectID;

@property (nonatomic, strong) NSString* dateOfBirth;

//- (BOOL)validateDateOfBirth:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* firstName;

//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* gender;

//- (BOOL)validateGender:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastName;

//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* medicalNote;

//- (BOOL)validateMedicalNote:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pictureName;

//- (BOOL)validatePictureName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Doctor *doctor;

//- (BOOL)validateDoctor:(id*)value_ error:(NSError**)error_;

@end

@interface _Patient (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveDateOfBirth;
- (void)setPrimitiveDateOfBirth:(NSString*)value;

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSString*)primitiveGender;
- (void)setPrimitiveGender:(NSString*)value;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (NSString*)primitiveMedicalNote;
- (void)setPrimitiveMedicalNote:(NSString*)value;

- (NSString*)primitivePictureName;
- (void)setPrimitivePictureName:(NSString*)value;

- (Doctor*)primitiveDoctor;
- (void)setPrimitiveDoctor:(Doctor*)value;

@end
