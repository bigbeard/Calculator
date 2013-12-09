//
//  ViewController.m
//  Calculator
//
//  Created by Ian Cliffe on 13/08/2013.
//  Copyright (c) 2013 Ian Cliffe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    displayNumber = [[NSMutableString alloc]initWithString: @"0"];
    self.displayText.text = displayNumber;
    currentResult = [NSDecimalNumber zero];
    currentValue = [NSDecimalNumber zero];
    lastOperation = NOOPERATION;
    operatorClicked = true;
    lastButtonWasEquals = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)equalsButtonClick:(UIButton *)sender {
    if (!lastButtonWasEquals) {
        currentValue = [NSDecimalNumber decimalNumberWithString: self.displayText.text];
    }
    
    [self calculateAndDisplayResult];
    operatorClicked = true;
    lastButtonWasEquals = true;
}

- (IBAction)plusButtonClick:(UIButton *)sender {
    operation operator = PLUS;
    [self operatorClicked: &operator];
}

- (IBAction)minusButtonClick:(UIButton *)sender {
    operation operator = MINUS;
    [self operatorClicked: &operator];
}

- (IBAction)divideButtonClick:(UIButton *)sender {
    operation operator = DIVIDE;
    [self operatorClicked: &operator];
}

- (IBAction)multipleButtonClick:(UIButton *)sender {
    operation operator = MULTIPLY;
    [self operatorClicked: &operator];
}

- (IBAction)zeroButton:(UIButton *)sender {
    [self appendToDisplay: @"0"];
}

- (IBAction)oneButton:(UIButton *)sender {
    [self appendToDisplay: @"1"];
}

- (IBAction)twoButton:(UIButton *)sender {
    [self appendToDisplay: @"2"];
}

- (IBAction)threeButton:(UIButton *)sender {
    [self appendToDisplay: @"3"];
}

- (IBAction)fourButton:(UIButton *)sender {
    [self appendToDisplay: @"4"];
}

- (IBAction)fiveButton:(UIButton *)sender {
    [self appendToDisplay: @"5"];
}

- (IBAction)sixButton:(UIButton *)sender {
    [self appendToDisplay: @"6"];
}

- (IBAction)sevenButton:(UIButton *)sender {
    [self appendToDisplay: @"7"];
}

- (IBAction)eightButton:(UIButton *)sender {
    [self appendToDisplay: @"8"];
}

- (IBAction)nineButton:(UIButton *)sender {
    [self appendToDisplay: @"9"];
}

- (IBAction)decimalButton:(UIButton *)sender {
    if ([self.displayText.text rangeOfString: @"."].location == NSNotFound) {
        [self appendToDisplay: @"."];
    }
}

- (IBAction)clearButton:(UIButton *)sender {
    [displayNumber setString: @"0"];
    [self updateDisplay];
    currentResult = [NSDecimalNumber zero];
    lastOperation = NOOPERATION;
    operatorClicked = true;
}

- (IBAction)clearCurrentButton:(UIButton *)sender {
    [displayNumber setString: @""];
    [self updateDisplay];
}

- (void) operatorClicked: (operation *) operationClicked {
    if ((lastOperation != NOOPERATION) && (!lastButtonWasEquals)) {
        currentValue = [NSDecimalNumber decimalNumberWithString: self.displayText.text];
        [self calculateAndDisplayResult];
    }
    
    operatorClicked = true;
    lastOperation = *operationClicked;
    currentResult = [NSDecimalNumber decimalNumberWithString: self.displayText.text];
    lastButtonWasEquals = false;
}

- (void) appendToDisplay: (NSString *)text {
    if (operatorClicked) {
        [displayNumber setString: @""];
        operatorClicked = false;
    }
    
    [displayNumber appendString: text];
    [self updateDisplay];
    lastButtonWasEquals = false;
}

- (void) updateDisplay {
    self.displayText.text = displayNumber;
}

- (void) calculateAndDisplayResult {
    NSDecimalNumber *result = [NSDecimalNumber zero];
    
    if (lastOperation == PLUS) {
        result = [currentResult decimalNumberByAdding: currentValue];
    } else if (lastOperation == MINUS) {
        result = [currentResult decimalNumberBySubtracting: currentValue];
    } else if (lastOperation == MULTIPLY) {
        result = [currentResult decimalNumberByMultiplyingBy: currentValue];
    } else if (lastOperation == DIVIDE) {
        result = [currentResult decimalNumberByDividingBy: currentValue];
    }
    
    self.displayText.text = [result stringValue];
    currentResult = [NSDecimalNumber decimalNumberWithDecimal: [result decimalValue]];
}

@end
