//
//  GBHAddViewController.h
//  建议通讯录(代理传值)
//
//  Created by zdzx-008 on 16/8/25.
//  Copyright © 2016年 zdzx-008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GBHContactModel,GBHAddViewController;

@protocol GBHAddViewControllerDelegate <NSObject>

@optional

- (void)addViewClickBtnWithController:(GBHAddViewController *)addViewcontroller withModel:(GBHContactModel *)contact;

@end

@interface GBHAddViewController : UIViewController

/** delegate */
@property (nonatomic,strong) id <GBHAddViewControllerDelegate> delegate;

@end
