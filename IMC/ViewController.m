//
//  ViewController.m
//  IMC
//
//  Created by Breogán González Fernández on 30/4/15.
//  Copyright (c) 2015 SetPay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateIMC:(id)sender {
    
    //FORMULA: masa(kg) / estatura²(m)
    
    //////////////////////////////////////////////////////////////////////////
    //                                                                      //
    // Clasificación	                      IMC (kg/m²)                   //
    //                       Valores principales	    Valores adicionales //
    // Bajo peso                   <18,50	                 <18,50         //
    //    Delgadez severa          <16,00	                 <16,00         //
    //    Delgadez moderada     16,00 - 16,99             16,00 - 16,99     //
    //    Delgadez leve	        17,00 - 18,49	          17,00 - 18,49     //
    //                                                                      //
    // Normal	                18,50 - 24,99	          18,50 - 22,99     //
    //                                                    23,00 - 24,99     //
    //                                                                      //
    // Sobrepeso	               ≥25,00	                 ≥25,00         //
    //    Preobeso	            25,00 - 29,99	          25,00 - 27,49     //
    //                                                    27,50 - 29,99     //
    // Obesidad	                  ≥30,00	                 ≥30,00         //
    //    Obesidad leve	       30,00 - 34,99	          30,00 - 32,49     //
    //                                                    32,50 - 34,99     //
    //    Obesidad media	   35,00 - 39,99	          35,00 - 37,49     //
    //                                                    37,50 - 39,99     //
    //    Obesidad mórbida	      ≥40,00	                 ≥40,00         //
    //                                                                      //
    //////////////////////////////////////////////////////////////////////////
    
    
    float weighValue = [self.TextFieldWeight.text floatValue];
    float heighValue = [self.TextFieldHeight.text floatValue];
    
    float result = (weighValue / (heighValue*heighValue));
    
    self.LabelResult.text = [NSString stringWithFormat:@"%.2f", result];
    
    NSString *title;
    NSString *message;
    
    if(result < 16.00){
        title = @"Delgadez severa";
        message = @"debes comer mucho más macho";
    }
    else if(result >= 16.00 && result <= 16.99){
        title = @"Delgadez moderada";
        message = @"debes comer más macho";
    }
    else if(result >= 17.00 && result <= 18.49){
        title = @"Delgadez leve";
        message = @"debes comer un poco más";
    }
    else if(result >= 18.50 && result <= 24.99){
        title = @"Normal";
        message = @"Psché";
    }
    else if(result >= 30.00 && result <= 34.99){
        title = @"Obesidad leve";
        message = @"Mirate de perfil";
    }
    else if(result >= 35.00 && result <= 39.99){
        title = @"Obesidad media";
        message = @"Cajondiola eres unha bola!";
    }
    else if(result >= 40){
        title = @"Obesidad mórbida";
        message = @"Xa podes rodar!";
    }
    
    
    NSLog(@"%@", [NSString stringWithFormat:@"%@%@", @"Titulo: ", title]);
    NSLog(@"%@", [NSString stringWithFormat:@"%@%@", @"Mensaje: ", message]);
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    [self.view endEditing:YES];
}

-(void)dismissKeyboard {
    [self.TextFieldWeight resignFirstResponder];
    [self.TextFieldHeight resignFirstResponder];
}




@end
