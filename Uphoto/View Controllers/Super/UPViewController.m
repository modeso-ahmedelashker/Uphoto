//
//  UPViewController.m
//  Uphoto
//
//  Created by Ahmed Elashker on 3/27/16.
//  Copyright © 2016 Modeso. All rights reserved.
//

#import "UPViewController.h"

@interface UPViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation UPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectPhoto:(id)sender {
    
    UIImagePickerController *imagePicker = [UIImagePickerController new];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    _image =  [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [_delegate photoIsSelected:_image];
}

@end
