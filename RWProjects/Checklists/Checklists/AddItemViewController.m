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
    
    NSLog(@"Contents of the text field: %@", self.textField.text);
    
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:nil];
}


- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


// use viewWillAppear to make textField the first responder so the keyboard will be visible without having to tap the text field
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
}

@end
