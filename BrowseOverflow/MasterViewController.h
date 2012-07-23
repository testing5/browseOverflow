//
//  MasterViewController.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/21/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
