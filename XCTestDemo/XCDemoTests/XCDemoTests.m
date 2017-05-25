//
//  XCDemoTests.m
//  XCDemoTests
//
//  Created by Liuguiliang on 2017/5/25.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import <XCTest/XCTest.h>

// Import the application specific header file

#import "ViewController.h"
#import "AppDelegate.h"


@interface XCDemoTests : XCTestCase {
// add instance variables to the XCDemoTests class
    @private
    UIApplication   *app;
    AppDelegate     *delegate;
    ViewController  *calcViewController;
    UIView          *calcView;
    
}
@end

@implementation XCDemoTests

- (void)setUp {//init
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {//dealloc
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddition {

    // obtain the app variables for test access
    
    app  = [UIApplication sharedApplication];
    calcViewController = (ViewController *)app.keyWindow.rootViewController;
    calcView = calcViewController.view;
    
    // perform two addition tests
    
    [calcViewController press:[calcView viewWithTag:6]]; // 6
    [calcViewController press:[calcView viewWithTag:13]];// +
    [calcViewController press:[calcView viewWithTag:4]]; // 4
    [calcViewController press:[calcView viewWithTag:12]];// =
    
    XCTAssertEqualObjects(calcViewController.displayField.text, @"10",@"Part1 failed");
    
    [calcViewController press:[calcView viewWithTag:13]];// +
    [calcViewController press:[calcView viewWithTag:6]]; // 4
    [calcViewController press:[calcView viewWithTag:12]];// =
    
    XCTAssertEqualObjects(calcViewController.displayField.text, @"16",@"Part1 failed");

    

    
    
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
