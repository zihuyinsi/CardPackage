//
//  AddCardViewController.m
//  CardPackage
//
//  Created by lv on 16/7/16.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "AddCardViewController.h"
#import "AddCardScanViewController.h"
#import "AddCardView.h"

@interface AddCardViewController ()
{
    AddCardView *addCardView;
}

@end

@implementation AddCardViewController

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithHex: @"363636"], NSForegroundColorAttributeName, [UIFont systemFontOfSize: 17.f], NSFontAttributeName, nil]];
    [self.view setBackgroundColor: View_BgColor];
    self.title = @"添加卡";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = nil;
    UIButton *rightBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [rightBtn setFrame: CGRectMake( 0, 0, 40, 20)];
    [rightBtn setTitle: @"扫描" forState: UIControlStateNormal];
    [rightBtn setTitleColor: [UIColor colorWithHex: @"363636"] forState: UIControlStateNormal];
    [rightBtn.titleLabel setFont: [UIFont systemFontOfSize: 15.f]];
    [rightBtn addTarget: self action: @selector(rightBtnClick) forControlEvents: UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView: rightBtn];
    self.navigationItem.rightBarButtonItem = right;

    [self initAllView];
}

- (void) initAllView
{
    addCardView = [[AddCardView alloc] initWithFrame: CGRectMake( 0, 80, iPhoneWidth, 280*iPhoneScale)];
    [addCardView setBackgroundColor: [UIColor whiteColor]];
    [self.view addSubview: addCardView];
}

- (void) rightBtnClick
{
    AddCardScanViewController *addCardSacnVC = [[AddCardScanViewController alloc] init];
    addCardSacnVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController: addCardSacnVC animated: YES];
    addCardSacnVC.isScanOk = ^(NSString *scanInfo)
    {
    
    };
    addCardSacnVC.isCannel = ^(){};
}

#pragma mark - 
- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
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
