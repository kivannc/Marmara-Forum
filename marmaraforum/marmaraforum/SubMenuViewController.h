//
//  SubMenuViewController.h
//  marmaraforum
//
//  Created by Kazim Etiksan on 7/14/11.
//  Copyright 2011 Etiksan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SubMenuViewController : UIViewController {
    
    int menuTag;
    
    NSArray *_roads;
    NSArray *_coords;
    
    UIImageView* _mapIcon;
    UIButton *_mainMenuButton;
    
    int roadCurrent;
    int tagCurrent;
}

@property (nonatomic ,retain) IBOutlet UIImageView *mapIcon;
@property (nonatomic, retain) IBOutlet UIButton *mainMenuButton;

@property (nonatomic, retain) NSArray *roads;
@property (nonatomic, retain) NSArray *coords;

@property (nonatomic) int menuTag;

- (IBAction)openMap:(id)sender;
- (IBAction)navigateBack:(id)sender;

@end
