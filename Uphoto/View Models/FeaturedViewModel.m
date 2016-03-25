//
//  FeaturedViewModel.m
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import "FeaturedViewModel.h"
#import "PhotosService.h"
#import "Gallery.h"

@implementation FeaturedViewModel

- (void)loadData {
    
    PhotosService *service = [PhotosService new];
    
    [service downloadGalleryWithSuccess:^(NSMutableArray *result) {
        
        _galleries = [self filterGalleryResults:result];
        
        if (self.updateUIDelegate && [self.updateUIDelegate respondsToSelector:@selector(updateUI)]) {
            [self.updateUIDelegate updateUI];
        }
        
    } failure:^(NSString *errorMsg) {
        
    }];
}

- (NSMutableArray*)filterGalleryResults:(NSMutableArray*)results {
    
    NSMutableArray *fullGalleries = [NSMutableArray new];
    
    for (Gallery *gallery in results) {
        if (gallery.items.count > 0) {
            [fullGalleries addObject:gallery];
        }
    }
    
    return fullGalleries;
}

@end
