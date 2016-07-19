//
//  ViewController.m
//  CardPackage
//
//  Created by lv on 16/7/15.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Hex.h"
#import "CardPackageCell.h"

//添加卡
#import "AddCardViewController.h"

#import "CardDetailViewController.h"

@interface ViewController ()
{
    UITableView *cardTableView;
    NSMutableArray *cardArray;
}

@end

@implementation ViewController

- (void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithHex: @"363636"], NSForegroundColorAttributeName, [UIFont systemFontOfSize: 17.f], NSFontAttributeName, nil]];
    [self.view setBackgroundColor: View_BgColor];
    self.title = @"卡包";
    
    [self gainAllCardInfo];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.leftBarButtonItem = nil;
    UIButton *rightBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [rightBtn setFrame: CGRectMake( 0, 0, 20, 20)];
    [rightBtn setTitle: @"+" forState: UIControlStateNormal];
    [rightBtn setTitleColor: [UIColor colorWithHex: @"363636"] forState: UIControlStateNormal];
    [rightBtn.titleLabel setFont: [UIFont systemFontOfSize: 23.f]];
    [rightBtn addTarget: self action: @selector(rightBtnClick) forControlEvents: UIControlEventTouchUpInside];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView: rightBtn];
    self.navigationItem.rightBarButtonItem = right;
    
    cardArray = [[NSMutableArray alloc] init];
    
    cardTableView = [[UITableView alloc] initWithFrame: CGRectMake( 0, 64, iPhoneWidth, iPhoneHeight-154)];
    cardTableView.delegate = self;
    cardTableView.dataSource = self;
    cardTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [cardTableView setBackgroundColor: [UIColor clearColor]];
    [cardTableView registerClass: [CardPackageCell class] forCellReuseIdentifier:@"CardPackageCell"];
    [self.view addSubview: cardTableView];
}

#pragma mark - UITableViewData / UITableViewDataSource
#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cardArray count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95*iPhoneScale;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardPackageCell *cell = [tableView dequeueReusableCellWithIdentifier: @"CardPackageCell"];
    [cell setBackgroundColor: [UIColor clearColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.cardInfo = cardArray[indexPath.row];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardDetailViewController *cardDetailVC = [[CardDetailViewController alloc] init];
    cardDetailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController: cardDetailVC animated: YES];
}

#pragma mark - 所有卡数据
- (void) gainAllCardInfo
{
    [cardArray removeAllObjects];
    cardArray = [ApplicationDelegate selectData: @"**"];
    [cardTableView reloadData];
}

#pragma mark - rightBtnClick/添加卡
- (void) rightBtnClick
{
    AddCardViewController *addCardVC = [[AddCardViewController alloc] init];
    addCardVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController: addCardVC animated: YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
