//
//  PhotoCell.m
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import "PhotoCell.h"
#import "GalleryItem.h"
#import <UIImageView+WebCache.h>

@interface PhotoCell ()

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) IBOutlet UILabel *photoTitle;

@end

@implementation PhotoCell

- (void)setGallery:(Gallery *)gallery {
    
    self.isLoaded = NO;
    
    // Set title
    [self.photoTitle setText:gallery.title];
    
    // Set image of first gallery item
    GalleryItem *firstGalleryItem = gallery.items[0];
    NSURL *url = [NSURL URLWithString:firstGalleryItem.url];
    [self.photoImageView sd_setImageWithURL:url placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {

        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (error == nil) {
            self.isLoaded = YES;
        }
    }];
}

@end
