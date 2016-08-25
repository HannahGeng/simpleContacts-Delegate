//
//  GBHContactModel.m
//  建议通讯录(代理传值)
//
//  Created by zdzx-008 on 16/8/25.
//  Copyright © 2016年 zdzx-008. All rights reserved.
//

#import "GBHContactModel.h"

@implementation GBHContactModel

+ (instancetype)contactWithName:(NSString *)name phoneNum:(NSString *)phoneNum
{
    GBHContactModel * contact = [[self alloc] init];
    
    contact.name = name;
    contact.phoneNum = phoneNum;
    
    return contact;
}

@end
