//
//  ChoicesViewController.m
//  DetailReturnDemo
//
//  Created by Nicholas Wong on 3/3/14.
//  Copyright (c) 2014 Nicholas Workshop. All rights reserved.
//

#import "ChoicesViewController.h"

@interface ChoicesViewController (){
    NSMutableArray *_objects;
}
@end

@implementation ChoicesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // init data
    _objects = [[NSMutableArray alloc] init];
    [_objects addObject:@"A"];
    [_objects addObject:@"B"];
    [_objects addObject:@"C"];
    [_objects addObject:@"D"];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = _objects[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate updateItem:_itemId withChoice:_objects[indexPath.row]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
