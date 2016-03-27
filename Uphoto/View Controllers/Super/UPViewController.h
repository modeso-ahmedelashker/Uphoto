//
//  UPViewController.h
//  Uphoto
//
//  Created by Ahmed Elashker on 3/27/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UPViewControllerDelegate <NSObject>

- (void)photoIsSelected:(UIImage*)photo;

@end

@interface UPViewController : UIViewController

@property (weak, nonatomic) id<UPViewControllerDelegate> delegate;

@property (strong, nonatomic) UIImage *image;

@end
