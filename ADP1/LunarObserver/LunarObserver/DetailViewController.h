//
//  DetailViewController.h
//  LunarObserver
//
//  Created by Wesley Seago on 4/7/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *featureLabel;
@property (nonatomic, strong) IBOutlet UILabel *typeLabel;
@property (nonatomic, strong) IBOutlet UILabel *bestTimeLabel;
@property (nonatomic, strong) IBOutlet UILabel *descriptionLabel;

@property (nonatomic, strong) NSString *featureName;
@property (assign) BOOL *beenObserved;
@property (nonatomic, strong) NSString *featureType;
@property (nonatomic, strong) NSString *featureBestTime;
@property (nonatomic, strong) NSString *featureDescription;

@end
