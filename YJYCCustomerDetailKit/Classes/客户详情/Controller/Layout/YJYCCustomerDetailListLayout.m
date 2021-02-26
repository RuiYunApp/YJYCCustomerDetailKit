//
//  YJYCCustomerDetailListLayout.m
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import "YJYCCustomerDetailListLayout.h"

@implementation YJYCCustomerDetailListLayout

- (CGSize)collectionViewContentSize{
    CGFloat minContentSizeHeight = self.collectionView.bounds.size.height - self.pinCategoryHeight;
    CGSize size = [super collectionViewContentSize];
    if (size.height < minContentSizeHeight) {
        return CGSizeMake(size.width, minContentSizeHeight);
    }
    return size;
}

@end
