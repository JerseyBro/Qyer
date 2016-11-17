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
@property (nonatomic) NSArray<QyerModel *> *dataList;
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIView *touView;
@property (nonatomic) UIPageControl *pageC;
@end

@implementation ViewController

#pragma mark - iC Delegate
-(NSArray<QyerModel *> *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList.copy;
}
-(UIView *)touView
{
    if (!_touView) {
        _touView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 200, 200)];
        _touView.backgroundColor = [UIColor yellowColor];
        [self.view addSubview:_touView];
        
        _ic = [iCarousel new];
        [_touView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = 0;
    }
    return _touView;
}
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 4;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc]initWithFrame:carousel.bounds];
    }
//    NSArray<QyerDataSlideModel *> *slideModel  = _dataList[index].data.slide;
    NSArray<QyerDataSlideModel *> *slideModel = _dataList[index].data.slide;
    [((UIImageView *)view)setImageURL:slideModel[index].photo.wx_URL];
    return view;
}

-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pageC.currentPage = carousel.currentItemIndex;
//    NSArray<QyerDataSlideModel *> *slideModel =
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [NetManager getTouWithPage:0 completionHandler:^(NSArray<QyerModel *> *pic, NSError *error) {
        if (!error) {
//            [self.dataList addObjectsFromArray:pic];
//            self.dataList = pic.mutableCopy;
//            [self.dataList addObjectsFromArray:pic];
            self.dataList  = pic;
            
            
            [self touView];
            [self.ic reloadData];
        }
    }];
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


@end
