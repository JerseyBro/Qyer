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
-(RecommendViewController *)recommendVC{
    if (!_recommendVC) {
        _recommendVC = [RecommendViewController new];
        _recommendVC.title = @"推荐";
        _recommendVC.tabBarItem.image = [UIImage imageNamed:@"TabBar_Recommend_24x24_"];
        _recommendVC.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBar_Recommend_Highlight_24x24_"];
        //_recommendVC.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBar_Background_Highlight_150x100_"];
    }
    return _recommendVC;
}

-(BournViewController *)bournVC{
    if (!_bournVC) {
        _bournVC = [BournViewController new];
        _bournVC.title = @"目的地";
        _bournVC.tabBarItem.image = [UIImage imageNamed:@"TabBar_Place_24x24_"];
        _bournVC.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBar_Place_Highlight_24x24_"];
    }
    return _bournVC;
}

-(ShoppingViewController *)shoppingVC{
    if (!_shoppingVC) {
        _shoppingVC = [ShoppingViewController new];
        _shoppingVC.title = @"旅行商城";
        _shoppingVC.tabBarItem.image = [UIImage imageNamed:@"TabBar_Shop_24x24_"];
        _shoppingVC.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBar_Shop_Highlight_24x24_"];
    }
    return _shoppingVC;
}

-(CommunityViewController *)communityVC{
    if (!_communityVC) {
        _communityVC = [CommunityViewController new];
        _communityVC.title = @"社区";
        _communityVC.tabBarItem.image = [UIImage imageNamed:@"TabBar_Community_24x24_"];
        _communityVC.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBar_Community_Highlight_24x24_"];
    }
    return _communityVC;
}

-(MineViewController *)mineVC{
    if (!_mineVC) {
        _mineVC = [MineViewController new];
        _mineVC.title = @"我的";
        _mineVC.tabBarItem.image = [UIImage imageNamed:@"TabBar_Mine_24x24_"];
        _mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"TabBar_Mine_Highlight_24x24_"];
    }
    return _mineVC;
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
    //[[UITabBar appearance] setsubu:[UIImage imageNamed:@"TabBar_Background_Highlight_150x100_"]];
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
