//
//  EventViewController.h
//  marmaraforum
//
//  Created by Kazim Etiksan on 10/20/11.
//  Copyright 2011 Etiksan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventViewController : UIViewController
<UIScrollViewDelegate, UIAlertViewDelegate>
{
    UIScrollView *_scroll;
    UILabel *_eventTitle;
    NSMutableArray *_titleArray;
    
    NSMutableData *_receivedData;
    NSURLConnection *_conn;
    
    int currentPage;
    int totalPages;
    
    int viewType;
}

@property (nonatomic) int viewType;

@property (nonatomic, retain) IBOutlet UIScrollView *scroll;
@property (nonatomic, retain) IBOutlet UILabel *eventTitle;

@property (nonatomic ,retain) NSMutableArray *titleArray;

@property (nonatomic, assign) NSMutableData *receivedData;
@property (nonatomic, assign) NSURLConnection *conn;

- (IBAction)scrollButtonPressed:(id)sender;
- (IBAction)navigateBack:(id)sender;


@end
