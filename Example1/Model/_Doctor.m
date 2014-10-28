// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Doctor.m instead.

#import "_Doctor.h"

const struct DoctorAttributes DoctorAttributes = {
	.firstName = @"firstName",
	.hospitalName = @"hospitalName",
	.lastName = @"lastName",
	.pictureName = @"pictureName",
};

const struct DoctorRelationships DoctorRelationships = {
	.patients = @"patients",
};

@implementation DoctorID
@end

@implementation _Doctor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Doctor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Doctor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Doctor" inManagedObjectContext:moc_];
}

- (DoctorID*)objectID {
	return (DoctorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic firstName;

@dynamic hospitalName;

@dynamic lastName;

@dynamic pictureName;

@dynamic patients;

- (NSMutableSet*)patientsSet {
	[self willAccessValueForKey:@"patients"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"patients"];

	[self didAccessValueForKey:@"patients"];
	return result;
}

@end

