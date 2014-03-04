//
//  ChoicesViewController.h
//  DetailReturnDemo
//
//  Created by Nicholas Wong on 3/3/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"

@interface ChoicesViewController : UITableViewController
@property (nonatomic, weak) id<MasterViewControllerProtocol> delegate;
@end
