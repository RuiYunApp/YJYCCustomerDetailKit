//
//  YJYCCustomerDetailListViewController.m
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import "YJYCCustomerDetailListViewController.h"
#import "YJYCCustomerDetailHeader.h"
#import <Masonry/Masonry.h>
#import <FCCategoryOCKit/FCCategoryOCKit.h>

//Layout
#import "YJYCCustomerDetailListLayout.h"

//Presenter
#import "YJYCCustomerDetailPresenter.h"

@interface YJYCCustomerDetailListViewController ()

@property(nonatomic, strong)UICollectionView *collectionView;

@property(nonatomic, strong)YJYCCustomerDetailListLayout *layout;

/** <#aaa#> */
@property(nonatomic, strong)YJYCCustomerDetailPresenter *presenter;

@end

@implementation YJYCCustomerDetailListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    [self.presenter analysisData];
}


//MARK: JXPagerViewListViewDelegate
- (UIView *)listView{
    return self.view;
}
- (UIScrollView *)listScrollView{
    return self.collectionView;
}

//MARK: getter 方法
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.backgroundColor = UIColor.clearColor;
        
        if (@available(iOS 11.0,*)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _collectionView;
}
- (YJYCCustomerDetailListLayout *)layout{
    if (!_layout) {
        _layout = YJYCCustomerDetailListLayout.new;
        _layout.estimatedItemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 100);
        _layout.pinCategoryHeight = self.pinCategoryHeight;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _layout;
}
- (YJYCCustomerDetailPresenter *)presenter{
    if (!_presenter) {
        _presenter = YJYCCustomerDetailPresenter.new;
        _presenter.collectionView = self.collectionView;
        _presenter.containerVC = self.containerVC;
    }
    return _presenter;
}

@end
