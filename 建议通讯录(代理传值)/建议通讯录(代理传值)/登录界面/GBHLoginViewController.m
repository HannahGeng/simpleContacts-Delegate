//
//  GBHLoginViewController.m
//  建议通讯录(代理传值)
//
//  Created by zdzx-008 on 16/8/24.
//  Copyright © 2016年 zdzx-008. All rights reserved.
//

#import "GBHLoginViewController.h"

@interface GBHLoginViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UISwitch *rmbPassSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation GBHLoginViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController * vc = segue.destinationViewController;
    
    vc.title = [NSString stringWithFormat:@"%@的联系人列表",_accountField.text];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [_passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
}

- (IBAction)rmbPassChange:(id)sender {

    if (_rmbPassSwitch.on == NO) {
        
        _autoLoginSwitch.on = NO;
    }
}

- (IBAction)autoLoginChange:(id)sender {

    if (_autoLoginSwitch.on == YES) {
        
        _rmbPassSwitch.on = YES;
    }
}

- (IBAction)login:(id)sender {

    if ([_accountField.text  isEqual: @"gbh"] && [_passwordField.text  isEqual: @"123"]) {
        
        [self performSegueWithIdentifier:@"login2contact" sender:nil];
        
    }else{
        
        NSLog(@"输入错误");
    }
    
}

- (void)textChange
{
    _loginBtn.enabled = _accountField.text.length && _passwordField.text.length;

}

@end
