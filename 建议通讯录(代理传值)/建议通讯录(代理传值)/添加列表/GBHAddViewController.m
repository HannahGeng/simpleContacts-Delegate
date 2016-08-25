//
//  GBHAddViewController.m
//  建议通讯录(代理传值)
//
//  Created by zdzx-008 on 16/8/25.
//  Copyright © 2016年 zdzx-008. All rights reserved.
//

#import "GBHAddViewController.h"
#import "GBHContactModel.h"

@interface GBHAddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation GBHAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_nameField becomeFirstResponder];
}

//逆传
- (IBAction)add:(id)sender {
    
    GBHContactModel * c = [GBHContactModel contactWithName:_nameField.text phoneNum:_phoneField.text];
    
    [_delegate addViewClickBtnWithController:self withModel:c];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textChange
{
    _addBtn.enabled = _nameField.text.length && _phoneField.text.length;
}

@end
