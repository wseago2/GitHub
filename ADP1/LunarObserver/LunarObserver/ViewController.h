//
//  ViewController.h
//  LunarObserver
//
//  Created by Wesley Seago on 4/7/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, NSCoding>
{
    IBOutlet UITableView *myTableView;
    NSMutableArray *features;
//    NSIndexPath *observedFeatureIndexPath;
//    NSObject *observedObject;
}

@property NSIndexPath *observedIndexPath;
@property NSObject *observedObject;

+ (void)toggleObserved:(NSUInteger)Section row:(NSUInteger)Row;

@end
