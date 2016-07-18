//
//  AppDelegate.h
//  CardPackage
//
//  Created by lv on 16/7/15.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

#pragma mark - Core Data
/**
 *  数据存入coredata中
 *
 *  @param dataArray 数据数组
 */
- (void)insertCoreData:(NSMutableArray*)dataArray;

/**
 *  查询数据
 *
 *  @param cardNum 卡号
 *
 *  @return 所有卡信息
 */
- (NSMutableArray*)selectData:(NSString *)cardNum;

/**
 *  删除数据
 *
 *  @param cardNum 卡号
 */
- (void)deleteData: (NSString *)cardNum;

/**
 *  修改卡信息
 *
 *  @param cardNum  卡号
 *  @param cardInfo 卡信息
 */
- (void)updateData:(NSString*)cardNum withCardInfo: (NSMutableDictionary *)cardInfo;


@end

