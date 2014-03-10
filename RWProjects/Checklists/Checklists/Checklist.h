//
//  Checklist.h
//  Checklists
//
//  Created by Wesley Seago on 3/10/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *items;

@end
