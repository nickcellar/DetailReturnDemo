//
//  MasterViewController.h
//  DetailReturnDemo
//
//  Created by Nicholas Wong on 3/3/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MasterViewControllerProtocol
- (void)setData:(NSData *)data;
@end

@interface MasterViewController : UITableViewController <MasterViewControllerProtocol>

@end
