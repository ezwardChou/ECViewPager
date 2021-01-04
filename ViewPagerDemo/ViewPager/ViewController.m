//
//  ViewController.m
//  ViewPager
//
//  Created by Chou Edward  on 2021/1/2.
//
#import "ECViewPagerView.h"
#import "ViewController.h"

#import "ContentViewController.h"
@interface ViewController ()<ECViewPagerDelegate>
@property (weak, nonatomic) IBOutlet ECViewPagerView *viewPager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _viewPager.delegate = self;
    
    [_viewPager reloadData];
}



-(NSInteger)numberOfContentViewInViewPager:(ECViewPagerView *)viewPager{
    return 5;
}

-(UIViewController *)ecViewPager:(ECViewPagerView *)viewPager contentViewForIndex:(NSInteger)index{
    return ContentViewController.new;
}
@end
