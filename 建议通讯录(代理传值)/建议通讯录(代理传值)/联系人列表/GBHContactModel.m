//
//  GBHContactModel.m
//  建议通讯录(代理传值)
//
//  Created by zdzx-008 on 16/8/25.
//  Copyright © 2016年 zdzx-008. All rights reserved.
//

#import "GBHContactModel.h"

@implementation GBHContactModel

static NSString * namekey = @"name";
static NSString * phoneKye = @"phone";

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:namekey];
    [aCoder encodeObject:_phoneNum forKey:phoneKye];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:namekey];
        _phoneNum = [aDecoder decodeObjectForKey:phoneKye];
    }
    
    return self;
}

+ (instancetype)contactWithName:(NSString *)name phoneNum:(NSString *)phoneNum
{
    GBHContactModel * contact = [[self alloc] init];
    
    contact.name = name;
    contact.phoneNum = phoneNum;
    
    return contact;
}

@end
