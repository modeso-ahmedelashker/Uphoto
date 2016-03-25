//
//  Gallery.h
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GalleryItem.h"

@interface Gallery : NSObject

@property NSString *galleryID;
@property NSString *title;
@property NSDate *pubDate;
@property NSMutableArray<GalleryItem *>* items;

- (instancetype)initWithDictionary:(NSDictionary *)data;

@end
