//
//  ViewTests.m
//  KittenWeather
//
//  Created by Sean McMains on 3/30/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import "ViewTests.h"
#import "ViewController.h"

@interface ViewTests()

@property (strong) ViewController *viewController;

@end

@implementation ViewTests

-(void)setUp {
    [super setUp];
    //self.recordMode = YES;
    self.viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
}

- (void)testRootView {
    FBSnapshotVerifyView( self.viewController.view, nil );
}

@end
