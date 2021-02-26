//
//  YJYCCustomerDetailCustomTitleCell.m
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import "YJYCCustomerDetailCustomTitleCell.h"

@interface YJYCCustomerDetailCustomTitleCell ()

/** <#aaa#> */
@property(nonatomic, assign)CALayer *backGroundLayer;

@end

@implementation YJYCCustomerDetailCustomTitleCell

- (void)initializeViews{
    [super initializeViews];
    NSLog(@"%@",self);
//    self.backGroundLayer = [CALayer layer];
//    self.backGroundLayer.backgroundColor = [UIColor redColor].CGColor;
//    [self.contentView.layer insertSublayer:self.backGroundLayer atIndex:0];
    
    CALayer *layer = CALayer.layer;
    [self.contentView.layer insertSublayer:layer atIndex:0];
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.backGroundLayer = layer;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat bgWidth = self.contentView.bounds.size.width;
    CGFloat bgHeight = self.contentView.bounds.size.height;
    CGFloat y = self.cellModel.selected ? 10 : 15;
    self.backGroundLayer.frame = CGRectMake(0, y, bgWidth, bgHeight - 10);
    
    if (self.cellModel.selected) {
        self.titleLabelCenterY.constant = 5;
    }else{
        self.titleLabelCenterY.constant = 10;
    }
    
    
}

- (void)reloadData:(JXCategoryBaseCellModel *)cellModel{
    [super reloadData:cellModel];
    [self setNeedsLayout];
}

@end
