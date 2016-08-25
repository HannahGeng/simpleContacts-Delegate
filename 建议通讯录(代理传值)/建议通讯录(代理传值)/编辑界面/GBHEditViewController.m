//
//  GBHEditViewController.m
//  建议通讯录(代理传值)
//
//  Created by zdzx-008 on 16/8/25.
//  Copyright © 2016年 zdzx-008. All rights reserved.
//

#import "GBHEditViewController.h"
#import "GBHContactModel.h"

@interface GBHEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation GBHEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // 设置导航条的标题
    self.title = @"查看/编辑界面";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(edit:)];
    
    _nameField.text = _c.name;
    _phoneField.text = _c.phoneNum;
    
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
}

- (IBAction)save:(id)sender {
    
    _c.name = _nameField.text;
    _c.phoneNum = _phoneField.text;
    
    //让小弟做事情，刷新表格
    if (_block) {
        
        _block();
    }
        
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)edit:(UIBarButtonItem *)item
{
    if ([item.title isEqualToString:@"编辑"]) {
        
        item.title = @"取消";
        
        _nameField.enabled = YES;
        _phoneField.enabled = YES;
        
        [_phoneField becomeFirstResponder];
        
        _saveBtn.hidden = NO;
        
    }else{
        
        item.title = @"编辑";
        
        _saveBtn.hidden = YES;
        
        _nameField.enabled = NO;
        _phoneField.enabled = NO;
        
        _phoneField.text = _c.phoneNum;
        _nameField.text = _c.name;
    }
}

- (void)textChange
{
    _saveBtn.enabled = _nameField.text.length && _phoneField.text.length;
}

@end
