//
//  TutorialVC.m
//  Moji
//
//  Created by Михаил Луцкий on 26.08.16.
//  Copyright © 2016 LWTS Technologies. All rights reserved.
//

#import "TutorialVC.h"
#import "ABCIntroView.h"

@interface TutorialVC ()

@property ABCIntroView *introView2;

@end

@implementation TutorialVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.introView2 = [[ABCIntroView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.introView2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.introView2];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dissmisView)
                                                 name:@"dissmisView"
                                               object:nil];
}

- (void) dissmisView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
