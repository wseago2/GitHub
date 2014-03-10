//
//  DataModel.h
//  Checklists
//
//  Created by Wesley Seago on 3/10/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

- (void)saveChecklists;

- (NSInteger)indexOfSelectedChecklist;

- (void)setIndexOfSelectedChecklist:(NSInteger)index;

@end
