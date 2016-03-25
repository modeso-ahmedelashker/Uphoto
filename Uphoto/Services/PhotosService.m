//
//  PhotosService.m
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import "PhotosService.h"

@implementation PhotosService

- (void)downloadGalleryWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    
//    NSString *url = [NSString stringWithFormat:@"%@/%@", kAPIBaseURL, kAPIGallery];
//    DLog(@"Requesting data: %@", url);
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
//    manager.requestSerializer.timeoutInterval = 30;
//    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/rss+xml"];
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSXMLParser *parser = responseObject;
//        NSDictionary *data = [NSDictionary dictionaryWithXMLParser:parser];
//        
//        DLog(@"Data downloaded: %@", url);
//        
//        success(data);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        failure([NSString stringWithFormat:@"%@ ", error.localizedDescription]);
//        
//        if (_retryIndicator < 2) {
//            [self retry:nil success:success failure:failure];
//        }
//    }];
}

@end
