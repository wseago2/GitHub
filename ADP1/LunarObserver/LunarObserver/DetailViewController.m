//
//  DetailViewController.m
//  LunarObserver
//
//  Created by Wesley Seago on 4/7/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "DetailViewController.h"
#import "FeatureItem.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize featureLabel;
@synthesize typeLabel;
@synthesize bestTimeLabel;
@synthesize descriptionLabel;
@synthesize markedObserved;

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
//    NSLog(@"Feature has been observed %@", beenObserved);
    
    featureLabel.text = featureName;
    typeLabel.text = featureType;
    bestTimeLabel.text = featureBestTime;
    descriptionLabel.text = featureDescription;
    markedObserved.text = beenObserved;
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onMarkObserved:(id)sender
{
    NSLog(@"Mark Observed button clicked");
    
    // change observed to @"YES"
    
    
    
    // dismiss view
    [self.navigationController popViewControllerAnimated:YES];
    // save data and refresh tableview
    
    
    
}

@end
