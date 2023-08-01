#import "SearchResultView.h"
#import "VerticalStackView.h"

@interface SearchResultView() {
    @private UIImageView *iconView;
    @private UILabel *titleLabel;
    @private UILabel *categoryLabel;
    @private UILabel *ratingLabel;
    @private NSMutableArray *screenshotArray;
    @private UIStackView *allScreenshots;
    @private UIButton *getButton;
}

@end

@implementation SearchResultView

- (instancetype) initWithFrame:(CGRect) frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self customInit];
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *) coder {
    self = [super initWithCoder:coder];
    if(self) {
        [self customInit];
    }
    return self;
}

- (void) customInit {
    
    iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"facebook"];
    iconView.layer.masksToBounds = YES;
    iconView.layer.cornerRadius = 15;
    iconView.translatesAutoresizingMaskIntoConstraints = NO;
    [iconView.widthAnchor constraintEqualToConstant:64].active = YES;
    [iconView.heightAnchor constraintEqualToConstant:64].active = YES;
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setFont:[UIFont systemFontOfSize:24]];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    categoryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    categoryLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    ratingLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    ratingLabel.text = @"4.7";
    ratingLabel.translatesAutoresizingMaskIntoConstraints = NO;

    getButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [getButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    [getButton setTitle:@"GET" forState:UIControlStateNormal];
    [getButton setBackgroundColor:UIColor.systemGray2Color];
    getButton.layer.cornerRadius = 16;
    getButton.translatesAutoresizingMaskIntoConstraints = NO;
    [getButton.widthAnchor constraintEqualToConstant:72].active = YES;
    [getButton.heightAnchor constraintEqualToConstant:32].active = YES;
    [getButton addTarget:self action:@selector(getButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    VerticalStackView *allLabels = [[VerticalStackView alloc] initWithArrangedSubviews:@[titleLabel, categoryLabel, ratingLabel]];
    allLabels.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIStackView *iconTitleButton = [[UIStackView alloc] initWithArrangedSubviews:@[iconView, allLabels, getButton]];
    iconTitleButton.spacing = 15;
    iconTitleButton.alignment = UIStackViewAlignmentCenter;
    [self addSubview:iconTitleButton];
    iconTitleButton.translatesAutoresizingMaskIntoConstraints = NO;
    [iconTitleButton.widthAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.widthAnchor multiplier:0.9].active = YES;
    [iconTitleButton.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [iconTitleButton.topAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.topAnchor].active = YES;
    [iconTitleButton.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor multiplier:0.30].active = YES;
    

    allScreenshots = [[UIStackView alloc] init];
    allScreenshots.spacing = 15;
    allScreenshots.alignment = UIStackViewAlignmentCenter;
    allScreenshots.distribution = UIStackViewDistributionFillEqually;
    allScreenshots.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:allScreenshots];
    
    [allScreenshots.widthAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.widthAnchor multiplier:0.9].active = YES;
    [allScreenshots.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [allScreenshots.topAnchor constraintEqualToAnchor:iconTitleButton.bottomAnchor].active = YES;
    [allScreenshots.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor multiplier:0.60].active = YES;
}

- (void) fillDetails:(AppDetails *)app {
    titleLabel.text = [app appTitle];
    categoryLabel.text = [app appGenre];
    iconView.image = [UIImage imageWithData:[app appIcon]];
    for (UIView *view in allScreenshots.subviews) {
        [view removeFromSuperview];
    }
    for (NSData *imageData in [app appThumbnails]) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:imageData]];
        [allScreenshots addArrangedSubview:imageView];
    }
}

- (void) getButtonTapped {
    NSLog(@"Hello");
}
    
@end
