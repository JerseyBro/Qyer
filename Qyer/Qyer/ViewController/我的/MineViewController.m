//
//  MineViewController.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/18.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "MineViewController.h"
#import "HeaderView.h"
@interface MineViewController ()

#define khigh 220
//@property(nonatomic)UIView* image;

@property(nonatomic)UIView* image;

@end

@implementation MineViewController


//-(void)viewWillAppear:(BOOL)animated
//{
//
//[self.navigationController setNavigationBarHidden:YES animated:YES];
//
//    
//self.navigationController.navigationBar.hidden=YES;
//}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.contentInset = UIEdgeInsetsMake(khigh  , 0, 0, 0);
    self.navigationItem.title = @"个人中心";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"QYNavSettingGreen_40x40_"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.image = [[NSBundle mainBundle]loadNibNamed:@"Headerview" owner:nil options:nil].firstObject;
    [self.tableView addSubview:self.image];
    self.image.frame = CGRectMake(0, -khigh , WIDTH, khigh);

    self.image.autoresizesSubviews = YES;
    
    UIBlurEffect* effe = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    
    UIVisualEffectView *effect = [[UIVisualEffectView alloc]initWithEffect:effe];
    
    effect.alpha = 0.5;
    
    [self.image addSubview:effect];
    
    [effect mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat off_y = scrollView.contentOffset.y;

    if ( -off_y   > khigh   ) {
        CGRect fram = self.image.frame;
        NSLog(@"原有%f",fram.origin.y);
        fram.origin.y = off_y;
        fram.size.height = -off_y;
        
        self.image.frame = fram;
        
        NSLog(@"变化%f",fram.origin.y);
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [UIView new];
    if (section == 0) {
      
        view.backgroundColor = [UIColor yellowColor];
        return view;
    }
    if (section == 1) {
        view.backgroundColor = [UIColor greenColor];
        return view;
    }
    view.backgroundColor = [UIColor grayColor];
    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 60;
    }
//    if (section == 1) {
//        return <#expression#>
//    }
    return 10;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    UITableViewCell* cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"我是第%ld分区，第几%ld行",indexPath.section,indexPath.row];
    // Configure the cell...
    
    return cell;
}


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
