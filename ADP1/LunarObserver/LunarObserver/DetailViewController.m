//
//  DetailViewController.m
//  LunarObserver
//
//  Created by Wesley Seago on 4/7/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize featureLabel;
@synthesize typeLabel;
@synthesize bestTimeLabel;
@synthesize descriptionLabel;

@synthesize featureName;
@synthesize beenObserved;
@synthesize featureType;
@synthesize featureBestTime;
@synthesize featureDescription;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
//    NSLog(@"Passed in Name is %@", featureName);
    
    featureLabel.text = featureName;
    
    typeLabel.text = featureType;
    bestTimeLabel.text = featureBestTime;
    descriptionLabel.text = featureDescription;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
