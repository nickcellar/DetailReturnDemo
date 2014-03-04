//
//  DetailViewController.h
//  DetailReturnDemo
//
//  Created by Nicholas Wong on 3/3/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
