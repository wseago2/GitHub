//
//  AddItemViewController.h
//  Checklists
//
//  Created by Wesley Seago on 3/5/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class ChecklistItem;

@protocol AddItemViewControllerDelegate <NSObject>

-(void)addItemViewControllerDidCancel:(AddItemViewController *)controller;

-(void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item;

-(void)addItemViewController:(AddItemViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end


@interface AddItemViewController : UITableViewController <UITextFieldDelegate>

-(IBAction)cancel;
-(IBAction)done;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;
@property (nonatomic, strong) ChecklistItem *itemToEdit;

@end
