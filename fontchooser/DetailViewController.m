//
//  DetailViewController.m
//  fontchooser
//
//  Created by David Smith on 6/16/11.
//  Copyright 2011 David Smith. All rights reserved.
//


#import "DetailViewController.h"


@implementation DetailViewController

@synthesize font;

- (void)dealloc
{
    [font release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    NSString* fireball = @"Helvetica is perhaps the most popular typeface in the world, and is widely acclaimed as one of the best. Arial is a tawdry, inferior knock-off of Helvetica, but which, to the detriment of the world, Microsoft chose to license for Windows simply because it was cheaper. Because Arial is a default Windows font and Helvetica is not, it is ubiquitous. Mark Simonson’s “The Scourge of Arial” is an excellent resource on both Arial’s history and its typographic deficiencies; his accompanying sidebar is an excellent primer on the specific differences between Arial and Helvetica. (John Gruber, http://daringfireball.net/2007/07/iphone_fonts)";
    
    NSString* merlin = @"I'll spare you the nuts and bolts of the numerous and surprising ways that the room in which wealthy persons remove their shoes might contribute to causing a carefully-coiffed, 60-year-old woman to come unglued over \"priorities.\" Suffice to say, fixing this problem was a \"high priority\" for her. So, she said, repeatedly, as I shifted my wallet, let my coffee go cold, and balled the little blue pillow under my neck. (Merlin Mann, http://www.43folders.com/2009/04/28/priorities)";
    
    NSString* marco = @"Try not to add much, if anything. You may assume that you need to mask with milk and sugar because that’s true of bad coffee.\n\nGood coffee has a complex, pleasant taste with many delicate components. Try it black, or only with a bit of cream if you don’t like it black. Please don’t add sugar.\n\nEnjoy! (Marco Arment, http://articles.marco.org/283)";
    
    NSString* lorem = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    
    bodyView.text = [NSString stringWithFormat:@"%@\n-\n%@\n-\n%@\n-\n%@", fireball, merlin, marco, lorem];
    bodyView.font = [UIFont fontWithName:font size:14.0];
    
    titleLabel.text = font;
    titleLabel.font = [UIFont fontWithName:font size:18.0];

    NSLog(@"[UIFont fontWithName:\"%@\" size:12.0];", font);
}

@end
