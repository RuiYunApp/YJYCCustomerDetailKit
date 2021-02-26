//
//  YJYCCustomerDetailViewController.m
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#define YJYCCustomerDetailContainerViewController_CategoryViewHeight 60

#import "YJYCCustomerDetailContainerViewController.h"
#import "YJYCCustomerDetailHeader.h"
#import <FCCategoryOCKit/FCCategoryOCKit.h>
#import "YJYCCustomerDetailCustomeTitleView.h"
#import <JXPagingView/JXPagerSmoothView.h>
#import <Masonry/Masonry.h>

//View
#import "YJYCCustomerDetailHeaderView.h"

//VC
#import "YJYCCustomerDetailListViewController.h"

//Model
#import "YJYCCustomerDetailCategoryTitleModel.h"

@interface YJYCCustomerDetailContainerViewController ()<JXPagerSmoothViewDataSource,JXCategoryViewDelegate>

/** <#aaa#> */
@property(nonatomic, strong)YJYCCustomerDetailHeaderView *headerView;

@property (nonatomic, strong) JXPagerSmoothView *pagerView;
@property (nonatomic, strong) YJYCCustomerDetailCustomeTitleView *categoryView;

/** <#aaa#> */
@property(nonatomic, strong)NSArray<YJYCCustomerDetailCategoryTitleModel *> *titles;

@end

@implementation YJYCCustomerDetailContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.pagerView];
    [self.pagerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CGFloat f = CGRectGetWidth(self.categoryView.bounds) - [self.categoryView.collectionView.collectionViewLayout collectionViewContentSize].width;
    if (f > 0) {
        self.categoryView.cellWidthIncrement = f / (self.titles.count * 1.0);
        [self.categoryView reloadData];
    }
}

//MARK: edgeInset
- (CGFloat)_topEdgeInset{
    CGFloat f = CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame);
    if (self.navigationController) {
        f += CGRectGetHeight(self.navigationController.navigationBar.bounds);
    }
    return f;
}
- (CGFloat)_bottomEdgeInset{
    CGFloat f = 0;
    if (@available(iOS 11.0, *)) {
        f += UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom;
    }
    if (!self.hidesBottomBarWhenPushed) {
        f += 49;
    }
    return f;
}

//MARK: JXPagerSmoothViewDataSource
/**
 返回页面header的高度
 */
- (CGFloat)heightForPagerHeaderInPagerView:(JXPagerSmoothView *)pagerView{
    return 260 + [self _topEdgeInset];
}


/**
 返回页面header视图
 */
- (UIView *)viewForPagerHeaderInPagerView:(JXPagerSmoothView *)pagerView{
    return self.headerView;
}

/**
 返回悬浮视图的高度
 */
- (CGFloat)heightForPinHeaderInPagerView:(JXPagerSmoothView *)pagerView{
    return YJYCCustomerDetailContainerViewController_CategoryViewHeight;
}

/**
 返回悬浮视图
 */
- (UIView *)viewForPinHeaderInPagerView:(JXPagerSmoothView *)pagerView{
    return self.categoryView;
}

/**
 返回列表的数量
 */
- (NSInteger)numberOfListsInPagerView:(JXPagerSmoothView *)pagerView{
    return self.titles.count;
}

/**
 根据index初始化一个对应列表实例，需要是遵从`JXPagerSmoothViewListViewDelegate`协议的对象。
 如果列表是用自定义UIView封装的，就让自定义UIView遵从`JXPagerSmoothViewListViewDelegate`协议，该方法返回自定义UIView即可。
 如果列表是用自定义UIViewController封装的，就让自定义UIViewController遵从`JXPagerSmoothViewListViewDelegate`协议，该方法返回自定义UIViewController即可。

 @param pagerView pagerView description
 @param index index description
 @return 新生成的列表实例
 */
- (id<JXPagerSmoothViewListViewDelegate>)pagerView:(JXPagerSmoothView *)pagerView initListAtIndex:(NSInteger)index{
    return self.titles[index].vc;
}

//MARK: getter 方法
- (YJYCCustomerDetailHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [k_source_bundle loadNibNamed:NSStringFromClass(YJYCCustomerDetailHeaderView.class) owner:self options:nil].firstObject;
    }
    return _headerView;
}
- (NSArray<YJYCCustomerDetailCategoryTitleModel *> *)titles{
    if (!_titles) {
        FCWeakSelf(self);
        YJYCCustomerDetailCategoryTitleModel *baseMsgM = [[YJYCCustomerDetailCategoryTitleModel alloc]init:^(YJYCCustomerDetailCategoryTitleModel *tm) {
            tm.title = @"基础信息";
            
            YJYCCustomerDetailListViewController *vc = YJYCCustomerDetailListViewController.new;
            vc.pinCategoryHeight = YJYCCustomerDetailContainerViewController_CategoryViewHeight;
            vc.containerVC = weakself;
            tm.vc = vc;
        }];
        
        
        YJYCCustomerDetailCategoryTitleModel *detailMsgM = [[YJYCCustomerDetailCategoryTitleModel alloc]init:^(YJYCCustomerDetailCategoryTitleModel *tm) {
            tm.title = @"客户详情";
            
            YJYCCustomerDetailListViewController *vc = YJYCCustomerDetailListViewController.new;
            vc.pinCategoryHeight = YJYCCustomerDetailContainerViewController_CategoryViewHeight;
            vc.containerVC = weakself;
            tm.vc = vc;
        }];
        
        YJYCCustomerDetailCategoryTitleModel *progressMsgM = [[YJYCCustomerDetailCategoryTitleModel alloc]init:^(YJYCCustomerDetailCategoryTitleModel *tm) {
            tm.title = @"跟进情况";
            
            YJYCCustomerDetailListViewController *vc = YJYCCustomerDetailListViewController.new;
            vc.pinCategoryHeight = YJYCCustomerDetailContainerViewController_CategoryViewHeight;
            vc.containerVC = weakself;
            tm.vc = vc;
        }];
        
        YJYCCustomerDetailCategoryTitleModel *buyHouseMsgM = [[YJYCCustomerDetailCategoryTitleModel alloc]init:^(YJYCCustomerDetailCategoryTitleModel *tm) {
            tm.title = @"购房信息";
            
            YJYCCustomerDetailListViewController *vc = YJYCCustomerDetailListViewController.new;
            vc.pinCategoryHeight = YJYCCustomerDetailContainerViewController_CategoryViewHeight;
            vc.containerVC = weakself;
            tm.vc = vc;
        }];
        
        _titles = @[baseMsgM,detailMsgM,progressMsgM,buyHouseMsgM];
    }
    return _titles;
}

- (JXPagerSmoothView *)pagerView{
    if (!_pagerView) {
        _pagerView = [[JXPagerSmoothView alloc]initWithDataSource:self];
    }
    return _pagerView;
}
- (YJYCCustomerDetailCustomeTitleView *)categoryView{
    if (!_categoryView) {
        _categoryView = [[YJYCCustomerDetailCustomeTitleView alloc]init];
        _categoryView.titles = [self.titles valueForKey:@"title"];
        _categoryView.backgroundColor = [UIColor fc_RGBValue:0xf2f2f2];
        _categoryView.delegate = self;
        _categoryView.titleFont = [UIFont systemFontOfSize:15];
        _categoryView.titleSelectedFont = [UIFont systemFontOfSize:15];
//        _categoryView.titleColor = [UIColor fc_RGBValue:0x666666];
        _categoryView.titleSelectedColor = UIColor.orangeColor;
        
        
        _categoryView.cellSpacing = 5;
        _categoryView.contentEdgeInsetLeft = 10;
        _categoryView.contentEdgeInsetRight = 10;
        _categoryView.averageCellSpacingEnabled = NO;


        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorColor = UIColor.orangeColor;
//        lineView.componentPosition = JXCategoryComponentPosition_Top;
        lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
        lineView.verticalMargin = 50;
        _categoryView.indicators = @[lineView];
        //
        _categoryView.contentScrollView = self.pagerView.listCollectionView;
    }
    return _categoryView;
}

@end
