//
//  MoonPhaseViewController.h
//  LunarObserver
//
//  Created by Wesley Seago on 4/16/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartupViewController.h"

@interface MoonPhaseViewController : UIViewController <CLLocationManagerDelegate>
{
    IBOutlet UILabel *myPhase;
    IBOutlet UILabel *myMoonAge;
    IBOutlet UILabel *myIllumination;
    IBOutlet UILabel *myLatitude;
    IBOutlet UILabel *myLongitude;
    
    NSDictionary *weatherUnderground;
    NSDictionary *moonArray;
}

@property (nonatomic, strong)NSString *currentLatitude;
@property (nonatomic, strong)NSString *currentLongitude;

@end
