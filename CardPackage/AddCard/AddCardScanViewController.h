//
//  AddCardScanViewController.h
//  CardPackage
//
//  Created by lv on 16/7/16.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZBarSDK.h>

@interface AddCardScanViewController : UIViewController<ZBarReaderViewDelegate>

@property (nonatomic, copy) void (^isScanOk)(NSString *scanInfo);
@property (nonatomic, copy) void (^isCannel)();

@end
