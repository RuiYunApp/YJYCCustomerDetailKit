//
//  YJYCCustomerDetailCustomeTitleView.m
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#import "YJYCCustomerDetailCustomeTitleView.h"

@implementation YJYCCustomerDetailCustomeTitleView

- (void)initializeData {
    [super initializeData];
}

//返回自定义的cell class
- (Class)preferredCellClass {
    return [YJYCCustomerDetailCustomTitleCell class];
}

@end
