//
//  CityheadCell.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/23.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "CityheadCell.h"

@implementation CityheadCell

-(iCarousel *)icvc
{
    if (!_icvc) {
        _icvc = [iCarousel new];
        [self.contentView addSubview:_icvc];
        [_icvc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 50, 0));
        }];
//        _icvc.delegate = self;
//        _icvc.dataSource = self;
        _icvc.scrollSpeed = 0;
        
    }
    return _icvc;
}
#pragma mark ----- icvc  数据源  代理
//设置分区
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.picture.count;
}
//  每个 carousel 显示什么
-(UIView*)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
     view = [UIImageView new];
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
@end
