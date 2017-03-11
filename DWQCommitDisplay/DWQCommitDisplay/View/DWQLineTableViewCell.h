//
//  DWQLineTableViewCell.h
//  DWQCommitDisplay
//
//  Created by 杜文全 on 16/11/11.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.

#import <UIKit/UIKit.h>
#import "DWQModel.h"
#import "UIView+SDAutoLayout.h"
@interface DWQLineTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView*)tableView;
@property (nonatomic, strong) DWQModel* model;

@property (nonatomic, copy) void(^showallClickBlock)(NSIndexPath* indexPath);

@end
