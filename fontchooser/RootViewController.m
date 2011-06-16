//
//  RootViewController.m
//  fontchooser
//
//  Created by David Smith on 6/16/11.
//  Copyright 2011 David Smith. All rights reserved.
//


#import "RootViewController.h"
#import "DetailViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    fontFamilies = [[[UIFont familyNames] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] retain];
    specificFonts = [[NSMutableDictionary dictionaryWithCapacity:[fontFamilies count]] retain];
    
	for( NSString *familyName in fontFamilies ){
		NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        [specificFonts setValue:fontNames forKey:familyName];
	}
    
    self.title = @"Fonts";
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [fontFamilies count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString* family = [fontFamilies objectAtIndex:section];
    return [[specificFonts objectForKey:family] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    NSString* family = [fontFamilies objectAtIndex:indexPath.section];
    NSString* font = [[specificFonts objectForKey:family] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = font;
    cell.textLabel.font = [UIFont fontWithName:font size:16.0];

    cell.detailTextLabel.text = @"Helvetica is perhaps the most popular typeface in the world, and is widely acclaimed as one of the best. Arial is a tawdry, inferior knock-off of Helvetica, but which, to the detriment of the world, Microsoft chose to license for Windows simply because it was cheaper. Because Arial is a default Windows font and Helvetica is not, it is ubiquitous. Mark Simonson’s “The Scourge of Arial” is an excellent resource on both Arial’s history and its typographic deficiencies; his accompanying sidebar is an excellent primer on the specific differences between Arial and Helvetica.";
    cell.detailTextLabel.numberOfLines = 2;
    cell.detailTextLabel.font = [UIFont fontWithName:font size:14.0];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [fontFamilies objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString* family = [fontFamilies objectAtIndex:indexPath.section];
    NSString* font = [[specificFonts objectForKey:family] objectAtIndex:indexPath.row];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailViewController.font = font;
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

- (void)dealloc
{
    [specificFonts release];
    [fontFamilies release];
    [super dealloc];
}

@end
