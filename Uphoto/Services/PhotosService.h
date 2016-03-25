//
//  PhotosService.h
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FailureBlock)(NSString *errorMsg);
typedef void(^SuccessBlock)(NSMutableArray *result);

@interface PhotosService : NSObject

- (void)downloadGalleryWithSuccess:(SuccessBlock)success failure:(FailureBlock)failure;

@end
