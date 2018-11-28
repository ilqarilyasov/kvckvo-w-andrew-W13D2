//
//  LSIDepartment.h
//  KVCKVO
//
//  Created by Andrew R Madsen on 11/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LSIEmployee;

@interface LSIDepartment : NSObject

- (void)addEmployee:(LSIEmployee *)employee;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) LSIEmployee *manager;
@property (nonatomic, copy, readonly) NSArray<LSIEmployee *> *employees;

@end

NS_ASSUME_NONNULL_END
