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
    
    //取出之前存储的密码
    _rmbPassSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"rmbSwitch"];
    
    _autoLoginSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"autoSwitch"];
    
    _accountField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"account"];

    if (_rmbPassSwitch.on == YES) {
        
        _passwordField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];

    }
    
    if (_autoLoginSwitch.on == YES) {
        
        [self login:nil];
    }
    
    
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
        
        //存储用户名和密码
        [[NSUserDefaults standardUserDefaults] setObject:_accountField.text forKey:@"account"];
        
        [[NSUserDefaults standardUserDefaults] setObject:_passwordField.text forKey:@"password"];
        
        [[NSUserDefaults standardUserDefaults] setBool:_rmbPassSwitch.on forKey:@"rmbSwitch"];
        
        [[NSUserDefaults standardUserDefaults] setBool:_autoLoginSwitch.on forKey:@"autoSwitch"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
            
        
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
