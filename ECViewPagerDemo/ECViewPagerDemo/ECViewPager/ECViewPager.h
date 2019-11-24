//
//  ECViewPager.h
//  ECViewPagerDemo
//
//  Created by Chou Edward  on 2019/11/6.
//  Copyright © 2019 Chou Edward . All rights reserved.
//

#import <UIKit/UIKit.h>

@class ECViewPager;

@protocol ECViewPagerDelegate <NSObject>

-(UIViewController *_Nonnull)ecViewPager:(ECViewPager *_Nonnull)viewPager getContentViewWithIndex:(NSInteger)index;

-(NSInteger)numberOfItemsInViewPager:(ECViewPager *_Nonnull)viewPager;

-(UIView *_Nonnull)indicatorViewInViewPager:(ECViewPager *_Nonnull)viewPager;

@optional

-(NSString *_Nullable)ecViewPager:(ECViewPager *_Nonnull)viewPager getTitleOfEachItemWithIndex:(NSInteger)index;

-(NSString *_Nullable)ecViewPager:(ECViewPager *_Nonnull)viewPager getImageNameOfEachItemWithIndex:(NSInteger)index;

-(UIEdgeInsets)ecViewPager:(ECViewPager *_Nonnull)viewPager getEdgeOfEachItemWithIndex:(NSInteger)index;



@end

typedef enum : NSUInteger {
    ECItemLayoutAlignLeft,
    ECItemLayoutAlignCenter,
} ECItemAlignType;

NS_ASSUME_NONNULL_BEGIN

@interface ECViewPager : UIView

@property (nonatomic,assign) CGPoint indicatorCenterPoint;

@property (nonatomic,weak) id<ECViewPagerDelegate> ecDelegate;

@property (nonatomic,strong, readonly) NSMutableArray *viewControllers;
@end

NS_ASSUME_NONNULL_END
