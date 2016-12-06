//
//  RecommendViewCell.h
//  Qyer
//
//  Created by “Skip、 on 2016/12/2.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendViewCell : UITableViewCell

//  表头view
@property (nonatomic) UIImageView *headerView;
//  标签Lb
@property (nonatomic) UILabel *noteLb;
//  标题Lb
@property (nonatomic) UILabel *titleLb;
//  内容Lb
@property (nonatomic) UILabel *subjectLb;
//  表尾view
@property (nonatomic)UIImageView *footerView;

@end
