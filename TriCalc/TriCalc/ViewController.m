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

typedef NS_ENUM(NSInteger, operatorKey) {addition = 10, substraction, multiplication, division, none};
enum operatorKey specKey;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.muteString = [NSMutableString new];
    self.previousOperand = [NSString new];
    self.currentOperand = [NSString new];
}

// Check which button is pressed by checking the titleLabel

- (IBAction)numButtonAction:(UIButton *)sender {
    self.plusButton1.backgroundColor = [UIColor lightGrayColor];
    self.minusButton1.backgroundColor = [UIColor lightGrayColor];
    self.multiButton1.backgroundColor = [UIColor lightGrayColor];
    self.deelButton1.backgroundColor = [UIColor lightGrayColor];
    
    [self addNumToLabel:sender.titleLabel.text];
    if (self.operatorSelected == YES) {
        self.currentOperand = self.resultsLabel.text;
    }
    else {
        self.previousOperand = self.resultsLabel.text;
        
    }
}


// Check which specialKey is pressed by checking the titleLabel
- (IBAction)operatorKeyButtonAction:(UIButton *)sender {
    if (sender.backgroundColor == [UIColor redColor]) { // Check if selected
        self.operatorSelected = NO;
        specKey = none;
        sender.backgroundColor = [UIColor lightGrayColor];
    }
    else { // If not selected check which button is pressed and set the specKey
        specKey = sender.tag;
        self.operatorSelected = YES;
        [sender setBackgroundColor:[UIColor redColor]];
        self.resultsLabel.text = @"";
        [self.muteString setString:@""];
    }
}


- (NSString *)calculate:(NSInteger)specialKey : (NSString *)oldNumber :(NSString *)newNumber {
    int oldsNumber = [oldNumber intValue];
    int newssNumber = [newNumber intValue];
    NSNumber* result;
    
    if (specKey == addition) {
        result = [NSNumber numberWithInt:oldsNumber+newssNumber];
    }
    else if (specKey == substraction) {
        result = [NSNumber numberWithInt:oldsNumber-newssNumber];
        
    }
    else if (specKey == multiplication) {
        result = [NSNumber numberWithInt:oldsNumber*newssNumber];
        
    }
    else if (specKey == division) {
        float oldsNumber = [oldNumber doubleValue];
        float newssNumber = [newNumber doubleValue];
        result = [NSNumber numberWithFloat:oldsNumber/newssNumber];
    }
    else {
        return @"ERROR";
    }
    
    return [result stringValue];
}


- (IBAction)showResultsButton:(UIButton *)sender {
    NSString* results = [self calculate:specKey :self.previousOperand :self.currentOperand];
    self.resultsLabel.text = results;
    self.previousOperand = nil;
    self.currentOperand = nil;
    self.operatorSelected = NO;
    specKey = none;
    [self.muteString setString:@""];
    
}

- (void) addNumToLabel:(NSString *)numString {
    [self.muteString appendFormat:@"%@", numString];
    _resultsLabel.text = self.muteString;
}


- (IBAction)clearResultsButton:(UIButton *)sender {
    self.operatorSelected = NO;
    _resultsLabel.text = @"";
    [self.muteString setString:@""];
    self.previousOperand = nil;
    self.currentOperand = nil;
    specKey = none;
}


@end



