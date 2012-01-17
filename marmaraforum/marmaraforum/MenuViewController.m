//
//  MenuViewController.m
//  marmaraforum
//
//  Created by Kazim Etiksan on 7/14/11.
//  Copyright 2011 Etiksan. All rights reserved.
//

#import "MenuViewController.h"
#import "SubMenuViewController.h"
#import "EventViewController.h"
#import "ShopViewController.h"

#import "Constants.h"


@implementation MenuViewController

@synthesize coords=_coords, mainMenuButton=_mainMenuButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)openTitle:(id)sender {
    
    int tag = [sender tag];
    
    NSLog(@"tag did sent: %d",tag);
    
    SubMenuViewController* v = [[SubMenuViewController alloc]
                                initWithNibName:@"SubMenuViewController" bundle:nil];
    v.menuTag = tag;
    [self.navigationController pushViewController:v animated:TRUE];
    [v release];
}

- (IBAction)openEvents:(id)sender
{
    EventViewController *v = [[EventViewController alloc]
                              initWithNibName:@"EventViewController" bundle:nil];
    [self.navigationController pushViewController:v animated:TRUE];
    
    [v release];
}

- (IBAction)openShops:(id)sender
{
    ShopViewController *v = [[ShopViewController alloc]
                              initWithNibName:@"ShopViewController" bundle:nil];
    [self.navigationController pushViewController:v animated:TRUE];
    
    [v release];
}

- (IBAction)navigateBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:TRUE];
}


- (void)initiateButton:(NSNumber*)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGRect startFrame = [[self.coords objectAtIndex:[tag intValue]] CGRectValue];
    button.frame = CGRectMake(startFrame.origin.x-startFrame.size.width,
                              startFrame.origin.y,
                              startFrame.size.width,
                              startFrame.size.height);
    
    
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ulasim%d.png",[tag intValue]]] 
            forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"ulasim%d.png",[tag intValue]]] 
            forState:UIControlStateHighlighted];
    
    button.tag = [tag intValue];
    [button addTarget:self action:@selector(openTitle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [UIView animateWithDuration:kDefaultButtonLeftToRightDuration
                     animations:^(void) {
                         
                         button.frame = CGRectMake(button.frame.origin.x+button.frame.size.width+30,
                                                   button.frame.origin.y, 
                                                   button.frame.size.width,
                                                   button.frame.size.height);
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:kDefaultButtonRightToLeftDuration
                                          animations:^(void) {
                                              
                                              button.frame = CGRectMake(button.frame.origin.x-10,
                                                                        button.frame.origin.y, 
                                                                        button.frame.size.width,
                                                                        button.frame.size.height);
                                          }
                                          completion:^(BOOL finished) {
                                              
                                          }];
                     }];
    
    int next = [tag intValue]+1;
    if (next < [self.coords count]) {
        
        [self performSelector:@selector(initiateButton:) 
                   withObject:[NSNumber numberWithInt:next]
                   afterDelay:kDefaultButtonAnimationDelay];
    }
}




- (void)dealloc
{
    [_coords release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.coords = [[NSArray alloc]
                   initWithObjects:
                   [NSValue valueWithCGRect:CGRectMake(-30, 102, 310, 39)], 
                   [NSValue valueWithCGRect:CGRectMake(-30, 152, 357, 39)], 
                   [NSValue valueWithCGRect:CGRectMake(-30, 202, 403, 39)], 
                   nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self initiateButton:[NSNumber numberWithInt:0]];
    
    [UIView animateWithDuration:kDefaultAnimationDuration
                     animations:^(void) {
                         
                         self.mainMenuButton.frame = CGRectMake(377, 290, 103, 21);
                     }
                     completion:^(BOOL finished) {
                         
                         // done
                     }];
}

- (void)viewDidUnload
{
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
