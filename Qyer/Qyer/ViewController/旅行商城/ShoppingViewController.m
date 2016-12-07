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
@property(nonatomic) NSMutableArray<ShoppingHotGoodsModel *> *hotGoodsList;
@property(nonatomic) NSMutableArray<ShoppingDisCountTopicListModel *> *topicList;
@property(nonatomic) NSMutableArray<ShoppingDisCountTopicListModel *> *topicList1;
@property(nonatomic) NSMutableArray<ShoppingListModel *> *list;
@property(nonatomic) NSMutableArray<ShoppingPlaceModel *> *place;
@property(nonatomic) NSMutableArray<ShoppingListModel *> *list1;
@property(nonatomic) NSMutableArray<ShoppingPlaceModel *> *place1;
@property(nonatomic) NSMutableArray<ShoppingListModel *> *list2;
@property(nonatomic) NSMutableArray<ShoppingPlaceModel *> *place2;

//@property(nonatomic) NSMutableDictionary *idDic;
@property(nonatomic) NSString *idStr;

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

-(NSMutableArray<ShoppingListModel *> *)list1
{
    if (!_list1)
    {
        _list1 = [NSMutableArray new];
    }
    return _list1;
}

-(NSMutableArray<ShoppingPlaceModel *> *)place1
{
    if (!_place1)
    {
        _place1 = [NSMutableArray new];
    }
    return _place1;
}

-(NSMutableArray<ShoppingListModel *> *)list2
{
    if (!_list2)
    {
        _list2 = [NSMutableArray new];
    }
    return _list2;
}

-(NSMutableArray<ShoppingPlaceModel *> *)place2
{
    if (!_place2)
    {
        _place2 = [NSMutableArray new];
    }
    return _place2;
}

-(NSMutableArray<ShoppingDisCountTopicListModel *> *)topicList
{
    if (!_topicList)
    {
        _topicList = [NSMutableArray new];
    }
    return _topicList;
}

-(NSMutableArray<ShoppingDisCountTopicListModel *> *)topicList1
{
    if (!_topicList1)
    {
        _topicList1 = [NSMutableArray new];
    }
    return _topicList1;
}

-(NSMutableArray<ShoppingHotGoodsModel *> *)hotGoodsList
{
    if (!_hotGoodsList)
    {
        _hotGoodsList = [NSMutableArray new];
    }
    return _hotGoodsList;
}

-(NSString *)idStr
{
    if (!_idStr)
    {
        _idStr =[NSString new];
    }
    return _idStr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView registerClass:[AdvertisementCell class] forCellReuseIdentifier:@"AdvertisementCell"];
    [self.tableView registerClass:[WorldCell class] forCellReuseIdentifier:@"WorldCell"];
    [self.tableView registerClass:[DiscountTopicCell class] forCellReuseIdentifier:@"DiscountTopicCell"];
    [self.tableView registerClass:[HotGoodsCell class] forCellReuseIdentifier:@"HotGoodsCell"];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger i = self.shoppingModel.data.market_topic.count;
    NSInteger j = self.shoppingModel.data.hot_area[1].place.count;
    NSInteger k = self.shoppingModel.data.discount_topic[1].list.count;
    NSInteger l = self.shoppingModel.data.hot_goods.count;

    switch (section)
    {
        case 0:
            if (i != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
            break;
        case 1:
            if (j != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
            break;
        case 2:
            if (j != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
            break;
        case 3:
            if (j != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
            break;
        case 4:
            if (k != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
            break;
        case 5:
            if (k != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        case 6:
            if (l != 0)
            {
                return 1;
            }
            else
            {
                return 0;
            }
            break;
        default:
            break;
    }
    return 0;
}

 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取广告的所有数据
    [self.marketTopicList  addObjectsFromArray:self.shoppingModel.data.market_topic];
    // 取得所有热门旅游城市的数据
    
    
        if (indexPath.section == 0)
        {

            AdvertisementCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AdvertisementCell"];
            if (cell == nil)
            {
                cell = [[AdvertisementCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AdvertisementCell"];
            }
            
            if (cell.leftBtn)
            {
                self.idStr = self.marketTopicList[0].url;
                
            }
            else if (cell.rightUpBtn)
            {
                self.idStr = self.marketTopicList[1].url;
                
            }
            else if (cell.rightDownBtn)
            {
                self.idStr = self.marketTopicList[2].url;
                [cell.rightDownBtn addTarget:self action:@selector(sendAdverURLandWC:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            [cell.leftBtn setBackgroundImageWithURL:self.marketTopicList[0].pic.wx_URL forState:UIControlStateNormal options:0];
            
            [cell.leftBtn addTarget:self action:@selector(sendAdverURLandWC:) forControlEvents:UIControlEventTouchUpInside];

            [cell.rightUpBtn setBackgroundImageWithURL:self.marketTopicList[1].pic.wx_URL forState:UIControlStateNormal options:0];
            [cell.rightUpBtn addTarget:self action:@selector(sendAdverURLandWC:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell.rightDownBtn setBackgroundImageWithURL:self.marketTopicList[2].pic.wx_URL forState:UIControlStateNormal options:0];
            
            
            [cell addSubview:cell.view];
            return cell;
        }
    if (indexPath.section == 1)
    {
        [self.place addObjectsFromArray:self.shoppingModel.data.hot_area[0].place];
        [self.list addObjectsFromArray:self.shoppingModel.data.hot_area[0].list];
        
        WorldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WorldCell"];
        if (cell == nil)
        {
            cell = [[WorldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WorldCell"];
        }
        
        
        cell.cityTitle.text = @"欧洲美国";
        UIImageView *usatIV = [[UIImageView alloc]initWithFrame:CGRectMake(30, -5, 360, 65)];
        usatIV.image = [UIImage imageNamed:@"欧美其他_375x65_"];
        
        [cell.cityView addSubview:usatIV];
        
        
        [cell.cityBtn enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj setBackgroundImageWithURL:self.place[idx].photo.wx_URL forState:UIControlStateNormal options:NO];
        }];
        
        [cell.cityName enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.text = self.place[idx].name;
        }];
        
        
        
        [cell.cityPic1 setImageURL:self.list[0].photo.wx_URL];
        cell.title1LB.text = self.list[0].title;
        cell.sold1LB.text = self.list[0].sold;
        cell.price1LB.text = [self.list[0].price stringByAppendingString:@" 元起"];
        
        
        [cell.cityPic2 setImageURL:self.list[1].photo.wx_URL];
        cell.title2LB.text = self.list[1].title;
        cell.sold2LB.text = self.list[1].sold;
        cell.price2LB.text = [self.list[1].price stringByAppendingString:@" 元起"];
        
        //cell.moreContentBtn.titleLabel.text = [NSString stringWithFormat: @"查看港澳台专题 >"];
        
        [cell.moreContentBtn setTitle:[NSString stringWithFormat: @"查看欧洲美国专题 >"] forState:UIControlStateNormal];
        return cell;
    }
    
        if (indexPath.section == 2)
        {
            [self.place1 addObjectsFromArray:self.shoppingModel.data.hot_area[1].place];
            [self.list1 addObjectsFromArray:self.shoppingModel.data.hot_area[1].list];


                WorldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WorldCell"];
            if (cell == nil)
            {
                cell = [[WorldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WorldCell"];
            }
            
            cell.cityTitle.text = @"东南亚";
            
            UIImageView *eastIV = [[UIImageView alloc]initWithFrame:CGRectMake(25, -5, 360, 65)];
            eastIV.image = [UIImage imageNamed:@"泰国_375x65_"];
            [cell.cityView addSubview:eastIV];

            
            [cell.cityBtn enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj setBackgroundImageWithURL:self.place1[idx].photo.wx_URL forState:UIControlStateNormal options:NO];
            }];
            
            [cell.cityName enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.text = self.place1[idx].name;
            }];
            
            
            
            [cell.cityPic1 setImageURL:self.list1[0].photo.wx_URL];
            cell.title1LB.text = self.list1[0].title;
            cell.sold1LB.text = self.list1[0].sold;
            cell.price1LB.text = [self.list1[0].price stringByAppendingString:@" 元起"];
            
            
            [cell.cityPic2 setImageURL:self.list1[1].photo.wx_URL];
            cell.title2LB.text = self.list1[1].title;
            cell.sold2LB.text = self.list1[1].sold;
            cell.price2LB.text = [self.list1[1].price stringByAppendingString:@" 元起"];
            
            //cell.moreContentBtn.titleLabel.text = [NSString stringWithFormat: @"查看港澳台专题 >"];
            
            [cell.moreContentBtn setTitle:[NSString stringWithFormat: @"查看港澳台专题 >"] forState:UIControlStateNormal];
            return cell;
         }
    
    if (indexPath.section == 3)
    {
        [self.place2 addObjectsFromArray:self.shoppingModel.data.hot_area[2].place];
        [self.list2 addObjectsFromArray:self.shoppingModel.data.hot_area[2].list];
        WorldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WorldCell"];
        if (cell == nil)
        {
            cell = [[WorldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WorldCell"];
        }
        
        cell.cityTitle.text = @"港澳台";
        
        UIImageView *hkIV = [[UIImageView alloc]initWithFrame:CGRectMake(25, -5, 360, 65)];
        hkIV.image = [UIImage imageNamed:@"港澳_375x65_"];
        [cell.cityView addSubview:hkIV];
        
        [cell.cityBtn enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj setBackgroundImageWithURL:self.place2[idx].photo.wx_URL forState:UIControlStateNormal options:NO];
        }];
        
        [cell.cityName enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.text = self.place2[idx].name;
        }];
        
        
        
        [cell.cityPic1 setImageURL:self.list2[0].photo.wx_URL];
        cell.title1LB.text = self.list2[0].title;
        cell.sold1LB.text = self.list2[0].sold;
        cell.price1LB.text = [self.list2[0].price stringByAppendingString:@" 元起"];
        
        
        [cell.cityPic2 setImageURL:self.list2[1].photo.wx_URL];
        cell.title2LB.text = self.list2[1].title;
        cell.sold2LB.text = self.list2[1].sold;
        cell.price2LB.text = [self.list2[1].price stringByAppendingString:@" 元起"];
        
        //cell.moreContentBtn.titleLabel.text = [NSString stringWithFormat: @"查看港澳台专题 >"];
        
        [cell.moreContentBtn setTitle:[NSString stringWithFormat: @"查看东南亚专题 >"] forState:UIControlStateNormal];
        return cell;
    }
    if (indexPath.section == 4)
    {
        [self.topicList addObjectsFromArray:self.shoppingModel.data.discount_topic[0].list];
        DiscountTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiscountTopicCell"];
        if (cell == nil)
        {
            cell = [[DiscountTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DiscountTopicCell"];
        }
        
        
        cell.cityTitle.text = self.shoppingModel.data.discount_topic[0].topic.title;
        
        [cell.topIV setBackgroundImageWithURL:self.shoppingModel.data.discount_topic[0].topic.photo.wx_URL forState:UIControlStateNormal options:NO];
        
        
        [cell.cityPic1 setImageURL:self.topicList[0].photo.wx_URL];
        cell.title1LB.text = self.topicList[0].title;
        cell.sold1LB.text = self.topicList[0].sold;
        cell.price1LB.text = [self.topicList[0].price stringByAppendingString:@" 元起"];
        
        
        [cell.cityPic2 setImageURL:self.topicList[1].photo.wx_URL];
        cell.title2LB.text = self.topicList[1].title;
        cell.sold2LB.text = self.topicList[1].sold;
        cell.price2LB.text = [self.topicList[1].price stringByAppendingString:@" 元起"];
        
        [cell.cityPic3 setImageURL:self.topicList[2].photo.wx_URL];
        cell.title3LB.text = self.topicList[2].title;
        cell.sold3LB.text = self.topicList[2].sold;
        cell.price3LB.text = [self.topicList[2].price stringByAppendingString:@" 元起"];
        
        //cell.moreContentBtn.titleLabel.text = [NSString stringWithFormat: @"查看港澳台专题 >"];
        
        [cell.moreContentBtn setTitle:[NSString stringWithFormat: @"查看完整专题 >"] forState:UIControlStateNormal];
        return cell;
    }
    if (indexPath.section == 5)
    {

        [self.topicList1 addObjectsFromArray:self.shoppingModel.data.discount_topic[1].list];
        DiscountTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiscountTopicCell"];
        if (cell == nil)
        {
            cell = [[DiscountTopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DiscountTopicCell"];
        }
        
        
        cell.cityTitle.text = self.shoppingModel.data.discount_topic[1].topic.title;
        
        [cell.topIV setBackgroundImageWithURL:self.shoppingModel.data.discount_topic[1].topic.photo.wx_URL forState:UIControlStateNormal options:NO];

        [cell.cityPic1 setImageURL:self.topicList1[0].photo.wx_URL];
        cell.title1LB.text = self.topicList1[0].title;
        cell.sold1LB.text = self.topicList1[0].sold;
        cell.price1LB.text = [self.topicList1[0].price stringByAppendingString:@" 元起"];
        self.idStr = self.topicList1[1].ID;
        [cell.cityDetail02Btn addTarget:self action:@selector(sendURLandWC:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [cell.cityPic2 setImageURL:self.topicList1[1].photo.wx_URL];
        cell.title2LB.text = self.topicList1[1].title;
        cell.sold2LB.text = self.topicList1[1].sold;
        cell.price2LB.text = [self.topicList1[1].price stringByAppendingString:@" 元起"];
        
        [cell.cityPic3 setImageURL:self.topicList1[2].photo.wx_URL];
        cell.title3LB.text = self.topicList1[2].title;
        cell.sold3LB.text = self.topicList1[2].sold;
        cell.price3LB.text = [self.topicList1[2].price stringByAppendingString:@" 元起"];
       
        
        //cell.moreContentBtn.titleLabel.text = [NSString stringWithFormat: @"查看港澳台专题 >"];
        
        [cell.moreContentBtn setTitle:[NSString stringWithFormat: @"查看完整专题 >"] forState:UIControlStateNormal];
        return cell;
    }
    if (indexPath.section == 6)
    {
        
        [self.hotGoodsList addObjectsFromArray:self.shoppingModel.data.hot_goods];
        HotGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotGoodsCell"];
        if (cell == nil)
        {
            cell = [[HotGoodsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HotGoodsCell"];
        }
        
        cell.cityTitle.text = @"有好货";
        NSArray *numberList = @[@"0",@"1",@"2",@"3",@"4",@"5"];
        
        [cell.goodsBtn enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.titleLabel.text = numberList[idx];
        }];
        
        [cell.goodsBtn enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            switch (idx) {
                case 0:
                    self.idStr = self.hotGoodsList[0].ID;
                    [obj addTarget:self action:@selector(sendURLandWC:) forControlEvents:UIControlEventTouchUpInside];
                    break;

                default:
                    break;
            }
        }];

        [cell.goodsPic enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj setImageURL:self.hotGoodsList[idx].photo.wx_URL];
        }];
        
        [cell.titleLB enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.text = self.hotGoodsList[idx].title;
        }];
        
        [cell.statusLB enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.text = self.hotGoodsList[idx].status;
        }];
        
        [cell.priceLB enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.text = [NSString stringWithFormat:@"%@元起",self.hotGoodsList[idx].price];
        }];

        return cell;
    }
    return nil;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return (kHight * (216.f / 1132.f));
            break;
        case 1:
            return (kHight * (630.f / 1132.f));
            break;
        case 2:
            return (kHight * (630.f / 1132.f));
            break;
        case 3:
            return (kHight * (630.f / 1132.f));
            break;
        case 4:
            return (kHight * (988.f / 1132.f));
            break;
        case 5:
            return (kHight * (988.f / 1132.f));
            break;
        case 6:
            return (kHight * (1250.f / 1132.f));
            break;
            
        default:
            break;
    }
    return 20;
}

//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    return nil;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 10;
            break;
        case 1:
            return 0;
            break;
            
        default:
            break;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 10;
            break;
        case 1:
            return 10;
            break;
        case 2:
            return 10;
            break;
        case 3:
            return 10;
            break;
        case 4:
            return 10;
            break;
        case 5:
            return 10;
            break;
        default:
            break;
    }
    return 0;
}

// 获取表头的数据内容并显示.
-(UIView *)setHeaderView
{
    ShoppingHeaderView *headerView = [[ShoppingHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , kHight * (435 / 1132.0))];
    
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

// 封装该方法主要作用是用来跳转到下一个界面以及跳转时传递给下个界面的URL
-(void)sendURLandWC:(NSString *)urlStr
{
    NSLog(@"我的传值是 = %@",self.idStr);
    NSString *path = [NSString stringWithFormat:@"http:/m.qyer.com/z/deal/%@/",self.idStr];
    shoppingWebPageController *wc = [[shoppingWebPageController alloc]initWithURL:path.wx_URL];
    
    [self.navigationController pushViewController:wc animated:YES];
}

// 封装该方法主要作用是用来跳转广告页面
-(void)sendAdverURLandWC:(NSString *)urlStr
{
    shoppingWebPageController *wc = [[shoppingWebPageController alloc]initWithURL:self.idStr.wx_URL];
    
    [self.navigationController pushViewController:wc animated:YES];
}
@end
