//
//  HuodongViewController.m
//  welcome
//
//  Created by 董晓东 on 15/3/17.
//  Copyright (c) 2015年 实创装饰集团出品. All rights reserved.
//

#import "HuodongViewController.h"
@interface HuodongViewController ()
{
    UIWebView *_webView;
}
@end
#define kScreenWidth     [UIScreen mainScreen].bounds.size.width
#define kScreenHeight    [UIScreen mainScreen].bounds.size.height
#define URLString  @"http://m.baidu.com"
@implementation HuodongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];

    //加载网页
    [self _initLoadWebViewWithWebView:_webView WithURLString:URLString];
    [self.view addSubview:_webView];
}
- (void)_initLoadWebViewWithWebView:(UIWebView *)webView
                      WithURLString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    webView.scalesPageToFit = YES;
    [self HiddenVerticalScrollIndicator:webView];
    [webView loadRequest:request];
}
- (void)HiddenVerticalScrollIndicator:(UIWebView *)webView
{
        //取消右侧，下侧滚动条，去处上下滚动边界的黑色背景
        for (UIView *_aView in [webView subviews])
        {
            if ([_aView isKindOfClass:[UIScrollView class]])
            {
                [(UIScrollView *)_aView setShowsVerticalScrollIndicator:NO];
                //右侧的滚动条
                [(UIScrollView *)_aView setShowsHorizontalScrollIndicator:NO];
                //下侧的滚动条
                for (UIView *_inScrollview in _aView.subviews)
                {
                    if ([_inScrollview isKindOfClass:[UIImageView class]])
                    {
                        _inScrollview.hidden = YES;
                        //上下滚动出边界时的黑色的图片
                    }
                }
            }
        }
    //   禁用UIWebView左右滚动
    [(UIScrollView *)[[webView subviews] objectAtIndex:0] setBounces:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
