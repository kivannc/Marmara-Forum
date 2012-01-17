//
//  ShopViewController.m
//  marmaraforum
//
//  Created by Kazim Etiksan on 10/20/11.
//  Copyright 2011 Etiksan. All rights reserved.
//

#import "ShopViewController.h"
#import "Constants.h"
#import "SBJSON.h"
#import "Reachability.h"

@implementation ShopViewController

@synthesize receivedData=_receivedData,
            conn=_conn,
            shops=_shops,
            shopTypes=_shopTypes,
            tView=_tView,
            buttonArray=_buttonArray;

- (IBAction)navigateBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:TRUE];
}

// TABLEVIEW
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = [self.shops objectForKey:[self.shopTypes objectAtIndex:selectedShopIndex]];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID]
                autorelease];
    }
    
    NSArray *array = [self.shops objectForKey:[self.shopTypes objectAtIndex:selectedShopIndex]];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"shop_name" ascending:YES]; 
    NSArray *sortDescriptors = [[[NSArray alloc] initWithObjects:&sortDescriptor count:1] autorelease];
    NSMutableArray *sortedArray = [[[NSMutableArray alloc] initWithArray:array] autorelease];
    [sortedArray sortUsingDescriptors:sortDescriptors];
    //NSLog(@"%@",array);
    
    cell.textLabel.font = [UIFont boldSystemFontOfSize:12.0];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [[sortedArray objectAtIndex:indexPath.row] objectForKey:@"shop_name"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NetworkStatus)checkNetworkStatus {
    
	Reachability* reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
	NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    
	return (remoteHostStatus == ReachableViaWiFi || remoteHostStatus == ReachableViaWWAN);
}

- (NSString *)applicationDocumentsDirectory {
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
												NSUserDomainMask, YES) lastObject];
}

- (void)createLocalCopy
{
   /* 
    NSString* path = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"peugeot.plist"];
    NSMutableArray* pArray = [[NSMutableArray alloc]
                              initWithContentsOfFile:path];
    
    NSDictionary* dict = [[NSDictionary alloc]
                          initWithObjectsAndKeys:
                          self.name.text, @"name",
                          self.email.text, @"email",
                          [self formatNumber:self.gsm.text], @"gsm",
                          self.cityLabel.text, @"city",
                          nil];
    
    [pArray addObject:dict];
    
    if ([pArray writeToFile:path atomically:TRUE]) {
        
        NSLog(@"added local copy");
    }
    
    [dict release];
    [pArray release];
    */
}



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

#pragma mark - View lifecycle

- (void)buttonPressed:(id)sender
{
    int tag = [sender tag];
    //NSLog(@"button tag: %d",tag);
    
    selectedShopIndex = tag;
    [self.tView reloadData];
    
    [UIView animateWithDuration:0.2
                     animations:^(void) {
                         
                         for (int i=0; i<[_buttonArray count]; i++)
                         {
                             if (i==selectedShopIndex) [[_buttonArray objectAtIndex:i] setAlpha:1.0];
                             else [[_buttonArray objectAtIndex:i] setAlpha:0.5];
                         }
                         
                     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* path = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:kShopsFile];
    self.shops = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[self.shops allKeys] copyItems:TRUE];
    [array removeObject:@"Diğer"];
    [array addObject:@"Diğer"];
    
    self.shopTypes = array;
    self.buttonArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i < [self.shops count]; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 70+(i*34), 194, 24);
        
        button.titleLabel.textAlignment = UITextAlignmentLeft;
        button.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        
        [button setTitle:[self.shopTypes objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitle:[self.shopTypes objectAtIndex:i] forState:UIControlStateHighlighted];
        
        [button setBackgroundImage:[UIImage imageNamed:@"shop_item.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"shop_item.png"] forState:UIControlStateHighlighted];
        
        button.tag = i;
        
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i) button.alpha = 0.5;
        
        [self.buttonArray addObject:button];
        [self.view addSubview:button];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if ([self checkNetworkStatus]) {
    
        NSString* postBody = @"";
        
        NSData *postData = [postBody dataUsingEncoding:NSUTF8StringEncoding];
        
        NSString *urlString = [NSString stringWithFormat:@"%@shops.php?type=json",kWebService];
        NSLog(urlString);
        
        NSURL* urlData = [NSURL URLWithString:urlString];
        
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:urlData 
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy 
                                                           timeoutInterval:10.0];
        
        [request setHTTPMethod:HTTP_METHOD];
        [request setHTTPBody:postData];
        [request setValue:[NSString stringWithFormat:@"%d",[postData length]] forHTTPHeaderField:@"Content-Length"];
        
        _conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        if (_conn) {
            
            _receivedData = [[NSMutableData alloc] init];
            NSLog(@"request sent");
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.tView = nil;
}

- (void)dealloc
{
    [super dealloc];
    
    [_shopTypes release];
    [_shops release];
    [_buttonArray release];
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
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
	
    NSString* receivedString = [[NSString alloc] initWithData:_receivedData encoding:NSUTF8StringEncoding];
	
	SBJSON *jsonParser = [[SBJSON new] autorelease];
	NSArray *result = (NSArray*)[jsonParser objectWithString:receivedString];
    
    NSString* path = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:kShopsFile];
    [result writeToFile:path atomically:TRUE];
    
    [_conn release];
    [_receivedData release];
}


@end
