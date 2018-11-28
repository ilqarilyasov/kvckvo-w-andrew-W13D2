//
//  ViewController.m
//  KVCKVO
//
//  Created by Andrew R Madsen on 11/27/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "ViewController.h"
#import "LSIDepartment.h"
#import "LSIEmployee.h"
#import "LSIHRController.h"
#import "LSIInternalRevenueService.h"

@interface ViewController ()

@property (nonatomic) LSIHRController *hrController;

@end

@implementation ViewController

- (IBAction)printAllEmployees:(id)sender
{
    NSLog(@"All employees: %@", self.hrController.allEmployees);
}

- (IBAction)printHighestSalary:(id)sender
{
    NSLog(@"Highest salary: %@", @([self.hrController highestSalary]));
}

- (IBAction)givePhilARaise:(id)sender
{
    NSArray *allEmployees = self.hrController.allEmployees;
    LSIEmployee *phil = [[allEmployees filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"name == %@", @"Phil"]] firstObject];
    //[phil setValue:@(phil.salary + 100000) forKey:@"salary"];
    phil.salary += 100000;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    LSIDepartment *marketing = [[LSIDepartment alloc] init];
    marketing.name = @"Marketing";
    LSIEmployee *philSchiller = [[LSIEmployee alloc] init];
    philSchiller.name = @"Phil";
    philSchiller.jobTitle = @"Director of Marketing";
    philSchiller.salary = 10000000;
    marketing.manager = philSchiller;
    [[LSIInternalRevenueService sharedService] startMonitoringEmployee:philSchiller];

    LSIDepartment *engineering = [[LSIDepartment alloc] init];
    engineering.name = @"Engineering";
    LSIEmployee *craig = [[LSIEmployee alloc] init];
    craig.name = @"Craig";
    craig.jobTitle = @"Head of Software";
    craig.salary = 9000000;
    engineering.manager = craig;

    LSIEmployee *e1 = [[LSIEmployee alloc] init];
    e1.name = @"Chad";
    e1.jobTitle = @"Engineer";
    e1.salary = 200000;

    LSIEmployee *e2 = [[LSIEmployee alloc] init];
    e2.name = @"Lance";
    e2.jobTitle = @"Engineer";
    e2.salary = 250000;

    LSIEmployee *e3 = [[LSIEmployee alloc] init];
    e3.name = @"Joe";
    e3.jobTitle = @"Marketing Designer";
    e3.salary = 100000;

    [engineering addEmployee:e1];
    [engineering addEmployee:e2];
    [marketing addEmployee:e3];

    LSIHRController *controller = [LSIHRController sharedController];
    [controller addDepartment:marketing];
    [controller addDepartment:engineering];
    self.hrController = controller;
}


@end
