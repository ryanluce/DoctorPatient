// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Doctor.h instead.

#import <CoreData/CoreData.h>

extern const struct DoctorAttributes {
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *hospitalName;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *pictureName;
} DoctorAttributes;

extern const struct DoctorRelationships {
	__unsafe_unretained NSString *patients;
} DoctorRelationships;

@class Patient;

@interface DoctorID : NSManagedObjectID {}
@end

@interface _Doctor : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DoctorID* objectID;

@property (nonatomic, strong) NSString* firstName;

//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* hospitalName;

//- (BOOL)validateHospitalName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lastName;

//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pictureName;

//- (BOOL)validatePictureName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *patients;

- (NSMutableSet*)patientsSet;

@end

@interface _Doctor (PatientsCoreDataGeneratedAccessors)
- (void)addPatients:(NSSet*)value_;
- (void)removePatients:(NSSet*)value_;
- (void)addPatientsObject:(Patient*)value_;
- (void)removePatientsObject:(Patient*)value_;

@end

@interface _Doctor (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;

- (NSString*)primitiveHospitalName;
- (void)setPrimitiveHospitalName:(NSString*)value;

- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;

- (NSString*)primitivePictureName;
- (void)setPrimitivePictureName:(NSString*)value;

- (NSMutableSet*)primitivePatients;
- (void)setPrimitivePatients:(NSMutableSet*)value;

@end
