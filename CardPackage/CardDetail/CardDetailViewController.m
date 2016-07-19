//
//  CardDetailViewController.m
//  CardPackage
//
//  Created by tsou on 16/7/18.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "CardDetailViewController.h"
#import <RSCodeGen.h>

@interface CardDetailViewController ()
{
    UIImageView *codeImageView;
}

@end

@implementation CardDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *img = [CodeGen genCodeWithContents: @"123456789" machineReadableCodeObjectType: AVMetadataObjectTypeCode128Code];

    codeImageView = [[UIImageView alloc] initWithFrame: CGRectMake(10, 80, iPhoneWidth-20, 100)];
    codeImageView.image = img;
    [codeImageView setBackgroundColor: [UIColor whiteColor]];
    [self.view addSubview: codeImageView];
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
