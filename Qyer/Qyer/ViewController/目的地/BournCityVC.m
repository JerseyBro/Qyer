//
//  BournCityVC.h
//  Qyer
//
//  Created by 😘王艳 on 2016/11/23.
//  Copyright © 2016年 DKD. All rights reserved.
//
#import "BournCityVC.h"
#import "CityheadCell.h"
#import "HeaddownCell.h"
#import "TwoHeaddownCell.h"
#import "ThreeHeaddownCell.h"
#import "ThreeCell.h"
#import "HeadCell.h"
//屏幕宽
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface BournCityVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,iCarouselDelegate,iCarouselDataSource>



@property(nonatomic) CityVSCountryModel* datalist;

@property(nonatomic) NSArray<NSString*> *picture;

@property(nonatomic) UICollectionView *cityView;

@property(nonatomic) UICollectionViewFlowLayout* layou;

@property(nonatomic) iCarousel* icvc;

@property(nonatomic) UIView* HeadView;

@property(nonatomic) NSTimer* timer;
@end

@implementation BournCityVC

#pragma  mark ------ iC代理
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.picture.count;
}
//  每个 carousel 显示什么
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIImageView alloc]initWithFrame:carousel.bounds];
    }
    [((UIImageView*)view) setImageURL:self.picture[index].wx_URL];
    return view;
}
//     设置允许循环滚动
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

#pragma mark ----- HeadView懒加载
-(UIView *)HeadView
{
    if (!_HeadView) {
          CGFloat hight = HEIGHT * 467 / 1135;
        _HeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, hight)];
            if (!_icvc) {
                _icvc = [iCarousel new];
                [self.HeadView addSubview:_icvc];
                [_icvc mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(0);
                }];
                self.icvc.delegate = self;
                self.icvc.dataSource = self;
                _icvc.scrollSpeed = 0;
        }
    }
    return _HeadView;
}



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
        _cityView.backgroundColor = [UIColor whiteColor];
        _cityView.scrollEnabled = YES;
        //注册单元格
        [_cityView registerClass:[CityheadCell class] forCellWithReuseIdentifier:@"CityheadCell"];
        [_cityView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        [_cityView registerClass:[ThreeCell class] forCellWithReuseIdentifier:@"ThreeCell"];
        [_cityView registerClass:[HeadCell class] forCellWithReuseIdentifier:@"HeadCell"];
        //注册分区头
        [_cityView registerClass:[HeaddownCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaddownCell"];
        [_cityView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView"];
        [_cityView registerClass:[ThreeHeaddownCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ThreeHeaddownCell"];

    }
    return _cityView;
}
#pragma mark ----- ViewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加到父类中.并调用其懒加载
   
    //  获取数据

    [NetManager getBournCityVSCountryModelWithidField:self.idField completionHandler:^(CityVSCountryModel *pic, NSError *error) {
        NSLog(@"里%@",[NSThread currentThread]);
        self.datalist = pic;
        [self.view addSubview:self.cityView];
        //添加返回按钮
        [self createWithgoback];
    }];


    
}
//  返回按钮
-(void)createWithgoback
{
    UIButton* goback = [UIButton buttonWithType:UIButtonTypeSystem];
    [goback setImage:[UIImage imageNamed:@"TabBar_Recommend_24x24_"] forState:UIControlStateNormal];
    [self.view addSubview:goback];
    [goback mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(15);
        make.top.equalTo(35);
    }];
    [goback bk_addEventHandler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    } forControlEvents:UIControlEventTouchUpInside];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ----- Collection 代理


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    if (section == 1) {
        return 2;
    }
    if (section == 2) {
        return 6;
    }
    return 0;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CityheadCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CityheadCell" forIndexPath:indexPath];
    CiCodataModel* Model = self.datalist.data;
    if (indexPath.section == 0) {
        if (indexPath.row) {
        [cell image];
        cell.cityName.text = [Model.cnname stringByAppendingString:@"锦囊"];
        cell.bookNum.text = [NSString stringWithFormat:@"全部%ld本",Model.guideNum];
       
        [cell image2];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
        }else
        {
            HeadCell* cell = [self.cityView dequeueReusableCellWithReuseIdentifier:@"HeadCell" forIndexPath:indexPath];
            self.picture = self.datalist.data.cityPic;
            [cell.contentView addSubview:self.HeadView];
            [self.icvc reloadData];
            _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3.0 block:^(NSTimer *timer) {
                [self.icvc setCurrentItemIndex:self.icvc.currentItemIndex + 1];
            } repeats:YES];
            cell.enname.text = Model.enname;
            cell.cnname.text = Model.cnname;
            NSString* str = [NSString stringWithFormat:@"%@  %@~%@",Model.weather.info,Model.weather.low_temp,Model.weather.high_temp];
//            NSString* str = [Model.weather.info st]
            cell.info.text = str;
            [cell tour];
            return cell;
        }
    }

    if (indexPath.section  ==  1) {
        if (indexPath.row == 0) {
            UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
            
            UIImageView* image = [UIImageView new];
            [image setImageURL:Model.city_map.wx_URL];
//            NSLog(@"%@",Model.city_map);
            
            [cell.contentView addSubview:image];
            [image mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(0);
            }];
            image.contentMode = UIViewContentModeScaleAspectFill;
            return cell;
        }
        if (indexPath.row == 1) {
            cell.image.image = [UIImage imageNamed:@"CCWant_Selected_20x20_@1x"];
            cell.cityName.text = [NSString stringWithFormat:@"我收藏的%@目的地",Model.cnname];
            [cell image2];
            cell.backgroundColor = [UIColor whiteColor];
            return cell;
        }
    }
    if (indexPath.section == 2) {
        ThreeCell* cell = [self.cityView dequeueReusableCellWithReuseIdentifier:@"ThreeCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        [cell.icon setImageURL:Model.not_miss.pois[indexPath.row].photo.wx_URL];
        cell.name.text = Model.not_miss.pois[indexPath.row].name;
        cell.grade.text = Model.not_miss.pois[indexPath.row].grade;
        return cell;
    }
    return cell;
}
//-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //  不知道为什么会分区0分区为什么会执行代理方法两次。 使0分区有两个表头。。暂时先用这个方法去解决。。。
    //  因为莫名其妙一个分区 代理方法执行了两次 导致 0分区多了一个头。然后在使用头去引用 带有懒加载的 self.HeadView的时候。 只能是一层的那个头拿到这个指针 加入到了自己里面去。  然后等到第二层头在去引用的时候.得到的是同一个指针 .但是这个指针已经加入到了第一个层分区头里。  除非你先把他从第一个分区头里删除出来 才能引入！！！！！！！！！
    // 解决方案. 在第一层创建出来头的时候  不对其进行任何操作。等第二层界面出来之后在开始对其操作！！！！！！因为这层界面才是我们真正想看到的 .
 


    // Top必去数据
    CiConot_missModel* missModel = self.datalist.data.not_miss;
 
   
    static int num = 0;

    if (indexPath.section == 0) {
        HeaddownCell* headerView =[self.cityView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaddownCell" forIndexPath:indexPath];
        for (UIView *view in headerView.subviews)
        {
            [view removeFromSuperview];
        }
          headerView.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@",headerView);
        if (num == 1) {

//            headerView.enname.text = self.datalist.data.enname;
                NSLog(@"第%d次我是0分区%ld----%ld",num,indexPath.section,indexPath.row);
        }

           num++;
        return headerView;
    }
    if (indexPath.section == 1) {
        HeaddownCell* headerView = [self.cityView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaddownCell" forIndexPath:indexPath];
          headerView.backgroundColor = [UIColor whiteColor];
        NSLog(@"第%d次我是1分区%ld----%ld",num,indexPath.section,indexPath.row);
        num++;
        NSLog(@"%@",headerView);
        return headerView;

    }
    if (indexPath.section == 2) {
    ThreeHeaddownCell* headdown = [self.cityView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ThreeHeaddownCell" forIndexPath:indexPath];

                [headdown title];
        if (missModel.events.count == 2) {
            [headdown.image1 setImageURL:missModel.events[0].photo.wx_URL];
           
            headdown.content1.text = missModel.events[0].name;
            [headdown.image2 setImageURL:missModel.events[1].photo.wx_URL];
            headdown.content2.text = missModel.events[1].name;
        }
        if (missModel.events.count == 1) {
            [headdown.image1 setImageURL:missModel.events[0].photo.wx_URL];
            headdown.content1.text = missModel.events[0].name;
        }
        headdown.backgroundColor = [UIColor whiteColor];
        return headdown;
    }
  
    return nil;
  
}
#pragma mark ----- layou 代理
// 表尾 大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGFloat hight = HEIGHT * 10 / 1135;
    return CGSizeMake(WIDTH, hight);
}
// 表头大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat hight  = 0;
    if (section == 0) {
         hight = HEIGHT * 467 / 1135;
//        hight = 0;
        return CGSizeMake(WIDTH, 1);
        
    }
    if (section == 1) {
        hight = HEIGHT * 385 / 1135;
 
    }
    if (section == 2) {
        hight = Higt;
    }
    return CGSizeMake(WIDTH, hight);
    
}

// 边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 2) {
        CGFloat widg = (WIDTH) * 30  / 640;
        return UIEdgeInsetsMake(20, widg, 50, widg);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
// 行
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 2) {
        return 25;
    }
    return 0;
}
// 列
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 2) {
        return 10;
    }
    return 0;
}
// item 大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // CGFloat hight = HEIGHT *
    if (!indexPath.section)
    {
        if (indexPath.row) {
            return CGSizeMake(WIDTH,HEIGHT * 90 / 1135);
        }else return CGSizeMake(WIDTH, (HEIGHT) * 467 / 1135);
        
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
    if (indexPath.section == 2) {
        return CGSizeMake((WIDTH) * 180 / 640, (HEIGHT) * 320 / 1135);
    }
    return CGSizeMake(0, 0);
}

@end
