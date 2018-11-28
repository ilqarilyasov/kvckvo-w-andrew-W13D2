//
//  LSIInternalRevenueService.m
//  KVCKVO
//
//  Created by Andrew R Madsen on 11/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIInternalRevenueService.h"
#import "LSIEmployee.h"

@interface LSIInternalRevenueService ()

@property (nonatomic, strong) NSMutableArray *monitoredEmployees;

@end

@implementation LSIInternalRevenueService

+ (LSIInternalRevenueService *)sharedService
{
    static LSIInternalRevenueService *sharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[LSIInternalRevenueService alloc] init];
    });
    return sharedService;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _monitoredEmployees = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)startMonitoringEmployee:(LSIEmployee *)employee
{
    [employee addObserver:self forKeyPath:@"salary" options:0 context:NULL];
    [self.monitoredEmployees addObject:employee];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@'s %@ is now %@", object, keyPath, [object valueForKeyPath:keyPath]);
}

@end
