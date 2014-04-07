//
//  FeatureItem.m
//  LunarObserver
//
//  Created by Wesley Seago on 4/7/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "FeatureItem.h"

@implementation FeatureItem

- (void)toggleObserved
{
    self.observed = !self.observed;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init]))
    {
        self.featureName = [aDecoder decodeObjectForKey:@"FeatureItem"];
        self.observed = [aDecoder decodeBoolForKey:@"Checked"];
        self.featureType = [aDecoder decodeObjectForKey:@"FeatureType"];
        self.featureBestTime = [aDecoder decodeObjectForKey:@"FeatureBestTime"];
        self.featureDescription = [aDecoder decodeObjectForKey:@"FeatureDescription"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.featureName forKey:@"FeatureItem"];
    [aCoder encodeBool:self.observed forKey:@"Checked"];
    [aCoder encodeObject:self.featureType forKey:@"FeatureType"];
    [aCoder encodeObject:self.featureBestTime forKey:@"FeatureBestTime"];
    [aCoder encodeObject:self.featureDescription forKey:@"FeatureDescription"];
}

@end
