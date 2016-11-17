//
//  ViewController.m
//  Qyer
//
//  Created by tarena on 16/11/16.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "ViewController.h"
#import <iCarousel.h>

@interface ViewController ()<iCarouselDelegate,iCarouselDataSource>
//  表头➕搜索栏数据
@property (nonatomic) QyerModel  *dataList;
// 表头ic
@property (nonatomic) iCarousel *ic;
// 表头视图
@property (nonatomic) UIView *touView;
//搜索栏
@property (nonatomic) UITextField* searchf;
// 页面控制器
@property (nonatomic) UIPageControl *pageC;
// 表头视图数据
@property (nonatomic) NSArray<QyerDataSlideModel *> *slideModel;
// 定时器
@property (nonatomic) NSTimer* timer;
@end

@implementation ViewController

#pragma mark - 懒加载
// 获取滚动视图数据
-(NSArray<QyerDataSlideModel *> *)slideModel
{
    if (!_slideModel) {
        _slideModel = _dataList.data.slide;
    }
    return _slideModel;
}
//表头懒加载
-(UIView *)touView
{
    if (!_touView) {
        _touView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 240)];
        self.tableView.tableHeaderView = _touView;
        //        [self.view addSubview:_touView];
        // 创建IC
        _ic = [iCarousel new];
        [_touView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 50, 0));
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = 0;
        // 创建 页数控制器.
        self.pageC = [UIPageControl new];
        [self.touView addSubview: self.pageC];
        // 设置其 选中和 未选中时的颜色
        self.pageC.currentPageIndicatorTintColor = [UIColor whiteColor];
        self.pageC.pageIndicatorTintColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:.3];
        // 布局 设置居中  低距离底部距离为 6;
        
        [self.pageC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-6);
        }];
        //添加搜索栏 , 并设置
        self.searchf = [UITextField new];
        [self.touView addSubview:_searchf];
        _searchf.textAlignment = NSTextAlignmentCenter;
        NSString* str = @"🔍";
        _searchf.placeholder = [str stringByAppendingString:self.dataList.data.keyword];
        _searchf.layer.borderWidth = 1;
        _searchf.layer.cornerRadius = 3;
        _searchf.layer.masksToBounds = YES;
        _searchf.font = [UIFont systemFontOfSize:13];
        _searchf.layer.borderColor = [UIColor greenColor].CGColor;
        _searchf.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.8];
        [_searchf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.right.bottom.equalTo(-8);
            make.height.equalTo(32);
        }];
    }
    return _touView;
}
#pragma mark ---- iC 数据源. 代理方法、
//  个数
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 4;
}
// 显示的样子
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc]initWithFrame:carousel.bounds];
    }
    self.slideModel = _dataList.data.slide;
    [((UIImageView *)view)setImageURL:self.slideModel[index].photo.wx_URL];
    return view;
}
//  允许无限滚动
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
//  当carousel 变化时  自动调用
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    
    _pageC.currentPage = carousel.currentItemIndex;
    
}
#pragma mark ******* tableview 数据源与代理 ********
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [UITableViewCell new];
    return cell;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // 去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [NetManager getTouWithPage:0 completionHandler:^(QyerModel *pic, NSError *error) {
        if (!error) {
            self.dataList = pic;
            // 调用懒加载并把其赋值给表头
            self.tableView.tableHeaderView = self.touView;
            // 刷新 ic.
            [self.ic reloadData];
            // 根据ic里面的图片个数设置页面控制器个数
            self.pageC.numberOfPages = self.ic.numberOfItems;
            // 启动定时器
            self.timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
                [self.ic setCurrentItemIndex:self.ic.currentItemIndex + 1];
            } repeats:YES];
        }
    }];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


@end
