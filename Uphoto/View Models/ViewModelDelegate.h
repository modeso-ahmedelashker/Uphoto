//
//  ViewModelDelegate.h
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

@protocol ViewModelUpdateUIDelegate <NSObject>

- (void)updateUI;

@optional
- (void)updateUIFromViewModel:(Class)triggerViewModel;

/**
 * for single table view items to update
 */
- (void)updateUIForIndexPath:(NSIndexPath *)indexPath;

@end
