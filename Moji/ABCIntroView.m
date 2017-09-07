#import "ABCIntroView.h"

@interface ABCIntroView () <UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIButton *doneButton;

@property (strong, nonatomic) UIView *viewOne;
@property (strong, nonatomic) UIView *viewTwo;
@property (strong, nonatomic) UIView *viewThree;
@property (strong, nonatomic) UIView *viewFour;
@property (strong, nonatomic) UIButton *skipButton;


@end

@implementation ABCIntroView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
        [self.scrollView addSubview:self.viewOne];
        [self.scrollView addSubview:self.viewTwo];
        [self.scrollView addSubview:self.viewThree];
        [self.scrollView addSubview:self.viewFour];
        [self addSubview:self.skipButton];
        [self.scrollView setShowsHorizontalScrollIndicator:NO];

    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = CGRectGetWidth(self.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.pageControl.currentPage = roundf(pageFraction);
    if (roundf(pageFraction)==3){
        self.skipButton.hidden = NO;
        [self.skipButton setTitle:NSLocalizedString(@"Home", nil) forState:UIControlStateNormal];
    } else {
        self.skipButton.hidden = NO;
        [self.skipButton setTitle:NSLocalizedString(@"Skip", nil) forState:UIControlStateNormal];
    }
}

-(UIView *)viewOne {
    if (!_viewOne) {
    
        _viewOne = [[UIView alloc] initWithFrame:self.frame];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
        titleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Step 1", nil)];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment =  NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        [_viewOne addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.24, self.frame.size.width*.8, self.frame.size.width+120)];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"Group"];
        [_viewOne addSubview:imageview];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        NSLog(@"WIDTH %f", width);

        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        descriptionLabel.text = [NSString stringWithFormat:NSLocalizedString(@"From Settings > General > Keyboard > Keyboards > Add New Keyboard", nil)];
        descriptionLabel.font = [UIFont systemFontOfSize:15.0];
        descriptionLabel.textColor = [UIColor blackColor];
        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel sizeToFit];
        [_viewOne addSubview:descriptionLabel];
        
        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.18);
        descriptionLabel.center = labelCenter;
        
    }
    return _viewOne;
}

-(UIView *)viewTwo {
    if (!_viewTwo) {
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height;
        
        _viewTwo = [[UIView alloc] initWithFrame:CGRectMake(originWidth, 0, originWidth, originHeight)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
        titleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Step 2", nil)];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment =  NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        [_viewTwo addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.24, self.frame.size.width*.8, self.frame.size.width+120)];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"Group-1"];
        [_viewTwo addSubview:imageview];
        
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.85, self.frame.size.width*.8, 60)];
        descriptionLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Add SMTHmoji from the third-party keyboards", nil)];
        descriptionLabel.font = [UIFont systemFontOfSize:15.0];
        descriptionLabel.textColor = [UIColor blackColor];
        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel sizeToFit];
        [_viewTwo addSubview:descriptionLabel];
        
        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.18);
        descriptionLabel.center = labelCenter;
    }
    return _viewTwo;
}

-(UIView *)viewThree{
    
    if (!_viewThree) {
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height;
        
        _viewThree = [[UIView alloc] initWithFrame:CGRectMake(originWidth*2, 0, originWidth, originHeight)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
        titleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Step 3", nil)];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment =  NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        [_viewThree addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.24, self.frame.size.width*.8, self.frame.size.width+120)];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"Group 2"];
        [_viewThree addSubview:imageview];
        
        
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.85, self.frame.size.width*.8, 60)];
        descriptionLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Select SMTHmoji keyboard and turn on “Allow Full Access” ", nil)];
        descriptionLabel.font = [UIFont systemFontOfSize:15.0];
        descriptionLabel.textColor = [UIColor blackColor];
        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel sizeToFit];
        [_viewThree addSubview:descriptionLabel];
        
        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.18);
        descriptionLabel.center = labelCenter;
    }
    return _viewThree;
}

-(UIView *)viewFour {
    if (!_viewFour) {
    
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height;
        
        _viewFour = [[UIView alloc] initWithFrame:CGRectMake(originWidth*3, 0, originWidth, originHeight)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
        titleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Step 4", nil)];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment =  NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        [_viewFour addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width/2)-64, self.frame.size.height*.3, 128, 128)];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"internet"];
        [_viewFour addSubview:imageview];
        
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.85, self.frame.size.width*.8, 60)];
        descriptionLabel.text = [NSString stringWithFormat:NSLocalizedString(@"From iMessage select the Globe icon to switch to the SMTHmoji keyboard", nil)];
        descriptionLabel.font = [UIFont systemFontOfSize:18.0];
        descriptionLabel.textColor = [UIColor blackColor];
        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel sizeToFit];
        [_viewFour addSubview:descriptionLabel];
        
        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.18);
        descriptionLabel.center = labelCenter;
        
        UIButton *goToSettings = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.85, self.frame.size.width*.8, 60)];
        [goToSettings setTitle:@"Go to Settings" forState:UIControlStateNormal];
        [goToSettings setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [goToSettings addTarget:self action:@selector(goToSettings:) forControlEvents:UIControlEventTouchUpInside];
        [_viewFour addSubview:goToSettings];
        
    }
    return _viewFour;
}

- (IBAction)goToSettings:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=General&path=Keyboard/KEYBOARDS"]];
}

- (UIButton *)skipButton {
    if (!_skipButton) {
        _skipButton = [[UIButton alloc] initWithFrame:CGRectMake(15, self.frame.size.height-50, self.frame.size.width-30, 50)];
        [_skipButton setTitle:@"Skip" forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _skipButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_skipButton addTarget:self action:@selector(skipAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _skipButton;
}

- (IBAction)skipAction:(id)sender {
    CGFloat pageWidth = CGRectGetWidth(self.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    NSLog(@"pageFraction %f", roundf(pageFraction));
    if (roundf(pageFraction)!=3){
        [_scrollView setContentOffset:CGPointMake(self.frame.size.width*3, 0) animated:YES];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"dissmisView" object:nil];
    }
}

-(UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        [_scrollView setDelegate:self];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setContentSize:CGSizeMake(self.frame.size.width*4, self.scrollView.frame.size.height)];
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    return _scrollView;
}

-(UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height-20, self.frame.size.width, 10)];
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor blackColor]];
        [_pageControl setNumberOfPages:4];
        [_pageControl setPageIndicatorTintColor:[UIColor lightGrayColor]];
    }
    return _pageControl;
}

@end
