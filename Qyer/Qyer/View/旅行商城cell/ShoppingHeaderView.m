//
//  ShoppingCell.m
//  Qyer
//
//  Created by tarena15 on 2016/11/19.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "ShoppingHeaderVIew.h"

@implementation ShoppingHeaderView
//-(UIView *)view
//{
//    if (!_view)
//    {
//        _view = [UIView new];
//        [self.contentView addSubview:_view];
//        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(0);
//            make.height.equalTo(160);
//        }];
//        [_view setBackgroundColor:[UIColor whiteColor]];
//    }
//    return _view;
//}

-(NSArray<UIButton *> *)headerBtn
{
    if (!_headerBtn)
    {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 10; i ++)
        {
            UIButton *btn = [UIButton new];
            [self addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(60);
                //make.width.equalTo(40);
                
                if ( i >= 0 && i <= 4 )
                {
                    make.top.equalTo(15);
 
                    if (i == 0)
                    {
                        make.left.equalTo(20);
                    }
                    else
                    {
                        make.left.equalTo(lastView.mas_right).equalTo(10);
                        make.width.equalTo(lastView);
                        if (i == 4)
                        {
                            make.right.equalTo(-20);
                        }
                    }
                }
                else if ( i >= 5 && i <= 9 )
                {
                    make.top.equalTo(120);
                    
                    if ( i == 5 )
                    {
                        make.left.equalTo(20);
                    }
                    else
                    {
                        make.left.equalTo(lastView.mas_right).equalTo(10);
                        make.width.equalTo(lastView);

                        if ( i == 9 )
                        {
                            make.right.equalTo(-20);
                        }
                    }
                }
                
             }];
            lastView = btn;
            [tmpArr addObject:btn];
        }
        _headerBtn = tmpArr.copy;
    }
    return _headerBtn;
}

-(NSArray<UILabel *> *)headerLB
{
    if (!_headerLB)
    {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 10; i ++)
        {
            UILabel *lb = [UILabel new];
            [self addSubview:lb];
            [lb mas_makeConstraints:^(MASConstraintMaker *make) {
                
                if ( i >= 0 && i <= 4 )
                {
                    make.top.equalTo(85);
                    if (i == 0)
                    {
                        make.left.equalTo(20);
                    }
                    else
                    {
                        make.left.equalTo(lastView.mas_right).equalTo(10);
                        make.width.equalTo(lastView);
                        if (i == 4)
                        {
                            make.right.equalTo(-20);
                        }
                    }
                }
                else if ( i >= 5 && i <= 9 )
                {
                    make.top.equalTo(190);
                    
                    if ( i == 5 )
                    {
                        make.left.equalTo(20);
                    }
                    else
                    {
                        make.left.equalTo(lastView.mas_right).equalTo(10);
                        make.width.equalTo(lastView);
                        
                        if ( i == 9 )
                        {
                            make.right.equalTo(-20);
                        }
                    }
                }
            }];
            
            lb.font = [UIFont systemFontOfSize:14.0];
            lb.textAlignment = NSTextAlignmentCenter;
            lastView = lb;
            [tmpArr addObject:lb];
        }
        _headerLB = tmpArr.copy;
    }
    return _headerLB;
}
@end
