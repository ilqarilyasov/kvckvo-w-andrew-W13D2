//
//  LSIEmployee.h
//  KVCKVO
//
//  Created by Andrew R Madsen on 11/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIEmployee : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *jobTitle;
@property (nonatomic) NSInteger salary;

@end

NS_ASSUME_NONNULL_END
