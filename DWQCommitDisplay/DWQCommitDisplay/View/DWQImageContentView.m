//
//  DWQImageContentView.m
//  DWQCommitDisplay
//
//  Created by 杜文全 on 16/11/11.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.

#import "DWQImageContentView.h"
#import "Masonry.h"
#import "UIView+SDAutoLayout.h"
#import "SDPhotoBrowser.h"
#import "UIImageView+WebCache.h"
@interface TimeImageContentView () <SDPhotoBrowserDelegate>
@property (nonatomic, strong) NSMutableArray* imageViewArray;
@property (nonatomic, strong) UIImageView* singleImageView;
@property (nonatomic, assign) BOOL isSingle;
@end
@implementation TimeImageContentView


- (NSMutableArray *)imageViewArray
{
    if (!_imageViewArray) {
        _imageViewArray = [NSMutableArray new];
    }
    return _imageViewArray;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupMain];
    }
    return self;
}


-(void)setupMain{
    NSInteger numberOfCols = 3;
    CGFloat pading = 5;
    
    
    for (NSInteger i = 0 ; i < 9 ; i ++) {
        NSInteger col = i % numberOfCols;

        UIImageView* imageView = [[UIImageView alloc] init];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(watchPic:)]];
        [self addSubview:imageView];
        
        if (i == 0) {
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.top.mas_equalTo(0);
                make.width.mas_equalTo(self.mas_width).multipliedBy(0.333).offset(-pading);
                make.height.mas_equalTo(imageView.mas_width);
            }];
        }else{
            if (col == 0 ) {
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(0);
                    make.top.mas_equalTo(self.lastImageView.mas_bottom).offset(pading);
                    make.width.mas_equalTo(self.mas_width).multipliedBy(0.333).offset(-pading);
                    make.height.mas_equalTo(imageView.mas_width);
                }];
            }else {
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(self.lastImageView.mas_right).offset(pading);
                    make.top.mas_equalTo(self.lastImageView);
                    make.width.mas_equalTo(self.mas_width).multipliedBy(0.333).offset(-pading);
                    make.height.mas_equalTo(imageView.mas_width);
                }];
            }
        }
        self.lastImageView = imageView;
        [self.imageViewArray addObject:imageView];
    }
    
    
    UIImageView* singleImageView = [[UIImageView alloc] init];
    self.singleImageView = singleImageView;
    [self addSubview:singleImageView];
    [singleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    singleImageView.userInteractionEnabled = YES;
     [singleImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(watchPic:)]];
}


-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    
    if (imageArray.count == 1) {
        ContentImageModel* imageModel = [imageArray firstObject];
        self.singleImage = imageModel;
        return;
    }
    
    self.singleImageView.hidden = YES;
    if (imageArray.count == 0) {
        [self clearAutoHeigtSettings];
        self.fixedHeight = @0;
        
        for (UIImageView* view in self.imageViewArray) {
            view.hidden = YES;
        }
        
    }else if(imageArray.count != 1){
        [self clearAutoHeigtSettings];
        
    for (NSInteger i = 0 ; i < 9 ; i ++) {
        UIImageView* imageView = self.imageViewArray[i];
        if (i < imageArray.count) {
            ContentImageModel* imageModel = self.imageArray[i];
//            [imageView setImage:[UIImage imageNamed:imageArray[i]]];
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageModel.imageUrl] placeholderImage:[UIImage imageNamed:@"placeHolder.jpg"]];
            imageView.hidden = NO;
            self.lastImageView = imageView;
        }else{
            imageView.hidden = YES;
        }
    }
    
    [self setupAutoHeightWithBottomView:self.lastImageView bottomMargin:10];
    }
}

-(void)setSingleImage:(ContentImageModel *)singleImage{
    _singleImage = singleImage;
    self.singleImageView.hidden = NO;
    for (UIImageView* view in self.imageViewArray) {
        view.hidden = YES;
    }
    [self.singleImageView sd_setImageWithURL:[NSURL URLWithString:singleImage.imageUrl] placeholderImage:[UIImage imageNamed:@"pic8.jpg"]];
    CGFloat width = 200;
    CGFloat scale = singleImage.width / singleImage.height;
    CGFloat height = width / scale;
    
    [self.singleImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(height);
    }];
    
    [self setupAutoHeightWithBottomView:self.singleImageView bottomMargin:10];
    
}
-(void)watchPic:(UITapGestureRecognizer*)gr{
    UIImageView* imageView = (UIImageView*)[gr view];
    SDPhotoBrowser* photoBrowser =[[SDPhotoBrowser alloc] init];
    photoBrowser.sourceImagesContainerView = self;
    photoBrowser.delegate = self;
    NSInteger index = 0;
    if (imageView == self.singleImageView) {
        photoBrowser.imageCount = 1;
        self.isSingle = YES;
    }else{
        self.isSingle = NO;
        index = [self.imageViewArray indexOfObject:imageView];
        photoBrowser.imageCount = self.imageArray.count;
    }
    photoBrowser.currentImageIndex = index;

    [photoBrowser show];
}

#pragma mark SDPhotoBrowserDelegate
-(UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index{
    return [UIImage imageNamed:@"placeHolder.jpg"];
}
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    if (self.isSingle) {
        return [NSURL URLWithString:self.singleImage.imageUrl];
    }else{
        ContentImageModel* imageModel = self.imageArray[index];
        return [NSURL URLWithString:imageModel.imageUrl];
    }
}
@end
