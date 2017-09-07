//
//  KeyboardViewController.m
//  mojiKeyboard
//
//  Created by Михаил Луцкий on 28.08.16.
//  Copyright © 2016 LWTS Technologies. All rights reserved.
//

#import "KeyboardViewController.h"
#import "stickerCell.h"

@interface KeyboardViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    NSArray *stickers;
}
@property (nonatomic, strong) UIButton *nextKeyboardButton;
@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view = [[[NSBundle mainBundle] loadNibNamed:@"STKeyboard" owner:self options:nil] firstObject];

    self.informationView.hidden = YES;
    self.stickersCollectionView.delegate = self;
    self.stickersCollectionView.dataSource = self;
    [self.stickersCollectionView registerNib:[UINib nibWithNibName:@"stickerCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    self.stickersCollectionView.alwaysBounceVertical = YES;
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

    stickers = @[@"triste", @"rabia nuevp", @"party", @"oscar", @"OK", @"nuevo sorpresa", @"miedo3", @"love", @"jim carrey", @"feliz", @"asco"]; //Массив с картинками
    [self.stickersCollectionView reloadData];
//    });
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return stickers.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.informationView.hidden = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = [UIImage imageNamed:stickers[indexPath.row]];
        [[UIPasteboard generalPasteboard] setImage:image];
    });
    [NSTimer scheduledTimerWithTimeInterval:5.0
                                     target:self
                                   selector:@selector(hiddenInformationView)
                                   userInfo:nil
                                    repeats:NO];
}

- (void) hiddenInformationView {
    self.informationView.hidden = YES;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    stickerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.stickerImage.image = [UIImage imageNamed:stickers[indexPath.row]];
    
    return cell;
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

- (IBAction)changeKeyboard:(id)sender {
    [self advanceToNextInputMode];
}

@end
