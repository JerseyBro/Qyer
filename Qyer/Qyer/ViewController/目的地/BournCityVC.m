//
//  BournCityVC.h
//  Qyer
//
//  Created by 😘王艳 on 2016/11/23.
//  Copyright © 2016年 DKD. All rights reserved.
//
#import "BournCityVC.h"
//屏幕宽
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface BournCityVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic) UICollectionView *cityView;



@property(nonatomic) UICollectionViewFlowLayout* layou;


@end

@implementation BournCityVC
-(UICollectionViewFlowLayout *)layou
{
    if (!_layou) {
        _layou = [[UICollectionViewFlowLayout alloc]init];
    }
    return _layou;
}
-(UICollectionView*)cityView
{
    if (!_cityView) {
        _cityView = [[UICollectionView alloc]initWithFrame:CGRectMake( 0, 0, WIDTH , HEIGHT) collectionViewLayout:self.layou];
        _cityView.delegate = self;
        _cityView.dataSource = self;
        [_cityView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        _cityView.backgroundColor = [UIColor greenColor];
        _cityView.scrollEnabled = YES;
        [self.cityView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        
    }
    return _cityView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",_cityView);
    [self.view addSubview:self.cityView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ----- Collection 代理

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 2;
    }
    return 0;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.backgroundColor = [UIColor yellowColor];
        return cell;
    }
    if (indexPath.section  ==  1) {
        if (indexPath.row == 0) {
            cell.backgroundColor = [UIColor redColor];
            return cell;
        }
        if (indexPath.row == 1) {
            cell.backgroundColor = [UIColor blueColor];
            return cell;
        }
    }
    return cell;
}
#pragma mark ----- layou 代理
// 边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
// 行
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
// 列
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
// item 大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // CGFloat hight = HEIGHT *
    if (!indexPath.section)
    {
        return CGSizeMake(WIDTH,HEIGHT * 90 / 1135);
    }
    if (indexPath.section == 1)
    {
        if (indexPath.row == 1)
        {
            return CGSizeMake(WIDTH,HEIGHT* 80 / 1135 );
        }
        if (indexPath.row == 0)
        {
            return CGSizeMake(WIDTH, HEIGHT * 166 / 1135);
        }
    }
    return CGSizeMake(0, 0);
}
// 表尾 大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGFloat hight = HEIGHT * 10 / 1135;
    return CGSizeMake(WIDTH, hight);
}
// 表头大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        CGFloat hight = HEIGHT * 467 / 1135;
        return CGSizeMake(WIDTH, hight);
    }
    if (section == 1) {
        CGFloat hight = HEIGHT * 385 / 1135;
        return CGSizeMake(WIDTH, hight);
    }
    return CGSizeMake(0, 0);
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    //UICollectionReusableView* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        headerView.backgroundColor = [UIColor orangeColor];
        return headerView;
    }
    if (indexPath.section == 1) {
        headerView.backgroundColor = [UIColor purpleColor];
        return headerView;
    }
    headerView.backgroundColor = [UIColor whiteColor];
    return headerView;
}
@end
