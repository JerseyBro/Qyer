//
//  BournViewController.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/18.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "BournViewController.h"
//屏幕宽
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
// 引入数据 Model  Cell
#import "bournModel.h"
#import "bournzonCell.h"
#import "cityVScountryCell.h"
#import "countryCell.h"
@interface BournViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//目的地视图层 tableview
@property(nonatomic)UITableView *bournView;
//城市VS国家视图层   colletionview
@property(nonatomic)UICollectionView* cityVC;
//目的地数据
@property(nonatomic)NSArray<bourndataModel*>* bourndata;
//城市VS国家列表类
@property(nonatomic)bourntagdataModel* cityVScountry;
//选择的目的地地区名称
@property(nonatomic)NSString* tagname;
@end

@implementation BournViewController

// 目的地视图层 懒加载
-(UIColor *)GetGrayColor
{
    return [UIColor colorWithRed:244 / 255.0 green:244 / 255.0 blue:244 / 255.0 alpha:1.0];
}
-  (UITableView*)bournView
{
    if (!_bournView) {
          /**初始化并设置布局*/
        _bournView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        //去掉表尾
        self.bournView.tableFooterView = [UIView new];
        // 颜色
        self.bournView.backgroundColor = [UIColor whiteColor];
        // 选中时的颜色为；
        self.bournView.sectionIndexBackgroundColor = [UIColor whiteColor];
        //分割线
        self.bournView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        // 去分割线间距
        self.bournView.separatorInset = UIEdgeInsetsZero;
        self.bournView.delegate = self;
        self.bournView.dataSource = self;
        self.bournView.scrollEnabled = YES;
        //注册
        [self.bournView registerClass:[bournzonCell class] forCellReuseIdentifier:@"bournzonCell"];
    }
    return _bournView;
}

-(UICollectionView *)cityVC
{
    if (!_cityVC) {
        // 初始化并设置布局
        UICollectionViewFlowLayout * layou = [[UICollectionViewFlowLayout alloc]init];
         /**初始化并设置布局*/
        _cityVC = [[UICollectionView alloc]initWithFrame:CGRectMake(self.bournView.width, 64, WIDTH - self.bournView.width,HEIGHT)collectionViewLayout:layou];
        _cityVC.backgroundColor = [UIColor whiteColor];
        //注册单元视图和头部视图
        [self.cityVC registerClass:[cityVScountryCell class] forCellWithReuseIdentifier:@"cityVScountryCell"];
        // 注册两次一样的会出现问题。复用起来找不到/
        [self.cityVC registerClass:[countryCell class] forCellWithReuseIdentifier:@"countryCell"];
        //注册表头
        [self.cityVC registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        
        //设置滚动
        _cityVC.scrollEnabled = YES;
        [self.view addSubview:_cityVC];

    }
    return _cityVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.bournView];
    

    [NetManager getBournModelCompletionHandeler:^(bournModel *model, NSError *error) {
        if (!error) {
            self.bourndata = model.data;
            [self.bournView reloadData];
            [self.bournView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
            [self tableView:self.bournView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
            
            self.cityVScountry = self.bourndata[0].tagdata;
            [self cityVC];
            _cityVC.delegate = self;
            
            _cityVC.dataSource = self;
            [self.cityVC reloadData];
        }
    }];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.bourndata.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    bournzonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bournzonCell" forIndexPath:indexPath];
    cell.tagname.text = self.bourndata[indexPath.row].tagname;
    // 设置cell默认颜色与选中时的颜色
    cell.backgroundColor = self.GetGrayColor;
    //自定义选中时的颜色视图
    UIView* selectview = [[UIView alloc]init];
    selectview.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = selectview;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.cityVScountry = self.bourndata[indexPath.row].tagdata;
    self.tagname =  self.bourndata[indexPath.row].tagname;
    [self.cityVC reloadData];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
#pragma mark ------ Colletion ViewFlowLayout 布局代理
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width  = (long)(([UIScreen mainScreen].bounds.size.width - 40 - self.bournView.width) / 2);
    if (indexPath.section) {
        
        CGFloat high = width * 88 / 200;
        return CGSizeMake(width, high);
        
    }
    else{
        
        CGFloat high = width * 138 / 200;
        return  CGSizeMake(width,high);
    }
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 15, 10, 15);
}
#pragma mark ------ Colletionview data source

//设置分区头
//解决分区头重用。。。。。。。
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //复用分区头
    UICollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    static int flog = 0;
    if (!flog && indexPath.section == 1) {
        //设置分区头内的地区名与 包含国家数
        UILabel* tagname = [UILabel new];
        [headerView addSubview:tagname];
        tagname.textColor = [UIColor colorWithRed:89 / 255.0 green:89 / 255.0 blue:89 / 255.0 alpha:1.0];
        tagname.text = self.tagname;
        
        [tagname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(15);
        }];
        UILabel* countrycount = [UILabel new];
        [headerView addSubview:countrycount];
        countrycount.textColor = [UIColor grayColor];
        countrycount.font = [UIFont systemFontOfSize:13];
        NSString *str = [NSString stringWithFormat:@"%ld个国家",self.cityVScountry.countrycount];
        countrycount.text = str;
        [countrycount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(tagname.mas_right).offset(8);
            make.bottom.equalTo(tagname);
        }];
        flog++;
    }else
    {
        ((UILabel*)headerView.subviews.firstObject).text = self.tagname;        NSString *str = [NSString stringWithFormat:@"%ld个国家",self.cityVScountry.countrycount];
        ((UILabel*)headerView.subviews.lastObject).text = str;
    }
    
    
        
    
    return headerView;
    
}
//设置分区头
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return CGSizeMake(self.cityVC.width, 35);
    }
    return CGSizeZero;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.cityVScountry.countrycount) {
        return 2;
    }
    return  1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 1)
    {

        return self.cityVScountry.countrycount;
        
    }
    else{

        return  self.cityVScountry.citycount;
    }
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (!self.cityVScountry.countrycount) {
        //  从数组中 按下标取出 每个城市模型数据。
        bourntagcitylistModel * citydata = self.cityVScountry.citylist[indexPath.row];
        cityVScountryCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cityVScountryCell" forIndexPath:indexPath];
        [cell.photo setImageURL:citydata.photo.wx_URL];
        cell.cnname.text = citydata.cnname;
        cell.enname.text = citydata.enname;
        //  重口味样式毛玻璃 。使用时 如果父视图用了 自动布局  则子视图必须也要使用 否则无法显示出来
       
        return cell;

    }else
    {
        if (indexPath.section == 0)
        {
            //  从数组中 按下标取出 每个城市模型数据。
            bourntagcitylistModel * citydata = self.cityVScountry.citylist[indexPath.row];
            cityVScountryCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cityVScountryCell" forIndexPath:indexPath];
            [cell.photo setImageURL:citydata.photo.wx_URL];
            cell.cnname.text = citydata.cnname;
            cell.enname.text = citydata.enname;
            return cell;
        }
       else
        {
            // 从数组中 按下标取出 每个国家模型数据
            bourncountrylistModel* countrydata = self.cityVScountry.countrylist[indexPath.row];
            countryCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"countryCell" forIndexPath:indexPath];
            [cell.photo setImageURL:countrydata.photo.wx_URL];
            cell.cnname.text = countrydata.cnname;
            cell.enname.text = countrydata.enname;

           return cell;
        }
    }

}
//  点击   城市或国家列表之后跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建 VC
    BournCityVC* city = [BournCityVC new];
    //   传值.
    city.idField =
    self.cityVScountry.citylist[indexPath.row].idField;
    //   跳转
    [self presentViewController:city animated:YES completion:^{
        
    }];
}




@end
