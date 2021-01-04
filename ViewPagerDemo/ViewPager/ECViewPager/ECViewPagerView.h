//
//  ECViewPagerView.h
//  ViewPager
//
//  Created by Chou Edward  on 2021/1/2.
//

#import <UIKit/UIKit.h>

@class ECViewPagerView;

@protocol ECViewPagerDelegate <NSObject>


-(UIViewController *_Nullable)ecViewPager:(ECViewPagerView *_Nullable)viewPager contentViewForIndex:(NSInteger)index;

-(NSInteger)numberOfContentViewInViewPager:(ECViewPagerView *_Nullable)viewPager;


@optional

@end

NS_ASSUME_NONNULL_BEGIN

@interface ECViewPagerView : UIView

@property (weak, nonatomic) id <ECViewPagerDelegate>delegate;

@property (strong, nonatomic) NSMutableArray *viewControllers;

///default - 0
@property (assign, nonatomic) NSInteger currentIndex;

-(void)reloadData;


@end

NS_ASSUME_NONNULL_END
