//
//  FMDBManager.m
//  HuituApp
//
//  Created by 曹永超 on 17/3/15.
//  Copyright © 2017年 huitu. All rights reserved.
//

/**
 *数据库管理类
 *数据持久化操作 增、删、查、改
 *
 */

#import "FMDBManager.h"

#define filePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define FilePath [DocumentPath stringByAppendingPathComonent:@"db.sqlite"];

static FMDBManager *local = nil;


static FMDBManager *_manager;
static FMDatabase *_db;

@implementation FMDBManager

+ (instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [[FMDBManager alloc]init];
        
        _db = [FMDatabase databaseWithPath:[self getDataBasePath]];
    });
    
    return _manager;
}

- (void)createTable {
    
    [_db open];
    //用户信息
    [_db executeUpdate:@"create table if not exists users(userID integer primary key,userNm text,password text,countOfNewLetter integer,countOfNewMessage integer,countOfPendingWorks integer,email text,mobile text,userType integer,gender integer,userJob integer,userTag text,realNm text,IDNumber text,signeType integer,signeState integer,IDCardState integer,balance float,frozenedMoney float,cashWithdrawal float)"];
    //图片信息
    [_db executeUpdate:@"create table if not exists pic(number text,state integer,name text,size integer,progress float,path text,createDate text)"];
    
    //收藏的图片
    [_db executeUpdate:@"create table if not exists collection(userID text,picID text,addDate text,favID text,picNm text,picCode text,price text,picURL text)"];
    
    //账户记录
    [_db executeUpdate:@"create table if not exists revenue(flag integer,ID integer,userID integer,date datetime,amount DECIMAL,info text)"];
    
    [_db close];
}

+ (NSString *)getDataBasePath {
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *path = [NSString stringWithFormat:@"%@/Library/Huitu/Huitu.sqlite",NSHomeDirectory()];// @"/Users/cyc/Library/NipicTool/Nipic.sqlite";
    
    if (![manager fileExistsAtPath:path]) {
        
        [manager createDirectoryAtPath:[NSString stringWithFormat:@"%@/Library/Huitu",NSHomeDirectory()] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return path;
}

- (FMResultSet *)selectFromTableWithSQLString:(NSString *)sqlString {
    
    [_db open];
    
    FMResultSet *set = [_db executeQuery:sqlString] ;
    
    return set;
}

- (void)updateTableWithSQLString:(NSString *)sqlString  {
    
    [_db open];
    
    [_db executeUpdate:sqlString];
    
    [_db close];
}

- (void)close {
    
    [_db close];
}

@end
