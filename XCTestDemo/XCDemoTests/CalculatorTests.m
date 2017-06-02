//
//  CalculatorTests.m
//  XCTestDemo
//
//  Created by Liuguiliang on 2017/6/2.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface CalculatorTests : XCTestCase

@property (strong, nonatomic) Calculator *calculator;

@end

@implementation CalculatorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.calculator = [[Calculator alloc] init];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCaculatorNotNil {

    XCTAssertNotNil(self.calculator, "calculator 对象为空");
}

- (void)testInputAdd {
    [self.calculator input:@"4"];
    [self.calculator input:@"+"];
    [self.calculator input:@"3"];
    [self.calculator input:@"="];
    
    XCTAssertTrue([self.calculator.displayValue integerValue] == 7,@"step1：1 + 3 = %@ 不成立",self.calculator.displayValue);

    [self.calculator input:@"+"];
    [self.calculator input:@"3"];
    [self.calculator input:@"="];
    
    XCTAssertTrue([self.calculator.displayValue integerValue] == 10,@"step2：1 + 3 = %@ 不成立",self.calculator.displayValue);
}

- (void)testInputSub {
    [self.calculator input:@"4"];
    [self.calculator input:@"-"];
    [self.calculator input:@"3"];
    [self.calculator input:@"="];
    
    XCTAssertTrue([self.calculator.displayValue integerValue] == 1,@"4 - 3 = %@ 不成立",self.calculator.displayValue);
    
}
- (void)testInputMul {
    [self.calculator input:@"4"];
    [self.calculator input:@"*"];
    [self.calculator input:@"2"];
    [self.calculator input:@"="];
    
    XCTAssertTrue([self.calculator.displayValue integerValue] == 8,@"4 * 2 = %@ 不成立",self.calculator.displayValue);
    
}

- (void)testInputDiv {
    [self.calculator input:@"4"];
    [self.calculator input:@"/"];
    [self.calculator input:@"2"];
    [self.calculator input:@"="];
    
    XCTAssertTrue([self.calculator.displayValue integerValue] == 2,@"4 / 2 = %@ 不成立",self.calculator.displayValue);
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
