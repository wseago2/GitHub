//
//  DetailViewController.h
//  LunarObserver
//
//  Created by Wesley Seago on 4/7/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeatureItem.h"

@interface DetailViewController : UIViewController
{
    
}

@property (nonatomic, strong) IBOutlet UILabel *featureLabel;
@property (nonatomic, strong) IBOutlet UILabel *typeLabel;
@property (nonatomic, strong) IBOutlet UILabel *bestTimeLabel;
@property (nonatomic, strong) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) IBOutlet UILabel *markedObserved;

@property (nonatomic, strong) NSString *featureName;
@property (nonatomic, strong) NSString *beenObserved;
@property (nonatomic, strong) NSString *featureType;
@property (nonatomic, strong) NSString *featureBestTime;
@property (nonatomic, strong) NSString *featureDescription;

- (IBAction)onMarkObserved:(id)sender;

@end
