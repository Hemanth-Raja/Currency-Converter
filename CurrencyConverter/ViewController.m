//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Hemanth Raja on 20/06/18.
//  Copyright © 2018 Hemanth Raja. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController

- (IBAction)buttonTapped:(id)sender {
    self.convertButton.enabled = NO;
    [self.view endEditing:YES];
    
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];

}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies;{
    
    double inputValue = [self.inputField.text floatValue];
    
    double euroValue = inputValue * currencies.EUR;
    double yenValue = inputValue * currencies.JPY;
    double rupeevalue = inputValue * currencies.INR;
    
    NSString *temp = [NSString stringWithFormat:@"%.2f",euroValue];
    NSString *temp1 = [NSString stringWithFormat:@"%.2f",yenValue];
    NSString *temp2 = [NSString stringWithFormat:@"%.2f",rupeevalue];
    
    self.convertButton.enabled = YES;
    self.currencyA.text = temp;
    self.currencyB.text = temp1;
    self.currencyC.text = temp2;
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}



@end
