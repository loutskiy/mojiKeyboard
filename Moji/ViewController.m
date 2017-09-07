//
//  ViewController.m
//  Moji
//
//  Created by Михаил Луцкий on 25.08.16.
//  Copyright © 2016 LWTS Technologies. All rights reserved.
//

#import "ViewController.h"
#import "TutorialVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _image.layer.cornerRadius = _image.frame.size.width / 2;
    _image.clipsToBounds = YES;
}

- (IBAction)keyboard:(id)sender {
    TutorialVC *vc = [[TutorialVC alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
