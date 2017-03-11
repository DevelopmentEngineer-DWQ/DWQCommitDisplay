//
//  DWQModel.m
//  DWQCommitDisplay
//
//  Created by 杜文全 on 16/11/11.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.

#import "DWQModel.h"
extern CGFloat max_content_height;
@implementation DWQModel
+(NSArray*)models{
    
    NSArray* nameArray = @[@"杜文全",@"翟瑞斌",@"柏松",@"王尧",@"沈诚诚",@"朱明路",@"王琳琳",@"刘雪",@"王红",@"袁丽君"];
    
    NSArray* contentArray = @[@"人工智能（Artificial Intelligence），英文缩写为AI。它是研究、开发用于模拟、延伸和扩展人的智能的理论、方法、技术及应用系统的一门新的技术科学。",
                              @"人工智能是对人的意识、思维的信息过程的模拟。",
                              @"人工智能不是人的智能，但能像人那样思考、也可能超过人的智能。",
                              @"人工智能是一门极富挑战性的科学，从事这项工作的人必须懂得计算机知识，心理学和哲学。人工智能是包括十分广泛的科学，它由不同的领域组成，如机器学习，计算机视觉等等，",
                              @"人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出一种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。人工智能从诞生以来，理论和技术日益成熟，应用领域也不断扩大，可以设想，未来人工智能带来的科技产品，将会是人类智慧的“容器”。",
                              @"人工智能在计算机领域内，得到了愈加广泛的重视。并在机器人，经济政治决策，控制系统，仿真系统中得到应用。",
                              @"人工智能是计算机学科的一个分支，二十世纪七十年代以来被称为世界三大尖端技术之一（空间技术、能源技术、人工智能）。"];
    
    NSArray <ContentImageModel*>* contentImageArray = [self getContentImageArray];
    
    NSArray* distanceArray = @[@123.5,@22.1,@666.6,@111.1,@653.2,@90.9,@110,@11,@80.80,@88.88];
    
    NSArray* timeArray = @[@"2015-2-11",@"2015-2-12",@"2015-2-13",@"2015-4-11",@"2015-5-1",@"2015-6-8",@"2015-8-11",@"2015-9-21"];
    
    NSArray* likeCountArray = @[@20,@10,@0,@100,@22,@33,@8];
    NSArray* commmentCountArray = @[@20,@10,@0,@100,@22,@33,@8];
    NSMutableArray* array = [NSMutableArray array];
    for (NSInteger i = 0 ; i < 10; i ++) {
        DWQModel* m1 = [[DWQModel alloc] init];
        m1.name = nameArray[arc4random_uniform(10)];
        m1.icon = [NSString stringWithFormat:@"%zd.jpg",arc4random_uniform(23)];
        m1.contentText = contentArray[arc4random_uniform(7)];
    
        NSInteger imageCount = arc4random_uniform(8);
        NSMutableArray* images = [NSMutableArray array];
        for (NSInteger i = 0;  i < imageCount; i++) {
            ContentImageModel* image = contentImageArray[arc4random_uniform(8)];
            [images addObject:image];
        }
        m1.imageArray = images;
        m1.distance = [distanceArray[arc4random_uniform(10)] floatValue];
        m1.time = timeArray[arc4random_uniform(8)];
        m1.isShowAll = NO;
        m1.likeCount = [likeCountArray[arc4random_uniform(7)] integerValue];
        m1.commentCount = [commmentCountArray[arc4random_uniform(7)] integerValue];
        [array addObject:m1];
    }
    
    return array;
}
+(NSArray <ContentImageModel*>*)getContentImageArray{
    ContentImageModel* m1 = [[ContentImageModel alloc] init];
    m1.imageUrl = @"http://ci.xiaohongshu.com/104f6fbd-ddff-4c20-8dba-fd361ace8fde@r_1280w_1280h.jpg";
    m1.width = 530;
    m1.height = 400;
    
    ContentImageModel* m2 = [[ContentImageModel alloc] init];
    m2.imageUrl = @"http://ci.xiaohongshu.com/94ae1db9-fd04-4f37-b35b-7fa6ddb0d62a@r_1280w_1280h.jpg";
    m2.width = 275;
    m2.height = 365;
    
    ContentImageModel* m3 = [[ContentImageModel alloc] init];
    m3.imageUrl = @"http://ci.xiaohongshu.com/e3605493-45a4-47b6-8654-a8b0e8204461@r_1280w_1280h.jpg";
    m3.width = 530;
    m3.height = 530;
    
    
    ContentImageModel* m4 = [[ContentImageModel alloc] init];
    m4.imageUrl = @"http://ci.xiaohongshu.com/935e4ec8-0f49-4f9e-a59c-c6e27fc3cb6d@r_1280w_1280h.jpg";
    m4.width = 270;
    m4.height = 360;
    
    
    ContentImageModel* m5 = [[ContentImageModel alloc] init];
    m5.imageUrl = @"http://ci.xiaohongshu.com/44dc6e13-f1c2-4f8f-b076-c9b5d9bdce2d@r_1280w_1280h.jpg";
    m5.width = 272;
    m5.height = 364;
    
    ContentImageModel* m6 = [[ContentImageModel alloc] init];
    m6.imageUrl = @"http://ci.xiaohongshu.com/32033a76-fa60-47c8-a2e8-9cdb13054ca3@r_1280w_1280h.jpg";
    m6.width = 535;
    m6.height = 400;
    
    ContentImageModel* m7 = [[ContentImageModel alloc] init];
    m7.imageUrl = @"http://ci.xiaohongshu.com/b859834f-3da2-4f6d-916e-1ca0c4e91f19@r_1280w_1280h.jpg";
    m7.width = 533;
    m7.height = 533;
    
    ContentImageModel* m8 = [[ContentImageModel alloc] init];
    m8.imageUrl = @"http://ci.xiaohongshu.com/7b6bb3e3-d4e2-42fa-b239-a7e53127cd78@r_1280w_1280h.jpg";
    m8.width = 526;
    m8.height = 687;
    
    
    
    return @[m1,m2,m3,m4,m5,m6,m7,m8];
}
-(BOOL)shouldShowAllButton{
    NSString* content = self.contentText;
    CGRect rect = [content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 16, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
    CGFloat textHeight = rect.size.height;
    BOOL isShow = (max_content_height > textHeight);
    return  isShow;
}
@end
@implementation ContentImageModel



@end
