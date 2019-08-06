//
//  ViewController.m
//  TriCalc
//
//  Created by Tr1Fecta on 02/08/2019.
//  Copyright © 2019 Tr1Fecta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController



//enum operatorKey specKey;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.muteString = [NSMutableString new];
}

// Check which button is pressed by checking the titleLabel

- (IBAction)numButtonAction:(UIButton *)sender {
    self.plusButton1.backgroundColor = [UIColor lightGrayColor];
    self.minusButton1.backgroundColor = [UIColor lightGrayColor];
    self.multiButton1.backgroundColor = [UIColor lightGrayColor];
    self.deelButton1.backgroundColor = [UIColor lightGrayColor];
    
    [self addNumToLabel:sender.titleLabel.text];
    if (self.operatorSelected == YES) {
        self.currentOperand = self.currentOperand * 10 + (int)sender.tag;
    }
    else {
        self.previousOperand = self.previousOperand * 10 + (int)sender.tag;
        
    }
}

// Check which specialKey is pressed by checking the titleLabel
- (IBAction)operatorKeyButtonAction:(UIButton *)sender {
    if (sender.backgroundColor == [UIColor redColor]) { // Check if selected
        self.operatorSelected = NO;
        self.specKey = none;
        sender.backgroundColor = [UIColor lightGrayColor];
    }
    else { // If not selected check which button is pressed and set the specKey
        self.specKey = sender.tag;
        self.operatorSelected = YES;
        [sender setBackgroundColor:[UIColor redColor]];
        self.resultsLabel.text = @"";
        [self.muteString setString:@""];
    }
}


- (NSString *)calculate:(int)oldNumber :(int)newNumber {
    NSNumber* result;
    float oldsNumber = oldNumber;
    float newssNumber = newNumber;
    
    switch(self.specKey) {
        case addition:
            result = [NSNumber numberWithInt:oldNumber+newNumber];
            break;
        case substraction:
            result = [NSNumber numberWithInt:oldNumber-newNumber];
            break;
        case multiplication:
            result = [NSNumber numberWithInt:oldNumber*newNumber];
            break;
        case division:
            result = [NSNumber numberWithFloat:oldsNumber/newssNumber];
            break;
        default:
            return @"ERROR";
            break;
    }
    return [result stringValue];
}


- (IBAction)showResultsButton:(UIButton *)sender {
    NSString* results = [self calculate: self.previousOperand :self.currentOperand];
    self.resultsLabel.text = results;
    
    // reset values
    self.previousOperand = 0;
    self.currentOperand = 0;
    self.operatorSelected = NO;
    self.specKey = none;
    [self.muteString setString:@""];
    
}

- (void) addNumToLabel:(NSString *)numString {
    [self.muteString appendFormat:@"%@", numString];
    self.resultsLabel.text = self.muteString;
}


- (IBAction)clearResultsButton:(UIButton *)sender {
    self.operatorSelected = NO;
    self.resultsLabel.text = @"";
    [self.muteString setString:@""];
    self.previousOperand = 0;
    self.currentOperand = 0;
    self.specKey = none;
}


@end
