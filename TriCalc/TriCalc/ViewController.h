//
//  ViewController.h
//  TriCalc
//
//  Created by Tr1Fecta on 02/08/2019.
//  Copyright © 2019 Tr1Fecta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>


// METHOD DECLARATIONS
- (IBAction)numButtonAction:(UIButton *)sender;

- (IBAction)operatorKeyButtonAction:(UIButton *)sender;

- (IBAction)clearResultsButton:(UIButton *)sender;

- (IBAction)showResultsButton:(UIButton *)sender;

- (void)addNumToLabel:(NSString *)numString;

- (NSString *)calculate: (int)oldNumber : (int)newNumber;


// PROPERTIES

@property (retain, nonatomic) IBOutlet UILabel *resultsLabel;

@property (retain) NSMutableString* muteString;

@property int previousOperand;

@property int currentOperand;

@property BOOL operatorSelected;

@property (strong, nonatomic) IBOutlet UIButton *plusButton1;
@property (strong, nonatomic) IBOutlet UIButton *minusButton1;
@property (strong, nonatomic) IBOutlet UIButton *multiButton1;
@property (strong, nonatomic) IBOutlet UIButton *deelButton1;

typedef NS_ENUM(NSInteger, OperatorKey) {addition = 10, substraction, multiplication, division, none};

@property (nonatomic, assign) OperatorKey specKey;

@end
