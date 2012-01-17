//
//  FirstViewController.m
//  marmaraforum
//
//  Created by Kazim Etiksan on 11/1/11.
//  Copyright (c) 2011 Etiksan. All rights reserved.
//

#import "FirstViewController.h"
#import "MenuViewController.h"
#import "EventViewController.h"
#import "ShopViewController.h"


@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)buttonPressed:(id)sender
{
    int tag = [sender tag];
    UIViewController *v;
    
    if (tag == 0 || tag == 1)
    {
        v = [[[EventViewController alloc] initWithNibName:@"EventViewController" bundle:nil] autorelease];
        [v setViewType:tag];
    }
    else if (tag == 2) 
    {
        v = [[[ShopViewController alloc] initWithNibName:@"ShopViewController" bundle:nil] autorelease];
    }
    else if (tag == 3)
    {
        v = [[[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil] autorelease];
    }
    
    [self.navigationController pushViewController:v animated:TRUE];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
