//
//  shoppingWebPageController.m
//  Qyer
//
//  Created by Yang Xiong on 28/11/2016.
//  Copyright © 2016 DKD. All rights reserved.
//

#import "shoppingWebPageController.h"

@interface shoppingWebPageController () <UIWebViewDelegate>
@property(nonatomic) UIWebView *webView;
@end

@implementation shoppingWebPageController
// 开始加载网页时，为了网络速度的缓冲，页面显示菊花的等待的效果。
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.view showBusy];
}

// 网页显示成功后，菊花隐藏的效果
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.view hideBusy];
}

// 网页加载出错
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.view showMsg:@"网络加载出错，请检查后再次访问！"];
}

// 初始化一个view 用来装载和显示网页页面
-(UIWebView *)webView
{
    if (!_webView)
    {
        _webView = [UIWebView new];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _webView;
}

// 初始化url 把上个界面传值过来的url赋值给属性url
-(id)initWithURL:(NSURL *)url
{
    if (self = [super init])
    {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"折扣详情";
    // 把请求的url加载到webView中显示。
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

@end
