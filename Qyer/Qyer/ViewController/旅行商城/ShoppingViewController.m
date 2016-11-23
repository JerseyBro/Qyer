//
//  ShoppingViewController.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/18.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "ShoppingViewController.h"

@interface ShoppingViewController ()
@property(nonatomic) UIColor *shoppingBackgroundColor;
@property(nonatomic) ShoppingModel *shoppingModel;
@property(nonatomic) NSMutableArray<ShoppingIconListModel *> *iconList;
@property(nonatomic) NSMutableArray<ShoppingMarketTopicModel *> *marketTopicList;
@property(nonatomic) NSMutableArray<ShoppingListModel *> *list;
@property(nonatomic) NSMutableArray<ShoppingPlaceModel *> *place;
@end

@implementation ShoppingViewController
-(UIColor *)shoppingBackgroundColor
{
    return [UIColor colorWithRed:242 / 255.0 green:242 / 255.0 blue:242 / 255.0 alpha:1];
}

-(NSMutableArray<ShoppingIconListModel *> *)iconList
{
    if (!_iconList)
    {
        _iconList = [NSMutableArray new];
    }
    return _iconList;
}

-(NSMutableArray<ShoppingMarketTopicModel *> *)marketTopicList
{
    if (!_marketTopicList)
    {
        _marketTopicList = [NSMutableArray new];
    }
    return _marketTopicList;
}

-(NSMutableArray<ShoppingListModel *> *)list
{
    if (!_list)
    {
        _list = [NSMutableArray new];
    }
    return _list;
}

-(NSMutableArray<ShoppingPlaceModel *> *)place
{
    if (!_place)
    {
        _place = [NSMutableArray new];
    }
    return _place;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    //[self.tableView registerClass:[ShoppingCell class] forCellReuseIdentifier:@"cell"];
    
    // 调用网络请求的方法，把所有所需的数据解析出来
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [NetManager getShoppingCompletionHandler:^(ShoppingModel *model, NSError *error) {
            [self.tableView.mj_header endRefreshing];
            if (!error)
            {
                self.shoppingModel = model;
                [self.tableView reloadData];
                
                self.tableView.tableHeaderView = [self setHeaderView];
            }
            
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
}

#pragma mark - Table view data source

-(UIView *)setHeaderView
{
    ShoppingHeaderView *headerView = [[ShoppingHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , 230)];
    
    // 取得所有表头ICON的数据.
    [self.iconList  addObjectsFromArray: self.shoppingModel.data.icon_list];
    
    if (self.iconList.count > 0)
    {
        NSArray<NSString *>  *iconData = [NSArray new];
        NSMutableArray  *iconTempArr = [NSMutableArray new];
        for (NSInteger i = 0; i < self.iconList.count; i ++)
        {
            NSString* iconPath = self.iconList[i].icon_pic;
            [iconTempArr addObject:iconPath];
        }
        iconData = iconTempArr.copy;
        
        // 使用第三方轮子的数组遍历方法把所有的图片遍历出来给btn做背景图片.
        [headerView.headerBtn enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //[obj setImageWithURL:iconData[idx].wx_URL  forState:UIControlStateNormal options:NO];
            
            [obj setBackgroundImageWithURL:iconData[idx].wx_URL forState:UIControlStateNormal options:NO];
        }];
        
        
        NSArray<NSString *> *textData = [NSArray new];
        NSMutableArray  *textTempArr = [NSMutableArray new];
        for (NSInteger i = 0; i < self.iconList.count; i ++)
        {
            NSString *textContent = self.iconList[i].icon;
            [textTempArr addObject:textContent];
        }
        textData = textTempArr.copy;
        
        // 使用第三方轮子的数组遍历方法把所有的项目栏文字遍历出来并显示的LABLE上.
        [headerView.headerLB enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.text = textData[idx];
        }];
        
        return headerView;
    }
    
    return nil;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 130;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section

{
    [self.marketTopicList  addObjectsFromArray:self.shoppingModel.data.market_topic];
    if (self.marketTopicList.count > 0) {
        if (section == 0)
        {
            NSArray<NSString *> *marketTopicData = [NSArray new];
            NSMutableArray *marketTopicTempArr = [NSMutableArray new];
            for (NSInteger i = 0; i < self.marketTopicList.count; i ++)
            {
                NSString *adViewPath = self.marketTopicList[i].pic;
                [marketTopicTempArr addObject:adViewPath];
            }
            marketTopicData = marketTopicTempArr.copy;
            
            AdvertisementView *adView = [[AdvertisementView alloc]init];
            adView.backgroundColor = [UIColor whiteColor];
            adView.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 80);
            
            [adView.leftBtn setBackgroundImageWithURL:marketTopicData[0].wx_URL forState:UIControlStateNormal options:0];
            [adView.rightUpBtn setBackgroundImageWithURL:marketTopicData[1].wx_URL forState:UIControlStateNormal options:0];
            [adView.rightDownBtn setBackgroundImageWithURL:marketTopicData[2].wx_URL forState:UIControlStateNormal options:0];
            
            return adView ;
        }
        
        // 取得所有热门旅游城市的旅游信息
        [self.place addObjectsFromArray:self.shoppingModel.data.hot_area[0].place];
        if (section == 1)
        {
            NSArray<NSString *> *hotArea = [NSArray new];
            NSMutableArray *hotAreaArr = [NSMutableArray new];
            for (NSInteger i = 0; i < self.place.count; i ++)
            {
                NSString *adPhotoPath = self.place[i].photo;
                [hotAreaArr addObject:adPhotoPath];
            }
            hotArea = hotAreaArr.copy;
            
            HongKongJapanView *hjView = [[HongKongJapanView alloc]init];
            hjView.backgroundColor = [UIColor whiteColor];
            hjView.size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 80);
            
            [hjView.cityBtn enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj setBackgroundImageWithURL:hotArea[0].wx_URL forState:UIControlStateNormal options:NO];
            }];
            
            return hjView ;
            
        }
    }
    return nil;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 110;
    }
    else
    {
        return 0;
    }
    return 0;
}

@end
