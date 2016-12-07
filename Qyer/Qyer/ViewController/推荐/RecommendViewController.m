//
//  RecommendViewController.m
//  Qyer
//
//  Created by Yang Xiong on 25/11/2016.
//  Copyright © 2016 DKD. All rights reserved.
//

#import "RecommendViewController.h"
#import <iCarousel.h>
#import "RecommendCityCell.h"
#import "CommentViewCell.h"
#import "GoCell.h"
#import "RecommendViewCell.h"


@interface RecommendViewController ()<iCarouselDelegate,iCarouselDataSource>

//表头
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
@property (nonatomic) NSTimer * timer;
//搜索栏
@property (nonatomic) UISearchBar * searchBar;
//最近访问
@property (nonatomic) RecommendModel * data;
//推荐内容
@property (nonatomic) RecommendViewModel * List;

@end

@implementation RecommendViewController

-(void)setTableView:(UITableView *)tableView
{
    [super setTableView:tableView];
    self.tableView = tableView;
}



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
        
        //创建iC
        _ic = [iCarousel new];
        [_touView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 50, 0));
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = 0;
        _ic.pagingEnabled = YES;
        //创建页数控制器
        self.pageC = [UIPageControl new];
        [self.touView addSubview:self.pageC];
        //设置 选中 和 未选中时的颜色
        self.pageC.currentPageIndicatorTintColor = [UIColor whiteColor];
        self.pageC.pageIndicatorTintColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:.5];
        
        
        //布局 设置居中 底距离底部距离为 -3；
        [self.pageC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-49);
        }];

        //创建搜索栏，并设置
        self.searchBar = [UISearchBar new];
        [self.touView addSubview:_searchBar];
        [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom);
            make.left.equalTo(0);
            make.right.equalTo(0);
        }];
        _searchBar.placeholder = [NSString stringWithString:self.dataList.data.keyword];
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    }
    return _touView;
}
#pragma mark - iC数据源，代理方法
//个数
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 4;
}
//显示的样式
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc]initWithFrame:carousel.bounds];
    }
    self.slideModel = _dataList.data.slide;
    [((UIImageView *)view)setImageURL:self.slideModel[index].photo.wx_URL];
    return view;
}

//允许滚动
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}



//当Carousel变化时 自动调用
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pageC.currentPage = carousel.currentItemIndex;
}

#pragma mark - tableView数据源与代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        RecommendCityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendCityCell" forIndexPath:indexPath];
    [cell iconBtnWithCover:self.data.data.cover City:self.data.data.city_name];
    [cell playBtn];
    [cell foodBtn];
    [cell packBtn];
    [cell bournBtn];
    [cell cityLb];
    [cell scenicBtn1];
    [cell scenicBtn2];
    [cell scenicBtn3];
    cell.layer.cornerRadius = 5;
    cell.layer.borderWidth = 1;
    cell.clipsToBounds = YES;
    cell.layer.borderColor = [UIColor grayColor].CGColor;
    //  点击 cell 不可选
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 1) {
        CommentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentViewCell" forIndexPath:indexPath];
    [cell icon];
    [cell label];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.layer.cornerRadius = 5;
    cell.clipsToBounds = YES;
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = [UIColor grayColor].CGColor;
    //  点击 cell 不可选
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    if (indexPath.section == 2) {
        GoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoCell" forIndexPath:indexPath];
        [cell image];
        [cell goLb];
        [cell IV];
        cell.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1];
        return cell;
    }
    if (indexPath.section == 3) {
        RecommendViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendViewCell" forIndexPath:indexPath];
        [cell.headerView setImageURL:self.List.data.feed.entry[indexPath.row].cover.wx_URL];
        cell.noteLb.text = self.List.data.feed.entry[indexPath.row].column;
        cell.titleLb.text = self.List.data.feed.entry[indexPath.row].title;
        cell.subjectLb.text = self.List.data.feed.entry[indexPath.row].subject;
        [cell.footerView setImageURL:self.List.data.feed.entry[indexPath.row].icon_url.wx_URL];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

//  设置cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return Height;
    }
    if (indexPath.section == 1) {
        return Height1;
    }
    if (indexPath.section == 2){
        return 54;
    }
    if (indexPath.section == 3) {
        return Height2;
    }
    else{
        return 25;
    }
}

//  每个分区之间的间隔
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 13;
    }
    return 0;
}
//  推荐城市Cell两边的间隔
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 25;
    view.size = CGSizeMake(width, 200);
    return view;
}

//  状态栏的字体颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //  隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
  
    [self.tableView registerClass:[RecommendCityCell class] forCellReuseIdentifier:@"RecommendCityCell"];
    [self.tableView registerClass:[CommentViewCell class] forCellReuseIdentifier:@"CommentViewCell"];
    [self.tableView registerClass:[GoCell class] forCellReuseIdentifier:@"GoCell"];
    [self.tableView registerClass:[RecommendViewCell class] forCellReuseIdentifier:@"RecommendViewCell"];
    //  把滚动栏 拆入到电池条上
      self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    //去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [NetManager getTouWithPage:0 completionHandler:^(QyerModel *pic, NSError *error) {
        if (!error) {
            self.dataList = pic;
            //调用懒加载并把去赋值给表头
            self.tableView.tableHeaderView = self.touView;
            //刷新iC
            [self.ic reloadData];
            //根据iC里面的图片个数设置页面控制器个数
            self.pageC.numberOfPages = self.ic.numberOfItems;
            //启动控制器
            self.timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
                [self.ic setCurrentItemIndex:self.ic.currentItemIndex + 1];
            } repeats:YES];
        }
    }];
    
    [NetManager getRecommendCityModel:0 completionHandler:^(RecommendModel *model, NSError *error) {
        if (!error) {
            //  获取 model层 数据
            self.data = model;
            [self.tableView reloadData];
          
        }
    }];
    
    [NetManager getRecommendContentModel:1 ompletionHandler:^(RecommendViewModel *model, NSError *error) {
        self.List = model;
        [self.tableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
