//
//  AddCardScanViewController.m
//  CardPackage
//
//  Created by lv on 16/7/16.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "AddCardScanViewController.h"

@interface AddCardScanViewController ()
{
    ZBarReaderView *readerView;
    ZBarCameraSimulator *cameraSim;
}
@end

@implementation AddCardScanViewController

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
    
    // the delegate receives decode results
    readerView = [[ZBarReaderView alloc] initWithFrame: CGRectMake( 0, 64, iPhoneWidth, iPhoneHeight-64)];
    //二维码/条形码识别设置
    ZBarImageScanner *scanner = [ZBarImageScanner new];
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    readerView = [readerView initWithImageScanner: scanner];
    readerView.readerDelegate = self;
    [self.view addSubview: readerView];
    
    [readerView start];
}

- (void) readerView: (ZBarReaderView*) view
     didReadSymbols: (ZBarSymbolSet*) syms
          fromImage: (UIImage*) img
{
    // do something useful with results
    for(ZBarSymbol *sym in syms)
    {
        NSLog(@"sym.data = %@", sym.data);
//        NSLog(@"sym.type = %@", sym.type);
        [readerView stop];

        UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"扫描结果" message: sym.data preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *cannelAction = [UIAlertAction actionWithTitle: @"重新扫描" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [readerView start];

        }];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle: @"确认" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *dataStr = sym.data;
            NSNumber *type = [NSNumber numberWithInteger: sym.type];
            NSMutableDictionary *scanInfo = [[NSMutableDictionary alloc] initWithObjectsAndKeys: dataStr, @"data", type, @"type", nil];
            self.isScanOk(scanInfo);
            [self.navigationController popViewControllerAnimated: YES];
        }];
        [alert addAction: cannelAction];
        [alert addAction: confirmAction];
        [self presentViewController: alert animated: YES completion: nil];
        
        break;
    }
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
