//
//  SubMenuViewController.m
//  marmaraforum
//
//  Created by Kazim Etiksan on 7/14/11.
//  Copyright 2011 Etiksan. All rights reserved.
//

#import "SubMenuViewController.h"
#import "MapViewController.h"
#import "ButtonViewController.h"
#import "Constants.h"


@implementation SubMenuViewController

@synthesize menuTag,
            roads=_roads,
            coords=_coords;

@synthesize mainMenuButton=_mainMenuButton,
            mapIcon=_mapIcon;

- (IBAction)openMap:(id)sender {
    
    int tag = [sender tag];
    
    NSLog(@"map with tag: %d",tag);
    
    MapViewController* m = [[MapViewController alloc]
                            initWithNibName:@"MapViewController" bundle:nil];
    m.mapTag = tag;
    [self.navigationController pushViewController:m animated:TRUE];
    [m release];
}

- (IBAction)navigateBack:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:TRUE];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_roads release];
    [_coords release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)initiateButton:(NSNumber*)tag
{
    
    NSArray *road = [self.roads objectAtIndex:[tag intValue]];
    
    int roadCount = [road count];
    
    int yOffset = [[self.coords objectAtIndex:self.menuTag] intValue] +(roadCurrent*35);
    ButtonViewController *button = [[ButtonViewController alloc]
                                    initWithNibName:@"ButtonViewController" bundle:nil];
    button.view.frame = CGRectMake(-385, yOffset, 385, 24);
    [button.lbl setTitle:[road objectAtIndex:roadCurrent] forState:UIControlStateNormal];
    button.lbl.tag = roadCurrent+tagCurrent;
    [button.lbl addTarget:self action:@selector(openMap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button.view];
    
    [UIView animateWithDuration:kDefaultButtonLeftToRightDuration
                     animations:^(void) {
                         
                         button.view.frame = CGRectMake(-20, yOffset, 385, 24);
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:kDefaultButtonRightToLeftDuration
                                          animations:^(void) {
                                              
                                              button.view.frame = CGRectMake(-30, yOffset, 385, 24);
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              [button release];
                                          }];
                     }];
    
    if (++roadCurrent < roadCount) {
        
        [self performSelector:@selector(initiateButton:) withObject:tag afterDelay:kDefaultButtonAnimationDelay];
    }
}

#pragma mark - View lifecycle

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self initiateButton:[NSNumber numberWithInt:self.menuTag]];

    [UIView animateWithDuration:kDefaultAnimationDuration
                     animations:^(void) {
                         
                         self.mapIcon.frame = CGRectMake(381, 10, 89, 40);
                         self.mainMenuButton.frame = CGRectMake(377, 290, 103, 21);
                     }
                     completion:^(BOOL finished) {
                         
                         // done
                     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    roadCurrent = 0;
    
    if (self.menuTag == 0)
        tagCurrent = 0;
    else if (self.menuTag == 1)
        tagCurrent = 6;
    else
        tagCurrent = 9;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"road" ofType:@"plist"];
    self.roads = [[NSArray alloc] initWithContentsOfFile:path];
    
    self.coords = [[NSArray alloc]
                   initWithObjects:
                   [NSNumber numberWithInt:80], 
                   [NSNumber numberWithInt:130], 
                   [NSNumber numberWithInt:140], 
                   nil];
}

- (void)viewDidUnload
{
    self.mainMenuButton = nil;
    self.mapIcon = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
