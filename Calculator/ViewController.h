//
//  ViewController.h
//  Calculator
//
//  Created by Ian Cliffe on 13/08/2013.
//  Copyright (c) 2013 Ian Cliffe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum operationTypes
{
    NOOPERATION,
    PLUS,
    MINUS,
    MULTIPLY,
    DIVIDE
} operation;


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *displayText;
- (IBAction)zeroButton:(UIButton *)sender;
- (IBAction)oneButton:(UIButton *)sender;
- (IBAction)twoButton:(UIButton *)sender;
- (IBAction)threeButton:(UIButton *)sender;
- (IBAction)fourButton:(UIButton *)sender;
- (IBAction)fiveButton:(UIButton *)sender;
- (IBAction)sixButton:(UIButton *)sender;
- (IBAction)sevenButton:(UIButton *)sender;
- (IBAction)eightButton:(UIButton *)sender;
- (IBAction)nineButton:(UIButton *)sender;
- (IBAction)decimalButton:(UIButton *)sender;


- (IBAction)clearButton:(UIButton *)sender;
- (IBAction)clearCurrentButton:(UIButton *)sender;

- (IBAction)plusButtonClick:(UIButton *)sender;
- (IBAction)equalsButtonClick:(UIButton *)sender;
- (IBAction)minusButtonClick:(UIButton *)sender;
- (IBAction)divideButtonClick:(UIButton *)sender;
- (IBAction)multipleButtonClick:(UIButton *)sender;

- (void) updateDisplay;
- (void) appendToDisplay: (NSString *)text;
- (void) operatorClicked: (operation *)operationClicked;
- (void) calculateAndDisplayResult;

@end

NSMutableString *displayNumber;
BOOL operatorClicked;
operation lastOperation;
BOOL lastButtonWasEquals;
NSDecimalNumber *currentResult;
NSDecimalNumber *currentValue;



