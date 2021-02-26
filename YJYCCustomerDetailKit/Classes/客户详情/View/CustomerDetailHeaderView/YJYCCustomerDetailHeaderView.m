//
//  YJYCCustomerDetailHeaderView.m
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import "YJYCCustomerDetailHeaderView.h"

@implementation YJYCCustomerDetailHeaderView

+ (Class)layerClass{
    return CAGradientLayer.class;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    CAGradientLayer *shapeLayer = (CAGradientLayer *)self.layer;
    shapeLayer.startPoint = CGPointMake(0, 0.5);
    shapeLayer.endPoint = CGPointMake(1, 0.5);
    shapeLayer.colors = @[(__bridge id)UIColor.blueColor.CGColor,(__bridge id)UIColor.greenColor.CGColor];
    shapeLayer.locations = @[@0,@1];
}

@end
