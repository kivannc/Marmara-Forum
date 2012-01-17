//
//  MenuViewController.h
//  marmaraforum
//
//  Created by Kazim Etiksan on 7/14/11.
//  Copyright 2011 Etiksan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MenuViewController : UIViewController {
    
    NSArray *_coords;
    
    UIButton *_mainMenuButton;
}

@property (nonatomic ,retain) IBOutlet UIButton *mainMenuButton;
@property (nonatomic, retain) NSArray *coords;

- (IBAction)openEvents:(id)sender;
- (IBAction)openShops:(id)sender;

- (IBAction)navigateBack:(id)sender;


@end
