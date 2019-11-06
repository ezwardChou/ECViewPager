//
//  ECViewPager.m
//  ECViewPagerDemo
//
//  Created by Chou Edward  on 2019/11/6.
//  Copyright © 2019 Chou Edward . All rights reserved.
//

#import "ECViewPager.h"

@interface ECViewPager ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) NSMutableArray *buttonArray;

@end

@implementation ECViewPager

#pragma mark - Init


-(void)_initSelf{
    _buttonArray = NSMutableArray.new;
    _viewControllers = NSMutableArray.new;
    
    _scrollView = UIScrollView.new;
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    
    
    
}

#pragma mark - Public
-(void)reloadData{
    
}

@end
