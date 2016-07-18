//
//  Card+CoreDataProperties.h
//  CardPackage
//
//  Created by lv on 16/7/16.
//  Copyright © 2016年 lv. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Card (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *shopName;
@property (nullable, nonatomic, retain) NSString *shopAddress;
@property (nullable, nonatomic, retain) NSString *cardNum;
@property (nullable, nonatomic, retain) NSString *cardType;

@end

NS_ASSUME_NONNULL_END
