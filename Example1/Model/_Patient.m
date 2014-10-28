// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Patient.m instead.

#import "_Patient.h"

const struct PatientAttributes PatientAttributes = {
	.dateOfBirth = @"dateOfBirth",
	.firstName = @"firstName",
	.gender = @"gender",
	.lastName = @"lastName",
	.medicalNote = @"medicalNote",
	.pictureName = @"pictureName",
};

const struct PatientRelationships PatientRelationships = {
	.doctor = @"doctor",
};

@implementation PatientID
@end

@implementation _Patient

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Patient" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Patient";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Patient" inManagedObjectContext:moc_];
}

- (PatientID*)objectID {
	return (PatientID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic dateOfBirth;

@dynamic firstName;

@dynamic gender;

@dynamic lastName;

@dynamic medicalNote;

@dynamic pictureName;

@dynamic doctor;

@end

