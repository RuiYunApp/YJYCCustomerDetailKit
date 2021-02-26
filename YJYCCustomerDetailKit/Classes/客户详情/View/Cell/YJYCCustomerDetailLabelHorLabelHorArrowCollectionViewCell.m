//
//  YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell.m
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import "YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell.h"

#import "YJYCCustomerDetailSectionModel.h"

@interface YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightLayoutConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *subLabelToArrowSpaceLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *arrowWidthLayoutConstraint;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;

@end

@implementation YJYCCustomerDetailLabelHorLabelHorArrowCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItemM:(YJYCCustomerDetailItemModel *)itemM{
    
    self.topLayoutConstraint.constant = itemM.contentEdgeInsets.top;
    self.leftLayoutConstraint.constant = itemM.contentEdgeInsets.left;
    self.buttomLayoutConstraint.constant = itemM.contentEdgeInsets.bottom;
    self.rightLayoutConstraint.constant = itemM.contentEdgeInsets.right;
    
    if (itemM.hasArrow) {
        self.arrowWidthLayoutConstraint.constant = 8;
        self.subLabelToArrowSpaceLayoutConstraint.constant = 10;
    }else{
        self.arrowWidthLayoutConstraint.constant = 0;
        self.subLabelToArrowSpaceLayoutConstraint.constant = 0;
    }
    
    self.titleLabel.attributedText = itemM.titleAttri;
    self.subTitleLabel.attributedText = itemM.subTitleAttri;
    
    [super setItemM:itemM];
    [self layoutIfNeeded];
}

@end
