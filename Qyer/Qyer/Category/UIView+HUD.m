//
//  UIView+HUD.m
//  Day11-汽车之家
//
//  Created by tarena on 16/11/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIView+HUD.h"

@implementation UIView (HUD)

- (void)showMsg:(NSString *)msg{
    //先把别的提示都取消掉
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
//    /// UIActivityIndicatorView.
//    MBProgressHUDModeIndeterminate,
//    /// A round, pie-chart like, progress view.
//    MBProgressHUDModeDeterminate,
//    /// Horizontal progress bar.
//    MBProgressHUDModeDeterminateHorizontalBar,
//    /// Ring-shaped progress view.
//    MBProgressHUDModeAnnularDeterminate,
//    /// Shows a custom view.
//    MBProgressHUDModeCustomView,
//    /// Shows only labels.
//    MBProgressHUDModeText
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = msg;
    [hud hideAnimated:YES afterDelay:1];
}

- (void)showBusy{
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    //最多显示30秒, 由于显示繁忙时 用户无法触摸屏幕,所以体验比较糟糕.逐渐被抛弃
    [hud hideAnimated:YES afterDelay:30];
}

- (void)hideBusy{
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
}
@end
