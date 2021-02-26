//
//  FCFixTypeCollectionViewCell.m
//  FCBaseKit
//
//  Created by 石富才 on 2020/12/22.
//

#import "FCFixTypeCollectionViewCell.h"
#import "FCCollectionViewSectionModel.h"

@implementation FCFixTypeCollectionViewCell

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttribute{
    UICollectionViewLayoutAttributes *tempLayoutAttribute = [super preferredLayoutAttributesFittingAttributes:layoutAttribute];
    if (!self.itemM) { return tempLayoutAttribute; }
    switch (self.itemM.sizeType) {
        case FCBaseKitSizeTypeFixWidth:{
            // 新建一个宽度约束
            NSLayoutConstraint *widthFenceConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.itemM.itemSize.width];
            // 添加宽度约束
            [self.contentView addConstraint:widthFenceConstraint];
            // 获取约束后的size
            CGSize fittingSize = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
            // 记得移除
            [self.contentView removeConstraint:widthFenceConstraint];
            CGFloat height = (self.itemM.maxHeight > 0 && fittingSize.height > self.itemM.maxHeight) ? self.itemM.maxHeight : fittingSize.height;
            self.itemM.itemSize = CGSizeMake(self.itemM.itemSize.width, height);
        }break;
        case FCBaseKitSizeTypeFixHeight:{
            // 新建一个宽度约束
            NSLayoutConstraint *heightFenceConstraint = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.itemM.itemSize.height];
            // 添加宽度约束
            [self.contentView addConstraint:heightFenceConstraint];
            // 获取约束后的size
            CGSize fittingSize = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
            // 记得移除
            [self.contentView removeConstraint:heightFenceConstraint];
            CGFloat width = (self.itemM.maxWidth > 0 && fittingSize.width > self.itemM.maxWidth) ? self.itemM.maxWidth : fittingSize.width;
            self.itemM.itemSize = CGSizeMake(width, self.itemM.itemSize.height);
        }break;
            
        default:
            break;
    }
    tempLayoutAttribute.size = self.itemM.itemSize;
    return tempLayoutAttribute;
}

- (void)setItemM:(FCCollectionViewItemModel *)itemM{
    _itemM = itemM;
}

@end
