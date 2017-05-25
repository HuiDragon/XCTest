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
    
    // obtain the app variables for test access
    
    app  = [UIApplication sharedApplication];
    calcViewController = (ViewController *)app.keyWindow.rootViewController;
    calcView = calcViewController.view;
    

}

- (void)tearDown {//dealloc
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAppDelegate {
    XCTAssertNotNil(app,"Cannot find the application");
    
}

- (void)testCalcView {
    XCTAssertNotNil(calcView,"Cannot find the application");
    
}


- (void)testSubtraction {

    // perform two subtraction tests
    
    [calcViewController press:[calcView viewWithTag:1]]; // 6
    [calcViewController press:[calcView viewWithTag:8]]; // 6
    [calcViewController press:[calcView viewWithTag:14]];// -
    [calcViewController press:[calcView viewWithTag:8]]; // 4
    [calcViewController press:[calcView viewWithTag:12]];// =
    
    XCTAssertEqualObjects(calcViewController.displayField.text, @"10",@"Part1 failed");
    
    [calcViewController press:[calcView viewWithTag:14]];// -
    [calcViewController press:[calcView viewWithTag:6]]; // 4
    [calcViewController press:[calcView viewWithTag:12]];// =
    
    XCTAssertEqualObjects(calcViewController.displayField.text, @"4",@"Part1 failed");

}

- (void)testAddition {

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

//25/4 = 6.25

- (void)testDivision {

    [calcViewController press:[calcView viewWithTag:2]];  //2
    [calcViewController press:[calcView viewWithTag:5]];  //5
    [calcViewController press:[calcView viewWithTag:16]]; ///
    [calcViewController press:[calcView viewWithTag:4]];  //4
    [calcViewController press:[calcView viewWithTag:12]]; //=
    XCTAssertTrue([calcViewController.displayField.text isEqualToString:@"6.25"], "Part 1 Failed!");
}

// 19 x 8 = 152
- (void)testMultiplication {

    [calcViewController press:[calcView viewWithTag:1]];  //1
    [calcViewController press:[calcView viewWithTag:9]];  //9
    [calcViewController press:[calcView viewWithTag:15]]; //*
    [calcViewController press:[calcView viewWithTag:8]];  //8
    [calcViewController press:[calcView viewWithTag:12]]; //=
     XCTAssertTrue([calcViewController.displayField.text isEqualToString:@"152"], "Part 1 Failed!");
}


- (void)testDelete {

    //输入一个数，删除一个数 2 ——> 0
    [calcViewController press:[calcView viewWithTag:2]];  //2
    [calcViewController press:[calcView viewWithTag:19]]; //D(Delete)
    
    XCTAssertTrue([calcViewController.displayField.text isEqualToString:@"0"], "Part 1 Failed!");
    
    //输入两个数，删除一个数，剩一个数 25 ——> 2
    [calcViewController press:[calcView viewWithTag:2]];  //2
    [calcViewController press:[calcView viewWithTag:5]];  //2

    [calcViewController press:[calcView viewWithTag:19]]; //D(Delete)
    
    XCTAssertTrue([calcViewController.displayField.text isEqualToString:@"2"], "Part 2 Failed!");
    
    // 做一次运算，清屏 26 + 4 = 30
    [calcViewController press:[calcView viewWithTag:6]]; // 6
    [calcViewController press:[calcView viewWithTag:13]];// +
    [calcViewController press:[calcView viewWithTag:4]]; // 4
    [calcViewController press:[calcView viewWithTag:4]]; // 4

    [calcViewController press:[calcView viewWithTag:19]]; //D(Delete)

    [calcViewController press:[calcView viewWithTag:12]];// =
    
    XCTAssertTrue([calcViewController.displayField.text isEqualToString:@"30"], "Part 3 Failed!");
}


- (void)testClear {
    
    
    // 输入一个数，删除一个数
    [calcViewController press:[calcView viewWithTag:2]];  //2
    [calcViewController press:[calcView viewWithTag:11]]; //C(Clear)
    
    XCTAssertTrue([calcViewController.displayField.text isEqualToString:@"0"], "Part 1 Failed!");
    
    // 输入两个数，全部删除
    
    [calcViewController press:[calcView viewWithTag:2]];  //2
    [calcViewController press:[calcView viewWithTag:4]];  //2
    [calcViewController press:[calcView viewWithTag:11]]; //C(Clear)
    
    XCTAssertTrue([calcViewController.displayField.text isEqualToString:@"0"], "Part 2 Failed!");
    
    // 做一次运算，清屏
    [calcViewController press:[calcView viewWithTag:6]]; // 6
    [calcViewController press:[calcView viewWithTag:13]];// +
    [calcViewController press:[calcView viewWithTag:4]]; // 4
    [calcViewController press:[calcView viewWithTag:12]];// =
    [calcViewController press:[calcView viewWithTag:11]]; //C(Clear)

    XCTAssertTrue([calcViewController.displayField.text isEqualToString:@"0"], "Part 2 Failed!");


}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
