//
//  DWQImageContentView.h
//  DWQCommitDisplay
//
//  Created by 杜文全 on 16/11/11.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.

#import <UIKit/UIKit.h>
#import "DWQModel.h"
@interface TimeImageContentView : UIView
@property (nonatomic, strong) UIImageView* lastImageView;
@property (nonatomic, strong) NSArray* imageArray;
@property (nonatomic, strong) ContentImageModel* singleImage;
@end
