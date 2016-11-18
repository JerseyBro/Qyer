//
//  AllViewController.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/18.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "AllViewController.h"
#import "ShoppingViewController.h"
#import "BournViewController.h"
#import "CommunityViewController.h"
#import "RecommendViewController.h"
#import "MineViewController.h"

@interface AllViewController ()
//旅行商城
@property (nonatomic) ShoppingViewController * shoppingVC;
//目的地
@property (nonatomic) BournViewController * bournVC;
//社区
@property (nonatomic) CommunityViewController * communityVC;
//推荐
@property (nonatomic) RecommendViewController * recommendVC;
//我的
@property (nonatomic) MineViewController *mineVC;
@end

@implementation AllViewController
#pragma mark - Lazy
-(MineViewController *)mineVC{
    if (!_mineVC) {
        _mineVC = [MineViewController new];
        _mineVC.title = @"我的";
    }
    return _mineVC;
}

-(RecommendViewController *)recommendVC{
    if (!_recommendVC) {
        _recommendVC = [RecommendViewController new];
        _recommendVC.title = @"推荐";
    }
    return _recommendVC;
}

-(CommunityViewController *)communityVC{
    if (!_communityVC) {
        _communityVC = [CommunityViewController new];
        _communityVC.title = @"社区";
    }
    return _communityVC;
}

-(BournViewController *)bournVC{
    if (!_bournVC) {
        _bournVC = [BournViewController new];
        _bournVC.title = @"目的地";
    }
    return _bournVC;
}

-(ShoppingViewController *)shoppingVC{
    if (!_shoppingVC) {
        _shoppingVC = [ShoppingViewController new];
        _shoppingVC.title = @"旅行商城";
    }
    return _shoppingVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //修改所有item的选中状态时的默认文字颜色
    
    
    // Do any additional setup after loading the view.
    UINavigationController *shoppingNavi = [[UINavigationController alloc] initWithRootViewController:self.shoppingVC];
    UINavigationController *BournNavi = [[UINavigationController alloc] initWithRootViewController:self.bournVC];
    UINavigationController *CommunityNavi = [[UINavigationController alloc] initWithRootViewController:self.communityVC];
    UINavigationController *RecommendNavi = [[UINavigationController alloc] initWithRootViewController:self.recommendVC];
    UINavigationController *MineNavi = [[UINavigationController alloc] initWithRootViewController:self.mineVC];
    self.viewControllers = @[RecommendNavi, BournNavi, shoppingNavi, CommunityNavi, MineNavi];
    //设置了全局的所有tabbarItem的文字样式. 选中时的
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:35]} forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
