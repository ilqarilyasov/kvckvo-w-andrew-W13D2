//
//  LSIHRController.h
//  KVCKVO
//
//  Created by Andrew R Madsen on 11/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LSIDepartment;
@class LSIEmployee;

@interface LSIHRController : NSObject

@property (class, readonly) LSIHRController *sharedController;

- (void)addDepartment:(LSIDepartment *)department;

- (NSInteger)highestSalary;

@property (nonatomic, copy, readonly) NSArray <LSIDepartment *> *departments;
@property (nonatomic, readonly) NSArray<LSIEmployee *> *allEmployees;

@end

NS_ASSUME_NONNULL_END
