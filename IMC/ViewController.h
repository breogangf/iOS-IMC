//
//  ViewController.h
//  IMC
//
//  Created by Breogán González Fernández on 30/4/15.
//  Copyright (c) 2015 SetPay. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *TextFieldWeight;

@property (strong, nonatomic) IBOutlet UITextField *TextFieldHeight;

@property (strong, nonatomic) IBOutlet UILabel *LabelResult;

@property (strong, nonatomic) IBOutlet UIButton *ButtonCalculate;


@end

