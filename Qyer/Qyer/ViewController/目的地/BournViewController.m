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
@interface BournViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
//目的地视图层 tableview
@property(nonatomic)UITableView *bournView;
//城市VS国家视图层   colletionview
@property(nonatomic)UICollectionView* cityVC;
//目的地数据
@property(nonatomic)NSArray<bourndataModel*>* bourndata;
//城市VS国家列表类
@property(nonatomic)bourntagdataModel* cityVScountry;
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
        _bournView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 90, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        //去掉表尾
        self.bournView.tableFooterView = [UIView new];
        // 颜色
        self.bournView.backgroundColor = [UIColor grayColor];
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
        layou.sectionInset = UIEdgeInsetsMake(20, 30, 20, 30);
        layou.minimumLineSpacing = 20;
        layou.minimumInteritemSpacing = 20;
        CGFloat width  = (long)(([UIScreen mainScreen].bounds.size.width - 80 - self.bournView.width) / 2);
        CGFloat high = width * 138 / 200;
        layou.itemSize = CGSizeMake(width,high);
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
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.cityVScountry = self.bourndata[indexPath.row].tagdata;
    [self.cityVC reloadData];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
#pragma mark ------ Colletionview data source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.cityVScountry.countrycount) {
        NSLog(@"二个分区");
        return 2;
    }
    NSLog(@"一个分区");
    return  1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 1)
    {
        NSLog(@"分区二有%ldge",self.cityVScountry.countrycount);
        return self.cityVScountry.countrycount;
        
    }
    else{
        NSLog(@"无");
        NSLog(@"分区一有%ld个",self.cityVScountry.citycount);
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
        NSLog(@"haha----");
         NSLog(@"无");
        NSLog(@"%@",cell);
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
            NSLog(@"haha");
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
            NSLog(@"嘿嘿");
           return cell;
        }
    }

}
    //复用 查找 城市 cell


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
