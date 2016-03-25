//
//  GalleryItem.m
//  Euroleague
//
//  Created by Amira Elmansy on 8/5/15.
//  Copyright (c) 2015 Modeso. All rights reserved.
//

#import "GalleryItem.h"

static NSString * const kAPIParamChannel = @"channel";
static NSString * const kAPIParamTitle = @"title";
static NSString * const kAPIParamPubDate = @"pubDate";
static NSString * const kAPIParamGalleryPermaLink = @"link";
static NSString * const kAPIParamGalleryItems = @"webportal:galleryitems";
static NSString * const kAPIParamGalleryItem = @"galleryitem";
static NSString * const kAPIParamFiles = @"webportal:files";
static NSString * const kAPIParamUrlHighRes = @"webportal:highResUrl";

@implementation GalleryItem

- (instancetype)initWithDictionary:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _title = data[kAPIParamTitle];
        _url = [data[kAPIParamFiles] valueForKeyPath:kAPIParamUrlHighRes];
    }
    return self;
}

+ (nullable NSString *)primaryKey {
    return @"itemID";
}

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    NSMutableDictionary *defaultValues;
    [defaultValues setValue:[[NSUUID UUID] UUIDString] forKey:@"itemID"];
    return [defaultValues copy];
}

@end
