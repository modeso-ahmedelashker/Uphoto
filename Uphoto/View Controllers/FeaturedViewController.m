//
//  FeaturedViewController.m
//  Uphoto
//
//  Created by Ahmed Elashker on 3/25/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import "FeaturedViewController.h"
#import "FeaturedViewModel.h"

@interface FeaturedViewController () <ViewModelUpdateUIDelegate>

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

- (void)updateUI {
    
}

@end
