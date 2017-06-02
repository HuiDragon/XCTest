//
//  XCTestUITests.m
//  XCTestUITests
//
//  Created by Liuguiliang on 2017/5/31.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface XCTestUITests : XCTestCase

@end

@implementation XCTestUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAdd {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.buttons[@"1"] tap];
    [app.buttons[@"2"] tap];
    [app.buttons[@"*"] tap];
    
    XCUIElement *button = app.buttons[@"3"];
    [button tap];
    
    XCUIElement *button2 = app.buttons[@"="];
    [button2 tap];
    [app.buttons[@"+"] tap];
    [button tap];
    [button2 tap];
    [app.buttons[@"C"] tap];
 
    NSLog(@"----%f",self.testRun.totalDuration);
    
    
}

@end
