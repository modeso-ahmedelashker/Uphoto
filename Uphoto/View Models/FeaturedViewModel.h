//
//  FeaturedViewModel.h
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModelDelegate.h"

@interface FeaturedViewModel : NSObject

@property (weak, nonatomic) id<ViewModelUpdateUIDelegate> updateUIDelegate;

@property (nonatomic, readonly) NSMutableArray *galleries;

- (void)loadData;

@end
