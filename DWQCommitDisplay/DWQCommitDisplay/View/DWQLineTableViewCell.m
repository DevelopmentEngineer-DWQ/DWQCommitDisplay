//
//  DWQLineTableViewCell.m
//  DWQCommitDisplay
//
//  Created by 杜文全 on 16/11/11.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.

#import "DWQLineTableViewCell.h"
#import "Masonry.h"
#import "DWQImageContentView.h"
#import "UIImageView+WebCache.h"
#define color(r,g,b)     [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
CGFloat max_content_height;
@interface DWQLineTableViewCell ()
@property (nonatomic, weak) UIImageView* iconImageView;
@property (nonatomic, weak) UILabel* nameLB;
@property (nonatomic, weak) UILabel* contentLB;
@property (nonatomic, weak) UIButton* showAllButton;
@property (nonatomic, weak) TimeImageContentView* imageContentView;
@property (nonatomic, weak) UILabel* distanceLB;
@property (nonatomic, weak) UILabel* timeLB;
@property (nonatomic, weak) UIButton* likeButton;
@property (nonatomic, weak) UIButton* commentButton;
@end
@implementation DWQLineTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString* const identifier = @"timeLine";
    DWQLineTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DWQLineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupMain];
    }
    
    return self;
}

-(void)setupMain{
    UIImageView* iconImageView = [[UIImageView alloc] init];
    self.iconImageView = iconImageView;
    [self.contentView addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    
    UILabel* nameLB = [[UILabel alloc] init];
    self.nameLB = nameLB;
    nameLB.font = [UIFont boldSystemFontOfSize:17];
    nameLB.textColor = color(115, 115, 115);
    [self.contentView addSubview:nameLB];
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(iconImageView.mas_right).offset(8);
        make.top.mas_equalTo(iconImageView);
    }];
    
    UILabel* contentLB = [[UILabel alloc] init];
    self.contentLB = contentLB;
    contentLB.font = [UIFont systemFontOfSize:14];
    contentLB.textColor = color(115, 115, 115);
    contentLB.numberOfLines = 4;
    [self.contentView addSubview:contentLB];
    [contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(nameLB);
        make.top.mas_equalTo(nameLB.mas_bottom).offset(0);
        make.right.mas_equalTo(-8);
    }];
    max_content_height = contentLB.font.lineHeight * 4;
    
    UIButton* showAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.showAllButton = showAllButton;
    [showAllButton addTarget:self action:@selector(showAll:) forControlEvents:UIControlEventTouchUpInside];
    [showAllButton setTitleColor:color(71, 95, 143) forState:UIControlStateNormal];
    [self.contentView addSubview:showAllButton];
    showAllButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [showAllButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(contentLB.mas_bottom).offset(0);
    }];
    
    TimeImageContentView* imageConetntView = [[TimeImageContentView alloc] init];
    self.imageContentView = imageConetntView;
    [self.contentView addSubview:imageConetntView];
    imageConetntView.sd_layout
    .leftEqualToView(contentLB)
    .topSpaceToView(showAllButton,5)
    .rightSpaceToView(self.contentView,80)
    .autoHeightRatio(0);
    
    
//    UILabel* distanceLB = [[UILabel alloc] init];
//    self.distanceLB = distanceLB;
//    distanceLB.font = [UIFont boldSystemFontOfSize:14];
//    distanceLB.textColor = contentLB.textColor;
//    [self.contentView addSubview:distanceLB];
//   distanceLB.sd_layout
//    .leftEqualToView(imageConetntView)
//    .topSpaceToView(imageConetntView,5)
//    .widthIs(180)
//    .heightIs(20);
    
    
    UILabel* timeLB = [[UILabel alloc] init];
    self.timeLB = timeLB;
    timeLB.font = [UIFont boldSystemFontOfSize:14];
    timeLB.textColor = contentLB.textColor;
    [self.contentView addSubview:timeLB];
    timeLB.sd_layout
    .leftEqualToView(imageConetntView)
    .topSpaceToView(imageConetntView,5)
    .widthIs(180)
    .heightIs(20);
    
    /*
     .leftSpaceToView(distanceLB,10)
     .topEqualToView(distanceLB)
     .widthIs(100)
     .heightIs(20);
     
     */
//    
//    UIButton* commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.commentButton  =commentButton;
//    commentButton.titleLabel.font = [UIFont systemFontOfSize:13];
//    commentButton.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
//    [commentButton setTitleColor:contentLB.textColor forState:UIControlStateNormal];
//    [commentButton setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
//    [commentButton addTarget:self action:@selector(commentClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.contentView addSubview:commentButton];
//    commentButton.sd_layout
//    .rightSpaceToView(self.contentView,20)
//    .centerYEqualToView(timeLB)
//    .widthIs(45)
//    .heightIs(15);
//    
    
    UIButton* likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likeButton  =likeButton;
    likeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    likeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    [likeButton setTitleColor:contentLB.textColor forState:UIControlStateNormal];
    [likeButton setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
    [self.contentView addSubview:likeButton];
    [likeButton addTarget:self action:@selector(likeClick) forControlEvents:UIControlEventTouchUpInside];
    [likeButton setImage:[UIImage imageNamed:@"btn_collect_selected"] forState:UIControlStateSelected];
    likeButton.sd_layout
    .rightSpaceToView(self.contentView,20)
    .centerYEqualToView(timeLB)
    .widthIs(45)
    .heightIs(15);

    /*
     likeButton.sd_layout
     .rightSpaceToView(commentButton,10)
     .centerYEqualToView(timeLB)
     .widthIs(45)
     .heightIs(15);
     
     */
    
    [self setupAutoHeightWithBottomView:timeLB bottomMargin:10];

}
-(void)setModel:(DWQModel *)model{
    _model = model;
    
    [self.iconImageView setImage:[UIImage imageNamed:model.icon]];
    
    self.nameLB.text = model.name;
    
    self.contentLB.text = model.contentText;
    
    
    self.showAllButton.hidden = model.shouldShowAllButton;
    
    self.contentLB.numberOfLines = model.isShowAll ? 0: 4;
    
    [self.showAllButton setTitle:self.model.isShowAll ? @"收起":@"全文" forState:UIControlStateNormal];
    
    
    self.imageContentView.imageArray = model.imageArray;
    
    self.distanceLB.text = [NSString stringWithFormat:@"%.2f KM",model.distance];
    [self.distanceLB sizeToFit];
    
    self.timeLB.text = model.time;
    [self.timeLB sizeToFit];
    
    
    [self.likeButton setTitle:[NSString stringWithFormat:@"%zd",model.likeCount] forState:UIControlStateNormal];
    
    [self.commentButton setTitle:[NSString stringWithFormat:@"%zd",model.commentCount] forState:UIControlStateNormal];
    
    self.likeButton.selected = model.isLiked;
}
#pragma mark action
-(void)showAll:(UIButton*)button{
    NSLog(@"%s",__func__);
    self.model.isShowAll = !self.model.isShowAll;
    
    [self.showAllButton setTitle:self.model.isShowAll ? @"收起":@"全文" forState:UIControlStateNormal];
    
    self.showallClickBlock(self.sd_indexPath);
    


}

-(void)commentClick{
    NSLog(@"%s",__func__);
    
    
    
}

-(void)likeClick{
    NSLog(@"%s",__func__);
    
    self.likeButton.selected = !self.likeButton.selected;
    if (self.likeButton.selected) {
        self.model.likeCount ++;
        [self likeAnimation];
        self.model.isLiked = YES;
    }else{
        self.model.likeCount --;
        self.model.isLiked = NO;
    }
    [self.likeButton setTitle:[NSString stringWithFormat:@"%zd",self.model.likeCount] forState:UIControlStateNormal];
}
-(void)likeAnimation{
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_collect_selected"]];
    [self.contentView addSubview:imageView];
    imageView.frame = CGRectMake(self.likeButton.frame.origin.x, self.likeButton.frame.origin.y, 15, 15);
    [UIView animateWithDuration:0.5 animations:^{
        imageView.transform = CGAffineTransformScale(imageView.transform, 8, 8);
        imageView.alpha = 0;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}
@end
