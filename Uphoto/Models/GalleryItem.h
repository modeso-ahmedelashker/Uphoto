//
//  GalleryItem.h
//  Euroleague
//
//  Created by Amira Elmansy on 8/5/15.
//  Copyright (c) 2015 Modeso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GalleryItem : NSObject

@property NSString *itemID;
@property NSString *title;
@property NSString *url;

- (instancetype)initWithDictionary:(NSDictionary *)data;

@end
