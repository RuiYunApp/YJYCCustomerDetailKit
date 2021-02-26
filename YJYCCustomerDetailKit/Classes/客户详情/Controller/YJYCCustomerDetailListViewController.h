//
//  YJYCCustomerDetailListViewController.h
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import <UIKit/UIKit.h>
#import <JXPagingView/JXPagerSmoothView.h>

@interface YJYCCustomerDetailListViewController : UIViewController<JXPagerSmoothViewListViewDelegate>

@property(nonatomic, weak)UIViewController *containerVC;

/// 悬浮header的高度
@property (nonatomic, assign) CGFloat pinCategoryHeight;

@end
