//
//  ViewController.m
//  XCTestDemo
//
//  Created by Liuguiliang on 2017/5/25.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@property (strong, nonatomic) Calculator *calculator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.calculator = [[Calculator alloc] init];
}


- (IBAction)press:(id)sender {

    [self.calculator input:[sender titleForState:UIControlStateNormal]];
    [self.displayField setText:[self.calculator displayValue]];
}


@end
