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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
