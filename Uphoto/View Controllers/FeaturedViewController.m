//
//  FeaturedViewController.m
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import "FeaturedViewController.h"
#import "FeaturedViewModel.h"
#import "PhotoCell.h"

@interface FeaturedViewController () <ViewModelUpdateUIDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) FeaturedViewModel *viewModel;

@end

@implementation FeaturedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize ViewModel
    self.viewModel = [FeaturedViewModel new];
    self.viewModel.updateUIDelegate = self;
    [self.viewModel loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.galleries.count;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = [cv dequeueReusableCellWithReuseIdentifier:kPHOTOS_CELL_IDENTIFIER forIndexPath:indexPath];
    cell.gallery = [self.viewModel.galleries objectAtIndex:indexPath.item];
    return cell;
}

#pragma mark - UICollectionView DelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat dimension = (CGRectGetWidth(collectionView.bounds) - 20.) * .5;
    return CGSizeMake(dimension, dimension);
}


#pragma mark - ViewModelUpdateUIDelegate Methods

- (void)updateUI {
    
    [self.collectionView reloadData];
}

@end
