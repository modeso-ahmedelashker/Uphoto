//
//  FeaturedViewModel.m
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import "FeaturedViewModel.h"
#import "PhotosService.h"

@implementation FeaturedViewModel

- (void)loadData {
    
    PhotosService *service = [PhotosService new];
    
    [service downloadGalleryWithSuccess:^(id result) {
        
        //_galleries = [self filterGalleryResults:(RLMResults*)result];
        
        if (self.updateUIDelegate && [self.updateUIDelegate respondsToSelector:@selector(updateUI)]) {
            [self.updateUIDelegate updateUI];
        }
        
    } failure:^(NSString *errorMsg) {
        
    }];
}

@end
