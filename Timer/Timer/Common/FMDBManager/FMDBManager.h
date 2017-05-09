//
//  FMDBManager.h
//  HuituApp
//
//  Created by 曹永超 on 17/3/15.
//  Copyright © 2017年 huitu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface FMDBManager : NSObject

//设置单例
+ (FMDBManager *)sharedManager;

- (void)createTable ;

- (FMResultSet *)selectFromTableWithSQLString:(NSString *)sqlString ;

- (void)updateTableWithSQLString:(NSString *)sqlString;

- (void)close;

@end
