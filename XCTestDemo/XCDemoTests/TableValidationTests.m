//
//  TableValidationTests.m
//  XCTestDemo
//
//  Created by Liuguiliang on 2017/5/25.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Table.h"

@interface TableValidationTests : XCTestCase

@end

@implementation TableValidationTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmptyTableRowAndColumnCount {
    
    Table *table = [[Table alloc] init];
    XCTAssertEqual(table.rowCount, 0, "Row count was not zero.");
    XCTAssertEqual(table.columnCount, 0, "Column count was not zero.");
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
