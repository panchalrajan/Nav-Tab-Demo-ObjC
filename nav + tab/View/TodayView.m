//
//  TodayView.m
//  nav + tab
//
//  Created by Rajan Panchal on 09/01/23.
//

#import "TodayView.h"
#import "VerticalStackView.h"

@interface TodayView()

@end

@implementation TodayView

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
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"kartrace"];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    
    UIImageView *imageView2 = [[UIImageView alloc] init];
    imageView2.image = [UIImage imageNamed:@"kartrace"];
    imageView2.translatesAutoresizingMaskIntoConstraints = NO;

    UIStackView *imageFooter = [[UIStackView alloc] initWithArrangedSubviews:@[]];
    imageFooter.backgroundColor = UIColor.greenColor;
    imageFooter.translatesAutoresizingMaskIntoConstraints = NO;
    [imageFooter.heightAnchor constraintEqualToConstant:self.frame.size.height/5].active = YES;
    
    VerticalStackView *finalStack = [[VerticalStackView alloc] initWithArrangedSubviews:@[imageView, imageFooter]];
    finalStack.translatesAutoresizingMaskIntoConstraints = NO;
    finalStack.backgroundColor = UIColor.greenColor;
    finalStack.layer.cornerRadius = 15;
    finalStack.clipsToBounds = YES;
    [self addSubview:finalStack];
    
    [finalStack.widthAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.widthAnchor multiplier:0.9].active = YES;
    [finalStack.heightAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.heightAnchor].active = YES;
    [finalStack.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [finalStack.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
    
    
    
}


    

    
@end
