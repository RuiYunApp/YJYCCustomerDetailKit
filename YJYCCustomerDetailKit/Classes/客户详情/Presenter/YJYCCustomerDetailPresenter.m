//
//  YJYCCustomerDetailPresenter.m
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import "YJYCCustomerDetailPresenter.h"
#import "YJYCCustomerDetailHeader.h"
#import <FCCategoryOCKit/FCCategoryOCKit.h>

//Cell
#import "YJYCCustomerDetailDottedLineCollectionViewCell.h"
#import "YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell.h"

//Model
#import "YJYCCustomerDetailSectionModel.h"


//Layout
#import "YJYCCustomerDetailListLayout.h"

@interface YJYCCustomerDetailPresenter ()<UICollectionViewDataSource,FCCollectionViewDelegateFlowLayout>

/** <#aaa#> */
@property(nonatomic, strong)NSMutableArray<YJYCCustomerDetailSectionModel *> *datas;

@end

@implementation YJYCCustomerDetailPresenter

- (void)analysisData{
    [self.datas removeAllObjects];
    
    FCWeakSelf(self);
    YJYCCustomerDetailSectionModel *sectionM1 = [[YJYCCustomerDetailSectionModel alloc]init:^(YJYCCustomerDetailSectionModel *sm) {
        sm.itemSpace = 0.1;
        sm.lineSpace = 0.1;
        sm.sectionSpace = 10;
        
        CGFloat itemW = CGRectGetWidth(weakself.containerVC.view.bounds);
        
        NSMutableParagraphStyle *rightStyle = NSMutableParagraphStyle.new;
        rightStyle.alignment = NSTextAlignmentRight;
        
        YJYCCustomerDetailItemModel *itemM1 = [[YJYCCustomerDetailItemModel alloc]init:^(YJYCCustomerDetailItemModel *im) {
            im.sizeType = FCBaseKitSizeTypeFixSize;
            im.itemSize = CGSizeMake(itemW, 50);
            im.itemClass = YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell.class;
            im.contentEdgeInsets = UIEdgeInsetsMake(10, 15, 0, 15);
            im.titleAttri = fc_attri(@"建档时间", [UIColor fc_RGBValue:0x333333], 14);
            im.subTitleAttri = fc_attriStyle(@"2021-02-26", [UIColor fc_RGBValue:0x999999], 14, rightStyle);
        }];
        [sm.itemModels addObject:itemM1];
        
        for (NSInteger t = 0; t < 10; t++) {
            YJYCCustomerDetailItemModel *itemM = [[YJYCCustomerDetailItemModel alloc]init:^(YJYCCustomerDetailItemModel *im) {
                im.sizeType = FCBaseKitSizeTypeFixSize;
                im.itemClass = YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell.class;
                im.itemSize = CGSizeMake(itemW, 40);
                im.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
                im.titleAttri = fc_attri(@"建档时间", [UIColor fc_RGBValue:0x333333], 14);
                im.subTitleAttri = fc_attriStyle(@"2021-02-26", [UIColor fc_RGBValue:0x999999], 14, rightStyle);
            }];
            [sm.itemModels addObject:itemM];
        }
        
        for (NSInteger t = 0; t < 3; ++t) {
            YJYCCustomerDetailItemModel *itemM = [[YJYCCustomerDetailItemModel alloc]init:^(YJYCCustomerDetailItemModel *im) {
                im.sizeType = FCBaseKitSizeTypeFixSize;
                im.itemSize = CGSizeMake(itemW, 40);
                im.itemClass = YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell.class;
                im.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
                im.titleAttri = fc_attri(@"建档时间", [UIColor fc_RGBValue:0x333333], 14);
                im.subTitleAttri = fc_attriStyle(@"2021-02-26", [UIColor orangeColor], 14, rightStyle);
                im.hasArrow = YES;
            }];
            [sm.itemModels addObject:itemM];
        }
    }];
    [self.datas addObject:sectionM1];
    
    YJYCCustomerDetailSectionModel *sectionM2 = [[YJYCCustomerDetailSectionModel alloc]init:^(YJYCCustomerDetailSectionModel *sm) {
        sm.itemSpace = 0.1;
        sm.lineSpace = 0.1;
        
        CGFloat itemW = CGRectGetWidth(weakself.containerVC.view.bounds);
        
        NSMutableParagraphStyle *rightStyle = NSMutableParagraphStyle.new;
        rightStyle.alignment = NSTextAlignmentRight;
        
        for (NSInteger t = 0; t < 10; t++) {
            YJYCCustomerDetailItemModel *itemM = [[YJYCCustomerDetailItemModel alloc]init:^(YJYCCustomerDetailItemModel *im) {
                im.sizeType = FCBaseKitSizeTypeFixSize;
                im.itemClass = YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell.class;
                im.itemSize = CGSizeMake(itemW, 40);
                im.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
                im.titleAttri = fc_attri(@"建档时间", [UIColor fc_RGBValue:0x333333], 14);
                im.subTitleAttri = fc_attriStyle(@"2021-02-26", [UIColor fc_RGBValue:0x999999], 14, rightStyle);
            }];
            [sm.itemModels addObject:itemM];
        }
        
    }];
    [self.datas addObject:sectionM2];
    
    [self.collectionView reloadData];
}

//MARK: UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.datas.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.datas[section].itemModels.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YJYCCustomerDetailItemModel *itemM = self.datas[indexPath.section].itemModels[indexPath.item];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(itemM.itemClass) forIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(setItemM:)]) {
        [cell performSelector:@selector(setItemM:) withObject:itemM];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.datas[indexPath.section].itemModels[indexPath.item].itemSize;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return self.datas[section].insetForSection;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return self.datas[section].lineSpace;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return self.datas[section].itemSpace;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return self.datas[section].headerSize;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return self.datas[section].footerSize;
}
/**
 items 水平对齐方式
 */
- (FCCollectionViewItemsHorizontalAlignment)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout itemsHorizontalAlignmentAtIndex:(NSInteger)section{
    return self.datas[section].horizontalAlignment;
}

/**
 items 竖直对齐方式
 */
- (FCCollectionViewItemsVerticalAlignment)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout itemsVerticalAlignmentAtIndex:(NSInteger)section{
    return self.datas[section].verticalAlignment;
}

/**
 items 的流动方向
 */
- (FCCollectionViewItemsFlowDirection)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout itemsFlowDirectionAtIndex:(NSInteger)section{
    return self.datas[section].itemsFlowDirection;
}

/**
 items 的布局方式
 */
- (FCCollectionViewItemsLayoutType)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout itemsLayoutTypeAtIndex:(NSInteger)section{
    return self.datas[section].itemsLayoutType;
}

/** section 之间的间距  */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)layout sectionSpaceAtIndex:(NSInteger)section{
    return self.datas[section].sectionSpace;
}

- (void)setCollectionView:(UICollectionView *)collectionView{
    _collectionView = collectionView;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [_collectionView registerClass:YJYCCustomerDetailDottedLineCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(YJYCCustomerDetailDottedLineCollectionViewCell.class)];
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell.class) bundle:k_source_bundle] forCellWithReuseIdentifier:NSStringFromClass(YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell.class)];
}

- (NSMutableArray<YJYCCustomerDetailSectionModel *> *)datas{
    if (!_datas) {
        _datas = NSMutableArray.array;
    }
    return _datas;
}

@end
