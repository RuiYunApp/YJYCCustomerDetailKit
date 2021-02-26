//
//  YJYCCustomerDetailCategoryTitleModel.h
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import <Foundation/Foundation.h>
#import <JXPagingView/JXPagerSmoothView.h>

@interface YJYCCustomerDetailCategoryTitleModel : NSObject

/** <#aaa#> */
@property(nonatomic, copy)NSString *title;
/** <#aaa#> */
@property(nonatomic, strong)UIViewController<JXPagerSmoothViewListViewDelegate> *vc;

@end
