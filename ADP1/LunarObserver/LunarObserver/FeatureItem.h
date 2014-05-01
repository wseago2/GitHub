//
//  FeatureItem.h
//  LunarObserver
//
//  Created by Wesley Seago on 4/7/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeatureItem : NSObject <NSCoding>

@property (nonatomic, copy) NSString *featureName;
@property (nonatomic, readwrite) NSString *observed;
@property (nonatomic, copy) NSString *featureType;
@property (nonatomic, copy) NSString *featureBestTime;
@property (nonatomic, copy) NSString *featureDescription;

@end
