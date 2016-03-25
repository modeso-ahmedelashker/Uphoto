//
//  PhotoCell.h
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gallery.h"

static NSString * const kPHOTOS_CELL_IDENTIFIER = @"PhotoCell";

@interface PhotoCell : UICollectionViewCell

@property (strong, nonatomic) Gallery *gallery;
@property BOOL isLoaded;

@end
