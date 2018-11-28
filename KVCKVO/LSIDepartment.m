//
//  LSIDepartment.m
//  KVCKVO
//
//  Created by Andrew R Madsen on 11/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIDepartment.h"

@interface LSIDepartment ()

@property (nonatomic) NSMutableArray<LSIEmployee *> *internalEmployees;

@end

@implementation LSIDepartment

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEmployees = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addEmployee:(LSIEmployee *)employee
{
    [self.internalEmployees addObject:employee];
}

- (NSArray<LSIEmployee *> *)employees
{
    return [[self.internalEmployees copy] arrayByAddingObject:self.manager];
}

@end
