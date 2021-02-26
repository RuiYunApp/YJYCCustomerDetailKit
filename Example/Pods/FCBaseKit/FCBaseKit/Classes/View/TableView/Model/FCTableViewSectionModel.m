//
//  FCTableViewSectionModel.m
//  FCBaseKit
//
//  Created by 石富才 on 2020/12/16.
//

#import "FCTableViewSectionModel.h"

@interface FCTableViewSectionModel ()

/** <#aaa#>  */
@property(nonatomic, strong)NSMutableArray *cellModels;

@end

@implementation FCTableViewSectionModel

- (NSMutableDictionary *)blockActions{
    if (!_blockActions) {
        _blockActions = NSMutableDictionary.dictionary;
    }
    return _blockActions;
}

- (NSMutableArray *)cellModels{
    if (!_cellModels) {
        _cellModels = NSMutableArray.array;
    }
    return _cellModels;
}

@end

@implementation FCTableViewCellModel

- (NSMutableDictionary *)blockActions{
    if (!_blockActions) {
        _blockActions = NSMutableDictionary.dictionary;
    }
    return _blockActions;
}

@end
