//
//  LSIInternalRevenueService.h
//  KVCKVO
//
//  Created by Andrew R Madsen on 11/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class LSIEmployee;

@interface LSIInternalRevenueService : NSObject

@property (class, readonly) LSIInternalRevenueService *sharedService;

- (void)startMonitoringEmployee:(LSIEmployee *)employee;

@end

NS_ASSUME_NONNULL_END
