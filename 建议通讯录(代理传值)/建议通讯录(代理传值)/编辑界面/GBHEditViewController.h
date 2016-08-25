//
//  GBHEditViewController.h
//  建议通讯录(代理传值)
//
//  Created by zdzx-008 on 16/8/25.
//  Copyright © 2016年 zdzx-008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GBHContactModel;

typedef void (^EditViewControllerBlock)();

@interface GBHEditViewController : UIViewController

@property (nonatomic,strong) GBHContactModel * c;

/** block */
@property (nonatomic,strong) EditViewControllerBlock block;

@end
