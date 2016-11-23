//
//  RecommendViewController.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/18.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "RecommendViewController.h"
#import <iCarousel.h>
#import "RecommendCityCell.h"
//  真实高度宏
#define Height (long)([UIScreen mainScreen].bounds.size.height * 530 / 1136.0)
//    200 / 530 = x / High
@interface RecommendViewController ()<iCarouselDelegate,iCarouselDataSource>
//表头 + 搜索栏数据
@property (nonatomic) QyerModel * dataList;
//表头ic
@property (nonatomic) iCarousel * ic;
//表头视图
@property (nonatomic) UIView * touView;
//搜索栏
@property (nonatomic) UITextField * search;
//页面控制器
@property (nonatomic) UIPageControl * pageC;
//表头视图数据
@property (nonatomic) NSArray <QyerDataSlideModel *> * slideModel;
//定时器
@property (nonatomic) NSTimer *timer;


@end

@implementation RecommendViewController

#pragma mark - 懒加载
//获取滚动视图数据
-(NSArray<QyerDataSlideModel *> *)slideModel{
    if (!_slideModel) {
        _slideModel = _dataList.data.slide;
    }
    return _slideModel;
}
//表头懒加载
-(UIView *)touView{
    if (!_touView) {
        _touView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 240)];
        self.tableView.tableHeaderView = _touView;
        
        //创建iC
        _ic = [iCarousel new];
        [_touView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 50, 0));
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = 0;
        
        //创建页数控制器
        self.pageC = [UIPageControl new];
        [self.touView addSubview:self.pageC];
        //设置 选中 和 未选中时的颜色
        self.pageC.currentPageIndicatorTintColor = [UIColor whiteColor];
        self.pageC.pageIndicatorTintColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:.5];
        
        
        //布局 设置居中 底距离底部距离为 6；
        [self.pageC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-49);
        }];
        NSLog(@"--%@---",self.pageC);
        //添加搜索栏，并设置
        self.search = [UITextField new];
        [self.touView addSubview:_search];
        _search.textAlignment = NSTextAlignmentCenter;
        NSString *str = @"🔍";
        _search.placeholder = [str stringByAppendingString:self.dataList.data.keyword];
        _search.layer.borderWidth = 1;
        _search.layer.cornerRadius = 3;
        _search.layer.masksToBounds = YES;
        _search.font = [UIFont systemFontOfSize:13];
        _search.layer.borderColor = [UIColor colorWithDisplayP3Red:37 / 255.0 green:190 / 255.0 blue:124 / 255.0 alpha:.5].CGColor;
        _search.backgroundColor = [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:.8];
        [_search mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.right.bottom.equalTo(-8);
            make.height.equalTo(32);
        }];
    }
    return _touView;
}

#pragma mark - iC数据源，代理方法
//  个数
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 4;
}
//  显示的样式
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc]initWithFrame:carousel.bounds];
    }
    self.slideModel = _dataList.data.slide;
    [((UIImageView *)view)setImageURL:self.slideModel[index].photo.wx_URL];
    return view;
}


//  允许滚动
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

//  当Carousel变化时 自动调用
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pageC.currentPage = carousel.currentItemIndex;
}

#pragma mark - tableView数据源与代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        RecommendCityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendCityCell"];
        if (cell == nil) {
            cell = [[RecommendCityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RecommendCityCell"];
        }
        cell.layer.cornerRadius = 5;
        cell.layer.borderWidth = 1;
        cell.layer.borderColor = [UIColor grayColor].CGColor;
        cell.clipsToBounds = YES;
        cell.recommendCityView.hidden = NO;
        cell.iconBtn.hidden = NO;
        return cell;
}
//  设置row的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
       return Height;
}
//  设置分区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25 / 2.0;
}
//  设置分区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 25 / 2.0;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc]init];
    CGFloat width  = [UIScreen mainScreen].bounds.size.width - 50;
    view.size = CGSizeMake(width, 200);
    return view;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //  去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

 
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    [NetManager getTouWithPage:0 completionHandler:^(QyerModel *pic, NSError *error) {
        if (!error) {
            self.dataList = pic;
            //  调用懒加载并把去赋值给表头
            self.tableView.tableHeaderView = self.touView;
            //  刷新iC
            [self.ic reloadData];
            //  根据iC里面的图片个数设置页面控制器个数
            self.pageC.numberOfPages = self.ic.numberOfItems;
            NSLog(@"%@",self.pageC);
            //  启动控制器
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
