//
//  PhotosService.m
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import "PhotosService.h"
#import <AFNetworking.h>
#import <XMLDictionary.h>
#import "Gallery.h"
#import "GalleryItem.h"

static NSString * const kAPIBaseURL = @"http://www.euroleague.net/euroleague/api";
static NSString * const kAPIGallery = @"gallery";
static NSString * const kAPIParamChannel = @"channel";
static NSString * const kAPIParamTitle = @"title";
static NSString * const kAPIParamPubDate = @"pubDate";
static NSString * const kAPIParamGalleryPermaLink = @"link";
static NSString * const kAPIParamGalleryItems = @"webportal:galleryitems";
static NSString * const kAPIParamGalleryItem = @"galleryitem";
static NSString * const kAPIParamFiles = @"webportal:files";
static NSString * const kAPIParamUrlHighRes = @"webportal:highResUrl";
static NSString * const kAPIParamItem = @"item";

@implementation PhotosService

- (void)downloadGalleryWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure {
    
    NSString *url = [NSString stringWithFormat:@"%@/%@", kAPIBaseURL, kAPIGallery];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    manager.requestSerializer.timeoutInterval = 30;
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/rss+xml"];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSXMLParser *parser = responseObject;
        NSDictionary *data = [NSDictionary dictionaryWithXMLParser:parser];
        
        NSArray *items = [[data valueForKey:kAPIParamChannel] arrayValueForKeyPath:kAPIParamItem];
        NSArray *galleryItems = [@[] mutableCopy];
        
        NSMutableArray *galleries = [NSMutableArray new];
        
        for (NSDictionary *item in items) {
            
            Gallery *gallery = [[Gallery alloc] initWithDictionary:item];
            
            galleryItems = [[item valueForKeyPath:kAPIParamGalleryItems] arrayValueForKeyPath:kAPIParamGalleryItem];
            
            for (NSDictionary *galleryItemData in galleryItems) {
                
                GalleryItem *galleryItem = [[GalleryItem alloc] initWithDictionary:galleryItemData];
                [gallery.items addObject:galleryItem];
            }
            
            [galleries addObject:gallery];
        }

        success(galleries);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure([NSString stringWithFormat:@"%@ ", error.localizedDescription]);
    }];
}

@end
