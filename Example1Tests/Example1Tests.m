//
//  Example1Tests.m
//  Example1Tests
//
//  Created by Ryan Luce on 10/27/14.
//  Copyright (c) 2014 Ryan Luce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DataCoordinator.h"

@interface Example1Tests : XCTestCase

@end

@implementation Example1Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDoctors
{
    DataCoordinator *dataCoordinator = [DataCoordinator sharedDataCoordinator];
    //TODO: safer to load json and dynamically set this number
    NSUInteger numberOfDoctorsInJSON = 3;
    
    XCTAssertEqual(dataCoordinator.numberOfDoctors, numberOfDoctorsInJSON, @"Number of Doctors is equal in JSON and Core Data Store");
    
}

- (void)testPatients
{
    DataCoordinator *dataCoordinator = [DataCoordinator sharedDataCoordinator];
    //TODO: safer to load json and dynamically set this number
    NSUInteger numberOfPatientsInJSON = 3;
    
    XCTAssertEqual(dataCoordinator.numberOfPatients, numberOfPatientsInJSON, @"Number of Patients is equal in JSON and Core Data Store");
}



@end
