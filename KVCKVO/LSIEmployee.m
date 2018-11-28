//
//  LSIEmployee.m
//  KVCKVO
//
//  Created by Andrew R Madsen on 11/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIEmployee.h"

@implementation LSIEmployee

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ name: %@ (%@), salary: %@", [super description], self.name, self.jobTitle, @(self.salary)];
}

@end
