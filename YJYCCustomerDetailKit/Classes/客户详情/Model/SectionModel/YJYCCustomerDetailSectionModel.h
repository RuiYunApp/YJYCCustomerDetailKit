//
//  YJYCCustomerDetailSectionModel.h
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import <FCBaseKit/FCCollectionViewSectionModel.h>
#import <FCCollectionViewLayout/FCCollectionViewLayout.h>

@class FCCollectionViewItemModel;
@interface YJYCCustomerDetailSectionModel : FCCollectionViewSectionModel<FCCollectionViewItemModel *>

/** <#aaa#> */
@property(nonatomic, assign)FCCollectionViewItemsHorizontalAlignment horizontalAlignment;
/** <#aaa#> */
@property(nonatomic, assign)FCCollectionViewItemsVerticalAlignment verticalAlignment;

/** <#aaa#> */
@property(nonatomic, assign)FCCollectionViewItemsFlowDirection itemsFlowDirection;
/** <#aaa#> */
@property(nonatomic, assign)FCCollectionViewItemsLayoutType itemsLayoutType;

/** <#aaa#> */
@property(nonatomic, assign)CGFloat sectionSpace;


@end

@interface YJYCCustomerDetailItemModel : FCCollectionViewItemModel


/** <#aaa#> */
@property(nonatomic, assign)BOOL hasArrow;


@end
