//
//  LSIHRController.m
//  KVCKVO
//
//  Created by Andrew R Madsen on 11/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIHRController.h"
#import "LSIDepartment.h"

@interface LSIHRController ()

@property (nonatomic) NSMutableArray <LSIDepartment *> *internalDepartments;

@end

@implementation LSIHRController

+ (LSIHRController *)sharedController
{
    static LSIHRController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[[self class] alloc] init];
    });
    return sharedController;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalDepartments = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addDepartment:(LSIDepartment *)department
{
    [self.internalDepartments addObject:department];
}

- (NSInteger)highestSalary
{
    return [[[self valueForKeyPath:@"departments.@unionOfArrays.employees"] valueForKeyPath:@"@max.salary"] integerValue];
//    NSMutableArray *allEmployees = [NSMutableArray array];
//    for (LSIDepartment *department in self.departments) {
//        [allEmployees addObjectsFromArray:department.employees];
//    }
//
//    LSIEmployee *highestPaid = nil;
//    for (LSIEmployee *employee in allEmployees) {
//        if (employee.salary > highestPaid.salary) {
//            highestPaid = employee;
//        }
//    }
//    return highestPaid.salary;
}

- (NSArray<LSIDepartment *> *)departments
{
    return [self.internalDepartments copy];
}

- (NSArray<LSIEmployee *> *)allEmployees
{
    return [self valueForKeyPath:@"departments.@unionOfArrays.employees"];
}

@end
