//
//  HttpRequestManager.m
//  HuituApp
//
//  Created by 曹永超 on 17/3/16.
//  Copyright © 2017年 huitu. All rights reserved.
//

#import "HttpRequestManager.h"

@implementation HttpRequestManager


+ (void) getWithURL:(NSString *) urlString isJson:(BOOL)isJson dismssHUB:(BOOL)dismiss requestID:(NSString *)ID delegate:(id<HttpRequestDelegate>)delegate {
    
    //[[self new] getWithURL:urlString isJson:isJson dismssHUB:dismiss requestID:ID delegate:delegate];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue new] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSLog(@"****************************************************************%@   *****************************   %@ **********************  %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding],ID,delegate);
        
        if (connectionError) {
            
            if (![[NSThread currentThread] isMainThread]) {
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    
                    [delegate httpError:500 requestID:ID];
                });
                
            }
            else {
                
                [delegate httpError:500 requestID:ID];
            }
            
            return ;
        }
        
        if (data) {
            
            
            if (![[NSThread currentThread] isMainThread]) {
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    
                    if(![TTool checkData:data]) {
                        
                        return;
                    }
                    
                    [delegate httpHandle:data requestID:ID isJson:isJson];
                });
                
            }
            else {
                
                if(![TTool checkData:data]) {
                    
                    return;
                }
                
                [delegate httpHandle:data requestID:ID isJson:isJson];
            }
            
        }
        
    }];
    
}

- (void) getWithURL:(NSString *) urlString isJson:(BOOL)isJson dismssHUB:(BOOL)dismiss requestID:(NSString *)ID delegate:(id<HttpRequestDelegate>)delegate {
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"****************************************************************%@   *****************************   %@ **********************",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding],ID);
        
        if (connectionError) {
            
            [delegate httpError:500 requestID:ID];
            
            return ;
        }
        
        //NSLog(@"%@",response);
        
        if (data) {
            
            [delegate httpHandle:data requestID:ID isJson:isJson];
        }
        
    }];
    
}

//+ (void)uploadFileWithURL:(NSString *)urlStr
//                 filesDic:(NSDictionary *)fileDic
//                  pramDic:(NSDictionary *)pramDic
//                 delegate:(id<HttpUploadDelegate>)delegate{
//    
//    
//    [[self new] uploadFileWithURL:urlStr filesDic:fileDic pramDic:pramDic delegate:delegate];
//    
//    /*
//    
//    NSMutableData *bodyData = [[NSMutableData alloc]init];
//    
//    NSString *boundaryString = [self randomMPBoundaryString];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    
//    for (NSString *key in [fileDic allKeys]) {
//        
//        NSMutableString *body = [[NSMutableString alloc]init];
//        
//        [body appendFormat:@"--%@\r\n",boundaryString];
//        
//        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@.jpg\"\r\n",[[key componentsSeparatedByString:@"."] firstObject],key];
//        
//        [body appendFormat:@"Content-Type: image/jpeg\r\n\r\n"];
//        
//        NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
//        
//        [bodyData appendData:data];
//        
//        [bodyData appendData:[fileDic objectForKey:key]];
//        
//        [bodyData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    }
//    
//    for (NSString *key in pramDic) {
//        
//        NSMutableString *body = [[NSMutableString alloc]init];
//        
//        [body appendFormat:@"--%@\r\n",boundaryString];
//        
//        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
//        
//        [body appendFormat:@"%@",pramDic[key]];
//        
//        [bodyData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [bodyData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    }
//    
//    [bodyData appendData:[[NSString stringWithFormat:@"\r\n--%@--",boundaryString]  dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundaryString] forHTTPHeaderField:@"Content-Type"];
//    //设置Content-Length
//    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[bodyData length]] forHTTPHeaderField:@"Content-Length"];
//    
//    [request setHTTPBody:bodyData];
//    [request setHTTPMethod:@"POST"];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        
//        if ([delegate respondsToSelector:@selector(uploadResult:response:error:isDismiss:)]) {
//            
//            [delegate uploadResult:data response:response error:connectionError isDismiss:YES];
//        }
//        
//    }];
//    
//    */
//}
//
//- (void)uploadFileWithURL:(NSString *)urlStr
//                 filesDic:(NSDictionary *)fileDic
//                  pramDic:(NSDictionary *)pramDic
//                 delegate:(id<HttpUploadDelegate>)delegate {
//    
//    NSMutableData *bodyData = [[NSMutableData alloc]init];
//    
//    NSString *boundaryString = [HttpRequestManager randomMPBoundaryString];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    
//    for (NSString *key in [fileDic allKeys]) {
//        
//        NSMutableString *body = [[NSMutableString alloc]init];
//        
//        [body appendFormat:@"--%@\r\n",boundaryString];
//        
//        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@.jpg\"\r\n",[[key componentsSeparatedByString:@"."] firstObject],key];
//        
//        [body appendFormat:@"Content-Type: image/jpeg\r\n\r\n"];
//        
//        NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
//        
//        [bodyData appendData:data];
//        
//        [bodyData appendData:[fileDic objectForKey:key]];
//        
//        [bodyData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    }
//    
//    for (NSString *key in pramDic) {
//        
//        NSMutableString *body = [[NSMutableString alloc]init];
//        
//        [body appendFormat:@"--%@\r\n",boundaryString];
//        
//        [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
//        
//        [body appendFormat:@"%@",pramDic[key]];
//        
//        [bodyData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        [bodyData appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    }
//    
//    [bodyData appendData:[[NSString stringWithFormat:@"\r\n--%@--",boundaryString]  dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundaryString] forHTTPHeaderField:@"Content-Type"];
//    //设置Content-Length
//    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[bodyData length]] forHTTPHeaderField:@"Content-Length"];
//    
//    [request setHTTPBody:bodyData];
//    [request setHTTPMethod:@"POST"];
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        
//        if ([delegate respondsToSelector:@selector(uploadResult:response:error:isDismiss:)]) {
//            
//            [delegate uploadResult:data response:response error:connectionError isDismiss:YES];
//        }
//        
//    }];
//    
//}
//
//+ (void)loadImage:(NSString *)url imageView:(UIImageView *)imageView placeholderImage:(NSString *)placeholderImage {
//    
//    //获取图片的name
//    NSRange nmRange= [url rangeOfString:@"/" options:NSBackwardsSearch];
//    if (nmRange.location == NSNotFound) {
//        
//        imageView.image = [UIImage imageNamed:placeholderImage];
//        
//        return;
//    }
//    
//    NSString *newNm = [url substringFromIndex:nmRange.location + 1];
//    //创建沙盒路径
//    NSString *newFile = [[TTool getSandBoxPathWithURL:GStrOriginalPath] stringByAppendingFormat:@"/%@",newNm];
//    
//    NSFileManager *manager = [NSFileManager defaultManager];
//    
//    if (![manager fileExistsAtPath:newFile]) {//沙盒中没有该图片 进行网络请求
//        
//        NSURL *URL = [NSURL URLWithString:url];
//        
//        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//        
//        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//           
//            if (data) {//获取到数据（仍然需要判断）
//                
//                if(data.length > 1000) {//对文件进行安全判断（过小时可以排除是图片的可能）
//                    
//                    [manager createFileAtPath:newFile contents:data attributes:nil];//存到沙盒中
//                    
//                    imageView.image = [UIImage imageWithContentsOfFile:newFile];
//                }
//                
//            }
//            
//        }];
//    }
//    else {//图片在本地已经存在（不需要网络请求）
//        
//        if([[manager attributesOfItemAtPath:newFile error:nil] fileSize] > 1000) {//对文件进行安全判断（过小是认为是非法文件）
//            
//            NSData *data = [NSData dataWithContentsOfFile:newFile];
//            
//            imageView.image = [UIImage imageWithData:data];
//        }
//        else {//非法文件 (移除)
//            
//            [manager removeItemAtPath:newFile error:nil];
//            //重新请求
//            [self loadImage:url imageView:imageView placeholderImage:placeholderImage];
//        }
//    }
//    
//}
//
+ (void)loadAvater:(NSString *)url owver:(UIImageView *)imageView placeholderImage:(NSString *)placeholderImage {
    
    //获取图片的name
    NSRange nmRange= [url rangeOfString:@"/" options:NSBackwardsSearch];
    if (nmRange.location == NSNotFound) {
        
        return;
    }
    
    
    //如果没有请求到头像或者头像不符合标准 则用之前的头像来代替
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:[TTool getSandBoxPathWithURL:GStrAvaterPath]];
    
    if ([[enumerator allObjects] count] > 0) {
        
        for (NSString *fileName in enumerator) {
            
            imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:[[TTool getSandBoxPathWithURL:GStrAvaterPath] stringByAppendingPathComponent:fileName]]];
            
            //imageView.image = [UIImage imageWithContentsOfFile:];
        }
        
    }
    else {
        imageView.image = [UIImage imageNamed:placeholderImage];
    }
    
    NSString *newNm = [url substringFromIndex:nmRange.location + 1];
    //创建沙盒路径
    NSString *newFile = [[TTool getSandBoxPathWithURL:GStrAvaterPath] stringByAppendingFormat:@"/%@.gif",newNm];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:newFile]) {//沙盒中没有该图片 进行网络请求
        
        NSURL *URL = [NSURL URLWithString:url];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            
            if (data) {//获取到数据（仍然需要判断）

                if(data.length > 1000) {//对文件进行安全判断（过小时可以排除是图片的可能）
                    
                    //移除之前的头像
                    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:[TTool getSandBoxPathWithURL:GStrAvaterPath]];
                    for (NSString *fileName in enumerator) {
                        [[NSFileManager defaultManager] removeItemAtPath:[[TTool getSandBoxPathWithURL:GStrAvaterPath] stringByAppendingPathComponent:fileName] error:nil];
                    }
                    
                    [manager createFileAtPath:newFile contents:data attributes:nil];//存到沙盒中
                    
                    imageView.image = [UIImage imageWithContentsOfFile:newFile];
                    
                    //[HTTool refreshTimeWithID:M_AVATER];
                    
                    return ;
                }
                
            }
            
        }];
    }
    else {//图片在本地已经存在（不需要网络请求）
        
        if([[manager attributesOfItemAtPath:newFile error:nil] fileSize] > 1000) {//对文件进行安全判断（过小是认为是非法文件）
            
            NSData *data = [NSData dataWithContentsOfFile:newFile];
            
            imageView.image = [UIImage imageWithData:data];
        }
        else {//非法文件 (移除)
            
            [manager removeItemAtPath:newFile error:nil];
            //重新请求
            [self loadImage:url imageView:imageView placeholderImage:placeholderImage];
        }
    }
}

+ (void)doPost:(NSString *)url data:(NSData *)bodyData dismssHUB:(BOOL)dismiss requestID:(NSString *)requestID isJson:(BOOL)isJson delegate:(id<HttpRequestDelegate>)delegate {
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    request.HTTPMethod = @"POST";
    
    [request setHTTPBody:bodyData];
    
    NSOperationQueue *queue=[NSOperationQueue mainQueue];
    
    NSLog(@"%@",[NSJSONSerialization JSONObjectWithData:bodyData options:NSJSONReadingMutableContainers error:nil]);
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError) {
            
            [delegate httpError:500 requestID:requestID];
            
            return ;
        }
        
        if (data) {

            [delegate httpHandle:data requestID:requestID isJson:isJson];
        }
    }];
}

//随机分割符
//+ (NSString *)randomMPBoundaryString {
//    
//    NSMutableString *randomString = [NSMutableString string];
//    
//    for (int i = 0; i < 10; i ++) {
//        
//        [randomString appendString:[NSString stringWithFormat:@"%d",arc4random()%100]];
//    }
//    
//    return [NSString stringWithFormat:@"----------%@",randomString];
//}
//
@end
