//
//  MasterViewController.m
//  DetailReturnDemo
//
//  Created by Nicholas Wong on 3/3/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import "MasterViewController.h"
#import "ChoicesViewController.h"

@interface MasterViewController () {
    NSMutableArray *_items;
    NSMutableArray *_choices;
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // init items
    _items = [[NSMutableArray alloc] init];
    [_items addObject:@"One"];
    [_items addObject:@"Two"];
    [_items addObject:@"Three"];
    [_items addObject:@"Four"];
    
    // init choices
    _choices = [[NSMutableArray alloc] init];
    [_choices addObject:@"?"];
    [_choices addObject:@"?"];
    [_choices addObject:@"?"];
    [_choices addObject:@"?"];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = _items[indexPath.row];
    cell.detailTextLabel.text = _choices[indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowChoices"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ChoicesViewController *controller = [segue destinationViewController];
        [controller setDelegate:self];
        [controller setItemId:indexPath.row];
    }
}

- (void)updateItem:(int)itemId withChoice:(NSString *)choice
{
    _choices[itemId] = choice;
    [self.tableView reloadData];
}

@end
