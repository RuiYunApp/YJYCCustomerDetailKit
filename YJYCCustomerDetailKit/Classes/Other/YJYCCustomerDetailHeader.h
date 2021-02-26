//
//  YJYCCustomerDetailHeader.h
//  YJYCCustomerDetailKit
//
//  Created by yjy on 2021/2/26.
//

#ifndef YJYCCustomerDetailHeader_h
#define YJYCCustomerDetailHeader_h

typedef NS_ENUM(NSInteger, YJYCCustomerDetailNetworkingState){
    YJYCCustomerDetailNetworkingStateNone,
    YJYCCustomerDetailNetworkingStateLoading,
    YJYCCustomerDetailNetworkingStateFail,
    YJYCCustomerDetailNetworkingStateSucess,
};

#define k_source_bundle [NSBundle bundleWithPath:[[NSBundle bundleForClass:self.class] pathForResource:@"YJYCCustomerDetailKit" ofType:@"bundle"]]
#define k_source_img( imgName ) [UIImage imageNamed:imgName inBundle:k_source_bundle withConfiguration:nil]


#endif /* YJYCCustomerDetailHeader_h */
