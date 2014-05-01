//
//  DetailViewController.m
//  LunarObserver
//
//  Created by Wesley Seago on 4/7/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "DetailViewController.h"
#import "FeatureItem.h"
#import "ViewController.h"

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

@synthesize selectedFeatureIndexPath;


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


- (IBAction)onMarkObserved:(id)sender
{
    // change observed to @"YES"
    self.beenObserved = @"YES";
    
    // set indexPath to variables
    NSUInteger Section = selectedFeatureIndexPath.section;
    NSUInteger Row = selectedFeatureIndexPath.row;
    
    // call toggleObserved method
    [ViewController toggleObserved:Section row:Row];
    
    // dismiss view
    [self.navigationController popViewControllerAnimated:YES];

}

@end
