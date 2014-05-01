//
//  StartupViewController.m
//  LunarObserver
//
//  Created by Wesley Seago on 4/14/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "StartupViewController.h"
#import "MoonPhaseViewController.h"

@interface StartupViewController ()

@end

@implementation StartupViewController



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
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self performSelector:@selector(goToTabBarController) withObject:nil afterDelay:3.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToTabBarController
{
    // segue to tabBarViewController
    [self performSegueWithIdentifier:@"TabBarController" sender:self];
}

@end
