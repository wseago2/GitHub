//
//  AddItemViewController.m
//  Checklists
//
//  Created by Wesley Seago on 3/5/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// presentingViewController is the ChecklistsViewController
- (IBAction)cancel
{
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)done
{
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:nil];
}

@end
