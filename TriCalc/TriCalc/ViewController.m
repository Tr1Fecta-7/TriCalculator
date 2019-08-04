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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.muteString = [NSMutableString new];
    self.specialKey = [NSString new];
    self.oldNumber = [NSString new];
    self.newsNumber = [NSString new];
}

// Check which button is pressed by checking the titleLabel

- (IBAction)numButtonAction:(UIButton *)sender {
    _plusButton1.backgroundColor = [UIColor lightGrayColor];
    _minusButton1.backgroundColor = [UIColor lightGrayColor];
    _multiButton1.backgroundColor = [UIColor lightGrayColor];
    _deelButton1.backgroundColor = [UIColor lightGrayColor];
    
    [self addNumToLabel:sender.titleLabel.text];
    if (self.specialSelected == YES) {
        self.newsNumber = self.resultsLabel.text;
    }
    else {
        self.oldNumber = self.resultsLabel.text;
    }
}


// Check which specialKey is pressed by checking the titleLabel
- (IBAction)specialKeyButtonAction:(UIButton *)sender {
    if (sender.backgroundColor == [UIColor redColor]) { // Check if selected
        self.specialSelected = NO;
        self.specialKey = @"";
        sender.backgroundColor = [UIColor lightGrayColor];
    }
    else { // If not selected check which button is pressed and set the specKey
        self.specialKey = sender.titleLabel.text;
        self.specialSelected = YES;
        [sender setBackgroundColor:[UIColor redColor]];
        self.resultsLabel.text = @"";
        [self.muteString setString:@""];
    }
}


- (NSString *)calculate:(NSString *)specialKey : (NSString *)oldNumber :(NSString *)newNumber {
    int oldsNumber = [oldNumber intValue];
    int newssNumber = [newNumber intValue];
    
    if ([specialKey isEqualToString:@"+"]) {
        NSString* res = [[NSString alloc] initWithFormat:@"%d", oldsNumber+newssNumber];
        return res;
    }
    
    else if ([specialKey isEqualToString:@"-"]) {
        NSString* res = [[NSString alloc] initWithFormat:@"%d", oldsNumber-newssNumber];
        return res;
    }
    
    else if ([specialKey isEqualToString:@"x"]) {
        NSString* res = [[NSString alloc] initWithFormat:@"%d", oldsNumber*newssNumber];
        return res;
    }
    
    else if ([specialKey isEqualToString:@"/"]) {
        float oldsNumber = [oldNumber doubleValue];
        float newssNumber = [newNumber doubleValue];        NSString* res = [[NSString alloc] initWithFormat:@"%f", oldsNumber/newssNumber];
        return res;
    }
    
   return @"ERROR";
    
}


- (IBAction)showResultsButton:(UIButton *)sender {
    NSString* results = [self calculate:self.specialKey :self.oldNumber :self.newsNumber];
    self.resultsLabel.text = results;
    self.oldNumber = 0;
    self.newsNumber = 0;
    self.specialSelected = NO;
    self.specialKey = @"";
    [self.muteString setString:@""];
    
}

- (void) addNumToLabel:(NSString *)numString {
    [self.muteString appendFormat:@"%@", numString];
    _resultsLabel.text = self.muteString;
}


- (IBAction)clearResultsButton:(UIButton *)sender {
    self.specialSelected = NO;
    _resultsLabel.text = @"";
    [self.muteString setString:@""];
    self.oldNumber = 0;
    self.newsNumber = 0;
    self.specialKey = @"";
}


@end



