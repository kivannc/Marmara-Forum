//
//  ShopViewController.h
//  marmaraforum
//
//  Created by Kazim Etiksan on 10/20/11.
//  Copyright 2011 Etiksan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{    
    NSMutableData *_receivedData;
    NSURLConnection *_conn;
    
    NSDictionary *_shops;
    NSArray *_shopTypes;
    
    int selectedShopIndex;
    
    UITableView *_tView;
    
    NSMutableArray *_buttonArray;
}

@property (nonatomic, retain) IBOutlet NSMutableArray *buttonArray;
@property (nonatomic, retain) IBOutlet UITableView *tView;

@property (nonatomic, retain) NSDictionary *shops;
@property (nonatomic, retain) NSArray *shopTypes;

@property (nonatomic, assign) NSMutableData *receivedData;
@property (nonatomic, assign) NSURLConnection *conn;

- (IBAction)navigateBack:(id)sender;

@end
