# DWQCommitDisplay
仿淘宝评论展示，可根据自己需要布局UI
![DWQ-LOGO.jpeg](http://upload-images.jianshu.io/upload_images/2231137-6982849ee5bc26dd.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##引述
  在《快速搭建电商平台》系列上一篇文章[发布评论](http://www.jianshu.com/p/065dba71aead)中分享了发布评价模块中的发布功能，那么，在今天，我们分享的是评价模块中的评论展示。其实，不仅仅电商平台的评论模块用到，它也类似微信的朋友，微博的动态，脉脉的实名动态等。

##DWQCommitDisplay
  首先，我们参考下淘宝评论展示界面，我们需要实现哪些功能。简单的页面布局不再详细说，我们说下比较重要的功能点：
 > 
1.文字较长时出现   【全文】按钮，点击全部可查看到全文，并附带【收起】按钮。
2.图片可点击浏览查看
3.文字长短的自适应

  DWQCommitDisplay框架结构介绍：

![kuangjia.png](http://upload-images.jianshu.io/upload_images/2231137-b09c0a153fdea558.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 1.Resources   :包含工程用图片和一些数据源图片
- 2.Lib              ：封装所以来的一些第三方库
- 3.Controller   ：评论展示页面主控制器
- 4.Model         ：数据源模型
- 5.View           ：自定义Cell等自定义控件

DWQCommitDisplay  全文和收起来的实现原理：
1.在Model.h中声明一个Bool属性，在.m实现get方法

```objective-c
@property (nonatomic, assign) BOOL isShowAll;
@property (nonatomic, assign) BOOL shouldShowAllButton;

-(BOOL)shouldShowAllButton{
    NSString* content = self.contentText;
    CGRect rect = [content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 16, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
    CGFloat textHeight = rect.size.height;
    BOOL isShow = (max_content_height > textHeight);
    return  isShow;
}

```
##DWQCommitDisplay使用方法
- 1、将DWQCommitDisplay文件夹拖入工程中

- 2、Model中的数据源为假数据，自行替换

- 3、配置相机等权限

##DWQCommitDisplay效果展示


![zhanshi.png](http://upload-images.jianshu.io/upload_images/2231137-ab6fe3e34139b801.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


##Demo下载地址

[DWQCommitDisplay](https://github.com/DevelopmentEngineer-DWQ/DWQCommitDisplay)
希望广大读者给个好评，点赞，在GitHub上给个Star噢~~~~~~！
