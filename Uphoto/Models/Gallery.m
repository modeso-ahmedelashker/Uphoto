//
//  Gallery.m
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import "Gallery.h"

static NSString * const kAPIParamChannel = @"channel";
static NSString * const kAPIParamTitle = @"title";
static NSString * const kAPIParamPubDate = @"pubDate";
static NSString * const kAPIParamGalleryPermaLink = @"link";
static NSString * const kAPIParamGalleryItems = @"webportal:galleryitems";
static NSString * const kAPIParamGalleryItem = @"galleryitem";
static NSString * const kAPIParamFiles = @"webportal:files";
static NSString * const kAPIParamUrlHighRes = @"webportal:highResUrl";

@implementation Gallery

- (instancetype)initWithDictionary:(NSDictionary *)data {
    
    self = [super init];
    
    if (self) {
        _title = data[kAPIParamTitle];
        //_pubDate = [data[kAPIParamPubDate] toDateLong];
        
        NSString *link = data[kAPIParamGalleryPermaLink];
        if(link) {
            _galleryID = [Gallery removeHost:link];
        } else {
            _galleryID = data[kAPIParamPubDate];
        }
        
        _items = [NSMutableArray new];
    }
    return self;
}

+ (nullable NSString *)primaryKey {
    return @"galleryID";
}

+ (NSString *)removeHost:(NSString *)url {
    
    static NSRegularExpression *regex = nil;
    if (!regex) {
        regex = [[NSRegularExpression alloc] initWithPattern:@"http:\\/\\/([A-Za-z0-9\\-\\.]+)" options:NSRegularExpressionCaseInsensitive error:nil];
    }
    NSString *replaced = [regex stringByReplacingMatchesInString:url options:0 range:NSMakeRange(0, url.length) withTemplate:@""];
    return replaced;
}

@end
