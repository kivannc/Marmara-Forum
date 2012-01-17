//
//  EventViewController.m
//  marmaraforum
//
//  Created by Kazim Etiksan on 10/20/11.
//  Copyright 2011 Etiksan. All rights reserved.
//

#import "EventViewController.h"
#import "SBJSON.h"
#import "Reachability.h"
#import "Constants.h"

@implementation EventViewController

@synthesize scroll=_scroll, viewType,
            receivedData=_receivedData,
            conn=_conn,
            eventTitle=_eventTitle,
            titleArray=_titleArray;

- (NetworkStatus)checkNetworkStatus {
    
	Reachability* reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
	NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
	return (remoteHostStatus == ReachableViaWiFi || remoteHostStatus == ReachableViaWWAN);
}

// ALERT DELEGATE
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self navigateBack:nil];
}


// SCROLL DELEGATE
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    currentPage = self.scroll.contentOffset.x/kLandscapeImageWidth;
    NSLog(@"did end dec. - currentX = %d",currentPage);
    
    self.eventTitle.text = [self.titleArray objectAtIndex:currentPage];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)scrollButtonPressed:(id)sender
{
    int tag = [sender tag];
    
    if (tag == 0) {
        
        if (currentPage > 0)
            [self.scroll setContentOffset:CGPointMake(--currentPage*kLandscapeImageWidth, 0) animated:TRUE];
        
    } else {
        
        if (currentPage < totalPages-1)
            [self.scroll setContentOffset:CGPointMake(++currentPage*kLandscapeImageWidth, 0) animated:TRUE];
    }
    
    self.eventTitle.text = [self.titleArray objectAtIndex:currentPage];
}

- (IBAction)navigateBack:(id)sender {
    
    self.scroll.delegate = nil;
    [self.navigationController popViewControllerAnimated:TRUE];
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
    
    self.scroll.decelerationRate = UIScrollViewDecelerationRateFast;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    self.scroll = nil;
}

- (void)dealloc
{
    [super dealloc];
    
    [_titleArray release];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self checkNetworkStatus]) {
        
        NSString* postBody = @"";
        
        NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
        
        
        NSString *urlString = self.viewType == kViewEvents ?
                            [NSString stringWithFormat:@"%@events.php",kWebService]
        : [NSString stringWithFormat:@"%@promotions.php",kWebService];
        
        NSLog(urlString);
        
        NSURL* urlData = [NSURL URLWithString:urlString];
        
        //NSLog(urlString);
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:urlData 
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy 
                                                           timeoutInterval:10.0];
        
        [request setHTTPMethod:HTTP_METHOD];
        [request setHTTPBody:postData];
        [request setValue:[NSString stringWithFormat:@"%d",[postData length]] forHTTPHeaderField:@"Content-Length"];
        
        _conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        if (_conn) {
            
            _receivedData = [[NSMutableData alloc] init];
        }
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Uyarı"
                              message:@"Etkinlikleri görebilmek için Internete bağlı olmanız gerekmektedir."
                              delegate:self
                              cancelButtonTitle:@"Tamam"
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

#pragma mark - NSURLConnection Delegate

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	
    [_receivedData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	
	[_receivedData appendData:data];    
    
    NSLog(@"did receive data with length: %d",[data length]);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
	
    NSString* receivedString = [[NSString alloc] initWithData:_receivedData encoding:NSUTF8StringEncoding];
	
	SBJSON *jsonParser = [[SBJSON new] autorelease];
	NSArray *result = (NSArray*)[jsonParser objectWithString:receivedString];
     
    self.titleArray = [[NSMutableArray alloc] init];
    totalPages = [result count];
    self.scroll.contentSize = CGSizeMake(totalPages*kLandscapeImageWidth, kLandscapeImageHeight);
    
    for (int i=0; i<[result count]; i++)
    {
        NSString *imageUrlString = [NSString stringWithFormat:@"%@images/%@",kWebService,[[result objectAtIndex:i] objectForKey:IMAGE_NAME]];
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrlString]];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageWithData:imgData]];
        imgView.frame = CGRectMake(kLandscapeImageWidth*i, 0, kLandscapeImageWidth, kLandscapeImageHeight);
        
        [self.scroll addSubview:imgView];
        [imgView release];
        
        [self.titleArray addObject:[[result objectAtIndex:i] objectForKey:EVENT_TITLE]];
    }
    
    
    self.eventTitle.text = [[result objectAtIndex:0] objectForKey:EVENT_TITLE];
    
    //NSLog(@"%@",receivedString);
    //NSLog(@"%@",result);
    
    [_conn release];
    [_receivedData release];
}



@end
