//
//  DetailViewController.h
//  fontchooser
//
//  Created by David Smith on 6/16/11.
//  Copyright 2011 David Smith. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {
    IBOutlet UILabel* titleLabel;
    IBOutlet UITextView* bodyView;
}

@property (nonatomic, retain) NSString* font;

@end
