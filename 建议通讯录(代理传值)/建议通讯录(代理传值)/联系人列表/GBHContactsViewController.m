//
//  GBHContactsViewController.m
//  建议通讯录(代理传值)
//
//  Created by zdzx-008 on 16/8/24.
//  Copyright © 2016年 zdzx-008. All rights reserved.
//

#import "GBHContactsViewController.h"
#import "GBHContactModel.h"
#import "GBHAddViewController.h"

@interface GBHContactsViewController ()<GBHAddViewControllerDelegate>

@property (nonatomic,strong) NSMutableArray * contacts;

@end

@implementation GBHContactsViewController

- (NSMutableArray *)contacts
{
    if(_contacts == nil){
        
        _contacts = [NSMutableArray array];
    }
    
    return _contacts;
}

//跳转之前调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    GBHAddViewController * add = segue.destinationViewController;
    
    add.delegate = self;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    GBHContactModel * c = self.contacts[indexPath.row];
    
    cell.textLabel.text = c.name;
    cell.detailTextLabel.text = c.phoneNum;
    
    return cell;
}

- (IBAction)logout:(id)sender {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否注销?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
}

// 点击UIActionSheet控件上的按钮调用
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) { // 点击了注销
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    
}

- (void)addViewClickBtnWithController:(GBHAddViewController *)addViewcontroller withModel:(GBHContactModel *)contact
{
    [self.contacts addObject:contact];
    
    [self.tableView reloadData];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

@end
