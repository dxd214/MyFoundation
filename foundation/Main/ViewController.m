//
//  ViewController.m
//  welcome
//
//  Created by 董晓东 on 15/3/17.
//  Copyright (c) 2015年 实创装饰集团出品. All rights reserved.
//

#import "ViewController.h"
#import "HuodongViewController.h"
#import "MainViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()
{
    UIImageView *_imageView;
    NSTimer *_timer;
    NSInteger _index;
}
@end
#define kScreenWidth     [UIScreen mainScreen].bounds.size.width
#define kScreenHeight    [UIScreen mainScreen].bounds.size.height
#define imgUrl @"http://jbcdn2.b0.upaiyun.com/2014/01/a233d0ea49dc2992c64ffa3ffdfb4246.jpg"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //活动图片
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    [self.view addSubview:_imageView];
    
    //定时器跳转
    _index = 2;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    HuodongViewController *huodongVC = [[HuodongViewController alloc]init];
    huodongVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:huodongVC animated:YES completion:^{
        _imageView = nil;
        [_timer invalidate];
    }];

}
- (void)timerAction:(NSTimer *)timer
{
    _index--;
    if (_index<0)
    {
        MainViewController *mainVC = [[MainViewController alloc]init];
        mainVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        [self presentViewController:mainVC animated:YES completion:^{
            _imageView = nil;
        }];
        [_timer invalidate];
    }
}

@end
