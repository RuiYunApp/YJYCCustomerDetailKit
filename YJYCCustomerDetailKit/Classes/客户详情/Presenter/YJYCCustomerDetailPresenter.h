//
//  YJYCCustomerDetailPresenter.h
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import <Foundation/Foundation.h>

@interface YJYCCustomerDetailPresenter : NSObject

@property(nonatomic, weak)UIViewController *containerVC;
@property(nonatomic, weak)UICollectionView *collectionView;

- (void)analysisData;

@end
