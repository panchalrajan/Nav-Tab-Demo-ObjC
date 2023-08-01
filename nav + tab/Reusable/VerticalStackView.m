//
//  VerticalStackView.m
//  nav + tab
//
//  Created by Rajan Panchal on 10/01/23.
//

#import "VerticalStackView.h"

@implementation VerticalStackView

- (instancetype)initWithArrangedSubviews:(NSArray<__kindof UIView *> *)views {
    if (self = [super initWithArrangedSubviews:views]) {
        self.axis = UILayoutConstraintAxisVertical;
    }
    return self;
}

@end
