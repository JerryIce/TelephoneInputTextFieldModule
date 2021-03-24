//
//  YZWViewController.m
//  JITelephoneInputTextField
//
//  Created by jerryelectricity@me.com on 03/24/2021.
//  Copyright (c) 2021 jerryelectricity@me.com. All rights reserved.
//

#import "YZWViewController.h"
#import "JITelephoneInputTextField.h"

@interface YZWViewController ()<UITextFieldDelegate>

@end

@implementation YZWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    JITelephoneInputTextField *telInputTextField = [[JITelephoneInputTextField alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame) - 270)/2, 200, 270, 30)];
    //    设置模式
    telInputTextField.numShowMode = JITelephoneInputTextField_numShowMode_344;
    telInputTextField.openFirstNumLimit = YES;
    telInputTextField.firstNum = 1;
    telInputTextField.delegate = self;
    [self.view addSubview:telInputTextField];
    
}

//MARK: - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if([textField isKindOfClass:JITelephoneInputTextField.class]){
        JITelephoneInputTextField *field = (JITelephoneInputTextField*)textField;
        return [field telephoneTextFieldShouldChangeCharactersInRange:range withValueString:string];
    }else{
        return YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
