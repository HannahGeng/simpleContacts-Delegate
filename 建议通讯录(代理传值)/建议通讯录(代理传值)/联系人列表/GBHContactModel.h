//
//  GBHContactModel.h
//  建议通讯录(代理传值)
//
//  Created by zdzx-008 on 16/8/25.
//  Copyright © 2016年 zdzx-008. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBHContactModel : NSObject<NSCoding>

/** name */
@property (nonatomic,strong) NSString * name;

/** phone */
@property (nonatomic,strong) NSString * phoneNum;

+ (instancetype)contactWithName:(NSString *)name phoneNum:(NSString *)phoneNum;

@end
