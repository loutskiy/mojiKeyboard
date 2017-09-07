//
//  KeyboardViewController.h
//  mojiKeyboard
//
//  Created by Михаил Луцкий on 28.08.16.
//  Copyright © 2016 LWTS Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardViewController : UIInputViewController
- (IBAction)changeKeyboard:(id)sender;
@property (weak, nonatomic) IBOutlet UICollectionView *stickersCollectionView;
@property (weak, nonatomic) IBOutlet UIView *informationView;

@end
