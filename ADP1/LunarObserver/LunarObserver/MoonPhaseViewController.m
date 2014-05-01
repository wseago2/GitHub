//
//  MoonPhaseViewController.m
//  LunarObserver
//
//  Created by Wesley Seago on 4/16/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "MoonPhaseViewController.h"
#import "StartupViewController.h"

@interface MoonPhaseViewController ()

@end

@implementation MoonPhaseViewController

CLLocationManager *locationManager;

@synthesize currentLatitude;
@synthesize currentLongitude;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    // geo location method here
    locationManager = [[CLLocationManager alloc] init];
    if (locationManager != nil)
    {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        [locationManager startUpdatingLocation];
    }
    
    // format latitude and longitude to strings, truncate to 3 decimal places, set to variables
    currentLatitude = [NSString stringWithFormat:@"%.3f", locationManager.location.coordinate.latitude];
    currentLongitude = [NSString stringWithFormat:@"%.3f", locationManager.location.coordinate.longitude];
    
    // update labels
    myLatitude.text = currentLatitude;
    myLongitude.text = currentLongitude;
    
    // shut off location manager
    [locationManager stopUpdatingLocation];
    
    // API method here
    NSString *requestString = [NSString stringWithFormat:@"http://api.wunderground.com/api/d619d852433ce5b4/astronomy/q/%@,%@.json", currentLatitude, currentLongitude];
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *jsonError = nil;
    weatherUnderground = [NSJSONSerialization JSONObjectWithData:response options:0 error:&jsonError];
    if (weatherUnderground != nil)
    {
        moonArray = [weatherUnderground objectForKey:@"moon_phase"];
        if (moonArray != nil)
        {
            NSString *ageOfMoon = [moonArray objectForKey:@"ageOfMoon"];
            NSString *phaseOfMoon = [moonArray objectForKey:@"phaseofMoon"];
            NSString *percentIlluminated = [moonArray objectForKey:@"percentIlluminated"];
            
            myMoonAge.text = ageOfMoon;
            myPhase.text = phaseOfMoon;
            myIllumination.text = percentIlluminated;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

@end
