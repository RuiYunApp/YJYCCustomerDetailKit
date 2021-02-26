//
//  YJYCCustomerDetailDottedLineCollectionViewCell.m
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import "YJYCCustomerDetailDottedLineCollectionViewCell.h"
#import <FCCategoryOCKit/FCCategoryOCKit.h>

#import "YJYCCustomerDetailSectionModel.h"

@interface YJYCCustomerDetailDottedLineCollectionViewCell ()

/** <#aaa#> */
@property(nonatomic, strong)CAShapeLayer *shapeLayer;

@end

@implementation YJYCCustomerDetailDottedLineCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.layer addSublayer:self.shapeLayer];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    UIBezierPath *path = UIBezierPath.bezierPath;
    [path moveToPoint:CGPointMake(self.itemM.contentEdgeInsets.left, self.itemM.itemSize.height * 0.5)];
    [path addLineToPoint:CGPointMake(self.itemM.itemSize.width - self.itemM.contentEdgeInsets.right, self.itemM.itemSize.height * 0.5)];
    self.shapeLayer.path = path.CGPath;
    self.shapeLayer.frame = self.bounds;
}

- (CAShapeLayer *)shapeLayer{
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.strokeColor = [UIColor fc_RGBValue:0x999999].CGColor;

        _shapeLayer.fillColor = nil;

        _shapeLayer.lineWidth = 1.f;

        _shapeLayer.lineCap = @"square";

        _shapeLayer.lineDashPattern = @[@4, @2];
            
    }
    return _shapeLayer;
}

@end
