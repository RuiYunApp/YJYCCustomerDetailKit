//
//  FCCollectionViewSectionModel.h
//  FCBaseKit
//
//  Created by 石富才 on 2020/12/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FCBaseKitHeader.h"

//__contravariant : 父类可转换为子类
//__covariant : 当前类和其子类
@interface FCCollectionViewSectionModel<T> : NSObject

/** 事件集合  */
@property(nonatomic, strong)NSMutableDictionary *blockActions;

/** 组头 supplementView 的 Class  */
@property(nonatomic)Class headerClass;
/** 组头 supplementView 的 size   */
@property(nonatomic)CGSize headerSize;
/** 组头 supplementView 的大小决方式  */
@property(nonatomic, assign)FCBaseKitSizeType headerSizeType;
/** 组头 supplementView 的边距  */
@property(nonatomic)UIEdgeInsets headerEdgeInsets;
/** 组头 supplementView 的背景颜色  */
@property(nonatomic, strong)UIColor *headerBackgroundColor;

/** 组尾  supplementView 的 Class  */
@property(nonatomic)Class footerClass;
/** 组尾  supplementView 的 size   */
@property(nonatomic)CGSize footerSize;
/** 组尾  supplementView 的大小决方式  */
@property(nonatomic, assign)FCBaseKitSizeType footerSizeType;
/** 组尾  supplementView 的边距  */
@property(nonatomic)UIEdgeInsets footerEdgeInsets;
/** 组尾 supplementView 的背景颜色  */
@property(nonatomic, strong)UIColor *footerBackgroundColor;

/** 与 CollectionView 滚动方向垂直的 item 之间的间距  */
@property(nonatomic, assign)CGFloat lineSpace;
/** 与 CollectionView 滚动方向水平的 item 之间的间距  */
@property(nonatomic, assign)CGFloat itemSpace;

/** 索引  */
@property(nonatomic, strong)NSIndexPath *indexPath;

/** 标题  */
@property(nonatomic, strong)NSAttributedString *titleAttri;
/** 子标题  */
@property(nonatomic, strong)NSAttributedString *subTitleAttri;

/** __kindof 表示 items 中 可以是 T 或 T的子类  */
@property(nonatomic, strong, readonly)NSMutableArray<T> *itemModels;

/** 组内边距  */
@property(nonatomic)UIEdgeInsets insetForSection;

/** section 之间的间距  */
@property(nonatomic, assign)CGFloat sectionSpace;

@end


@interface FCCollectionViewItemModel : NSObject

/** 事件集合  */
@property(nonatomic, strong)NSMutableDictionary *blockActions;
/** 大小决方式  */
@property(nonatomic, assign)FCBaseKitSizeType sizeType;
/** UICollectionViewCell 的 class  */
@property(nonatomic)Class itemClass;
/** UICollectionViewCell 的size  */
@property(nonatomic)CGSize itemSize;

/** 最大宽度  sizeType == FCBaseKitSizeTypeFixHeight */
@property(nonatomic, assign)CGFloat maxWidth;
/** 最大高度 sizeType == FCBaseKitSizeTypeFixWidth */
@property(nonatomic, assign)CGFloat maxHeight;

/** UICollectionViewCell 的背景颜色  */
@property(nonatomic, strong)UIColor *backgroundColor;
/** UICollectionViewCell 的索引  */
@property(nonatomic, strong)NSIndexPath *indexPath;
/** UICollectionViewCell 的内容边距  */
@property(nonatomic)UIEdgeInsets contentEdgeInsets;
/** 标题  */
@property(nonatomic, strong)NSAttributedString *titleAttri;
/** 子标题  */
@property(nonatomic, strong)NSAttributedString *subTitleAttri;
/** 提示文本  */
@property(nonatomic, strong)NSAttributedString *attributedPlaceholder;

//--------------》分割线
/** UICollectionViewCell 为分割线时，分割线颜色  */
@property(nonatomic, strong)UIColor *lineColor;
//-------------《

//--------------》路由
/** 类  */
@property(nonatomic, copy)NSString *target;
/** 方法  */
@property(nonatomic, copy)NSString *action;
/** 路由参数  */
@property(nonatomic, strong)NSDictionary *routerParams;

//** 路由地址： **://Target_**/Action_**?a=1&b=2 */
@property(nonatomic, copy)NSString *router;
//---------------《

//--------------- 》
/** <#aaa#>  */
@property(nonatomic)SEL selector;
//---------------《
/** 控制器专场动画  */
@property(nonatomic, assign)FCBaseKitVCAnimationType vcAnimationType;
/** 控制器专场时是否加动画  */
@property(nonatomic, assign)BOOL vcAnimation;



@end
