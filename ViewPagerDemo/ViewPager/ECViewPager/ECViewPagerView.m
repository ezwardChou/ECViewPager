//
//  ECViewPagerView.m
//  ViewPager
//
//  Created by Chou Edward  on 2021/1/2.
//
#import <UIKit/UIKit.h>

@interface UIView (ECViewPagerView_Category)

-(CGFloat)ec_height;
-(CGFloat)ec_width;

@end

@implementation UIView (ECViewPagerView_Category)

-(CGFloat)ec_height {
    return self.bounds.size.height;
}

-(CGFloat)ec_width {
    return self.bounds.size.width;
}

@end

@interface UIStackView (ECStackView_Category)

-(void)ec_removeAllArrangedViews;

@end

@implementation UIStackView (ECStackView_Category)

-(void)ec_removeAllArrangedViews{
    for (UIView *_view in self.arrangedSubviews) {
        [self removeArrangedSubview:_view];
    }
}

@end


#import "ECViewPagerView.h"

@interface ECViewPagerView ()

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIStackView *stackView;

@property (strong, nonatomic) NSLayoutConstraint *widthConstraint;
@end

@implementation ECViewPagerView

#pragma mark - Init
-(instancetype)init
{
    if (self = [super init]) {
        NSLog(@"ECViewPagerView Init");
        
        [self _initSelf];
    }
    
    return self;
}

-(void)dealloc{
    NSLog(@"ECViewPagerView Dealloc");
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"ECViewPagerView awakeFromNib");
    [self _initSelf];

}

-(void)_initSelf {
    _viewControllers = NSMutableArray.new;
}
#pragma mark - lazy load
-(UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = UIScrollView.new;
        
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_scrollView];
        
        NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        
        NSLayoutConstraint *constraintLeading = [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0];

        NSLayoutConstraint *constraintTrailing = [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
        
        NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];

        [self addConstraints:@[constraintTop, constraintBottom, constraintLeading, constraintTrailing]];
    }
    
    return _scrollView;
}


-(UIStackView *)stackView {
    if (_stackView == nil) {
        _stackView = [UIStackView new];
        _stackView.axis = UILayoutConstraintAxisHorizontal;
        _stackView.distribution = UIStackViewDistributionFillEqually;
        _stackView.translatesAutoresizingMaskIntoConstraints = NO;

        [self.scrollView addSubview:_stackView];
        
        NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:_stackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        
        NSLayoutConstraint *constraintLeading = [NSLayoutConstraint constraintWithItem:_stackView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
        
        NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:_stackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
        
        NSLayoutConstraint *constraintHeight = [NSLayoutConstraint constraintWithItem:_stackView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
        
        NSLayoutConstraint *constraintTrailing = [NSLayoutConstraint constraintWithItem:_stackView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];


        [self.scrollView addConstraints:@[constraintTop, constraintBottom, constraintLeading, constraintTrailing]];

        [self addConstraint:constraintHeight];
        
    }
    
    return _stackView;
}

-(NSLayoutConstraint *)widthConstraint{
    if (_widthConstraint == nil) {
        _widthConstraint = [NSLayoutConstraint constraintWithItem:self.stackView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:0];

        [self.scrollView addConstraint:_widthConstraint];
    }
    
    return _widthConstraint;
}

#pragma mark - public
-(void)reloadData {
    [self.stackView ec_removeAllArrangedViews];
    
    CGFloat width = self.ec_width *  [_delegate numberOfContentViewInViewPager:self];
    
    self.widthConstraint.constant = width;
    
    for (int i = 0; i < [_delegate numberOfContentViewInViewPager:self]; i++) {
        UIViewController *contentViewController = [_delegate ecViewPager:self contentViewForIndex:i];
        
        [_viewControllers addObject:contentViewController];
        [self.stackView addArrangedSubview:contentViewController.view];
    
    }
    
    [self.stackView layoutIfNeeded];
    
}



@end
