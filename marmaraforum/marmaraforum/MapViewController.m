//
//  marmaraforumViewController.m
//  marmaraforum
//
//  Created by Kazim Etiksan on 7/14/11.
//  Copyright 2011 Etiksan. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize startPoint, mapTag,
            mapView=_mapView,
            map=_map,
            cemcuk=_cemcuk,
            player=_player;

- (IBAction)navigateToTop:(id)sender {
    
    [self.player stop];
    [self.navigationController popToRootViewControllerAnimated:TRUE];
}

- (void)dealloc
{
    [_mapView release];
    [_map release];
    [_cemcuk release];
    [_player release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)animationDidStart:(CAAnimation *)anim {
    
    NSLog(@"animation did start");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {

    if (
        self.mapTag == 0 ||
        self.mapTag == 1 ||
        self.mapTag == 2 ||
        self.mapTag == 3 ||
        self.mapTag == 4 ||
        self.mapTag == 5
        ) 
    {
        self.cemcuk.layer.position = CGPointMake(397, 685);
    }
    
    else if (
        self.mapTag == 6 ||
        self.mapTag == 7 ||
        self.mapTag == 8)
    {
        self.cemcuk.layer.position = CGPointMake(478, 529);
        [self.cemcuk stopAnimating];
    }
    
    else if (
        self.mapTag == 9
        )
    {
        self.cemcuk.layer.position = CGPointMake(512, 430);
    }

    else if (
             self.mapTag == 10
             )
    {
        self.cemcuk.layer.position = CGPointMake(512, 430);
    }

    NSLog(@"animation did stop");
}

- (void)animateMainView {
    
    if (self.mapTag == 0) {
        
        [UIView animateWithDuration:7.0
                              delay:1.0 
                            options:UIViewAnimationOptionCurveEaseInOut 
                         animations:^(void) {
                             
                             self.mapView.frame = CGRectMake(-228,
                                                             -36,
                                                             self.mapView.frame.size.width,
                                                             self.mapView.frame.size.height);
                         } 
                         completion:^(BOOL finished) {
                             
                             [UIView animateWithDuration:7.0
                                                   delay:1.0 
                                                 options:UIViewAnimationOptionCurveEaseInOut 
                                              animations:^(void) {
                                                  
                                                  self.mapView.frame = CGRectMake(-362,
                                                                                  -354,
                                                                                  self.mapView.frame.size.width,
                                                                                  self.mapView.frame.size.height);
                                              } 
                                              completion:^(BOOL finished) {
                                                  
                                                  [UIView animateWithDuration:8.0
                                                                        delay:0.0 
                                                                      options:UIViewAnimationOptionCurveEaseInOut 
                                                                   animations:^(void) {
                                                                       
                                                                       self.mapView.frame = CGRectMake(-191,
                                                                                                       -565,
                                                                                                       self.mapView.frame.size.width,
                                                                                                       self.mapView.frame.size.height);
                                                                   } 
                                                                   completion:^(BOOL finished) {
                                                                       
                                                                       // done
                                                                   }];
                                              }];
                         }];
    
    } else if (self.mapTag == 1) {
        
        [UIView animateWithDuration:11.0
                              delay:0.0 
                            options:UIViewAnimationOptionCurveEaseInOut 
                         animations:^(void) {
                             
                             self.mapView.frame = CGRectMake(-191,
                                                             -565,
                                                             self.mapView.frame.size.width,
                                                             self.mapView.frame.size.height);
                         } 
                         completion:^(BOOL finished) {
                             
                             // done
                         }];
        
    } else if (self.mapTag == 2) {
        
        [UIView animateWithDuration:16.0
                              delay:0.0 
                            options:UIViewAnimationOptionCurveEaseInOut 
                         animations:^(void) {
                             
                             self.mapView.frame = CGRectMake(-191,
                                                             -565,
                                                             self.mapView.frame.size.width,
                                                             self.mapView.frame.size.height);
                         } 
                         completion:^(BOOL finished) {
                             
                             // done
                         }];
        
    } else if (self.mapTag == 3) {
        
        [UIView animateWithDuration:16.0
                              delay:0.0 
                            options:UIViewAnimationOptionCurveEaseInOut 
                         animations:^(void) {
                             
                             self.mapView.frame = CGRectMake(-191,
                                                             -565,
                                                             self.mapView.frame.size.width,
                                                             self.mapView.frame.size.height);
                         } 
                         completion:^(BOOL finished) {
                             
                             // done
                         }];
        
    } else if (self.mapTag == 4) {
        
        [UIView animateWithDuration:14.0
                              delay:0.0 
                            options:UIViewAnimationOptionCurveEaseInOut 
                         animations:^(void) {
                             
                             self.mapView.frame = CGRectMake(-191,
                                                             -565,
                                                             self.mapView.frame.size.width,
                                                             self.mapView.frame.size.height);
                         } 
                         completion:^(BOOL finished) {
                             
                             // done
                         }];
        
    } else if (self.mapTag == 5) {
        
        [UIView animateWithDuration:15.0
                              delay:4.0 
                            options:UIViewAnimationOptionCurveEaseInOut 
                         animations:^(void) {
                             
                             self.mapView.frame = CGRectMake(-191,
                                                             -565,
                                                             self.mapView.frame.size.width,
                                                             self.mapView.frame.size.height);
                         } 
                         completion:^(BOOL finished) {
                             
                             // done
                         }];
        
    } else if (self.mapTag == 8) {
        
        [UIView animateWithDuration:18.0
                         animations:^(void) {
                             
                             self.mapView.frame = CGRectMake(-278,
                                                             -373,
                                                             self.mapView.frame.size.width,
                                                             self.mapView.frame.size.height);
                         } 
                         completion:^(BOOL finished) {
                             
                             // done
                         }];
        
    } else if (self.mapTag == 6 || self.mapTag == 9 || self.mapTag == 10) {
        
        [UIView animateWithDuration:12.0
                         animations:^(void) {
                             
                             self.mapView.frame = CGRectMake(-278,
                                                             -373,
                                                             self.mapView.frame.size.width,
                                                             self.mapView.frame.size.height);
                         } 
                         completion:^(BOOL finished) {
                             
                             // done
                         }];
        
    }
}

- (void)goCemcuk {
    
    if (self.mapTag == 0) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 923, 7);
        CGPathAddLineToPoint(path, NULL, 853, 18);
        CGPathAddLineToPoint(path, NULL, 774, 24);
        CGPathAddLineToPoint(path, NULL, 723, 33);
        CGPathAddLineToPoint(path, NULL, 666, 78);
        CGPathAddLineToPoint(path, NULL, 574, 62);
        CGPathAddLineToPoint(path, NULL, 496, 87);
        CGPathAddLineToPoint(path, NULL, 399, 99);
        CGPathAddLineToPoint(path, NULL, 334, 177);
        CGPathAddLineToPoint(path, NULL, 394, 292);
        CGPathAddLineToPoint(path, NULL, 395, 385);
        CGPathAddLineToPoint(path, NULL, 478, 409);
        CGPathAddLineToPoint(path, NULL, 546, 428);
        CGPathAddLineToPoint(path, NULL, 586, 489);
        CGPathAddLineToPoint(path, NULL, 564, 534);
        CGPathAddLineToPoint(path, NULL, 397, 685);
        
        anim.path = path;
        [anim setDuration:22.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.rotationMode = kCAAnimationRotateAuto;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 1) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 950, 233);
        CGPathAddLineToPoint(path, NULL, 829, 233);
        CGPathAddLineToPoint(path, NULL, 763, 308);
        CGPathAddLineToPoint(path, NULL, 695, 348);
        CGPathAddLineToPoint(path, NULL, 651, 422);
        CGPathAddLineToPoint(path, NULL, 589, 476);
        CGPathAddLineToPoint(path, NULL, 567, 534);
        CGPathAddLineToPoint(path, NULL, 424, 660);
        CGPathAddLineToPoint(path, NULL, 397, 685);

        anim.path = path;
        [anim setDuration:11.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.rotationMode = kCAAnimationRotateAuto;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 2) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 881, 567);
        CGPathAddLineToPoint(path, NULL, 885, 608);
        CGPathAddLineToPoint(path, NULL, 852, 645);
        CGPathAddLineToPoint(path, NULL, 780, 647);
        CGPathAddLineToPoint(path, NULL, 721, 641);
        CGPathAddLineToPoint(path, NULL, 647, 664);
        CGPathAddLineToPoint(path, NULL, 620, 703);
        CGPathAddLineToPoint(path, NULL, 580, 742);
        CGPathAddLineToPoint(path, NULL, 530, 757);
        CGPathAddLineToPoint(path, NULL, 517, 788);
        CGPathAddLineToPoint(path, NULL, 478, 809);
        CGPathAddLineToPoint(path, NULL, 433, 787);
        CGPathAddLineToPoint(path, NULL, 405, 778);
        CGPathAddLineToPoint(path, NULL, 399, 750);
        CGPathAddLineToPoint(path, NULL, 409, 715);
        CGPathAddLineToPoint(path, NULL, 397, 685);
        
        [anim setDuration:16.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.path = path;
        anim.rotationMode = kCAAnimationRotateAuto;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 3) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 107, 789);
        CGPathAddLineToPoint(path, NULL, 173, 832);
        CGPathAddLineToPoint(path, NULL, 159, 919);
        CGPathAddLineToPoint(path, NULL, 186, 884);
        CGPathAddLineToPoint(path, NULL, 211, 867);
        CGPathAddLineToPoint(path, NULL, 252, 834);
        CGPathAddLineToPoint(path, NULL, 363, 845);
        CGPathAddLineToPoint(path, NULL, 439, 790);
        CGPathAddLineToPoint(path, NULL, 405, 778);
        CGPathAddLineToPoint(path, NULL, 399, 750);
        CGPathAddLineToPoint(path, NULL, 409, 715);
        CGPathAddLineToPoint(path, NULL, 397, 685);

        [anim setDuration:16.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.path = path;
        anim.rotationMode = kCAAnimationRotateAuto;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 4) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 690);
        CGPathAddLineToPoint(path, NULL, 39, 685);
        CGPathAddLineToPoint(path, NULL, 88, 726);
        CGPathAddLineToPoint(path, NULL, 244, 733);
        CGPathAddLineToPoint(path, NULL, 397, 685);
        
        anim.path = path;
        [anim setDuration:14.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.rotationMode = kCAAnimationRotateAuto;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 5) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 457, 400);
        CGPathAddLineToPoint(path, NULL, 547, 428);
        CGPathAddLineToPoint(path, NULL, 585, 494);
        CGPathAddLineToPoint(path, NULL, 547, 551);
        CGPathAddLineToPoint(path, NULL, 417, 662);
        CGPathAddLineToPoint(path, NULL, 397, 685);
        
        [anim setDuration:15.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.path = path;
        anim.rotationMode = kCAAnimationRotateAuto;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 6) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 559, 691);
        CGPathAddLineToPoint(path, NULL, 550, 655);
        CGPathAddLineToPoint(path, NULL, 540, 628);
        CGPathAddLineToPoint(path, NULL, 553, 589);
        CGPathAddLineToPoint(path, NULL, 558, 553);
        CGPathAddLineToPoint(path, NULL, 514, 540);
        CGPathAddLineToPoint(path, NULL, 478, 529);

        [anim setDuration:12.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.path = path;
        anim.rotationMode = kCAAnimationRotateAuto;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 7) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 561, 387);
        CGPathAddLineToPoint(path, NULL, 517, 434);
        CGPathAddLineToPoint(path, NULL, 488, 461);
        CGPathAddLineToPoint(path, NULL, 472, 476);
        CGPathAddLineToPoint(path, NULL, 478, 529);
        
        [anim setDuration:18.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.path = path;
        anim.rotationMode = kCAAnimationRotateAuto;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 8) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 263, 525);
        CGPathAddLineToPoint(path, NULL, 294, 537);
        CGPathAddLineToPoint(path, NULL, 363, 511);
        CGPathAddLineToPoint(path, NULL, 424, 489);
        CGPathAddLineToPoint(path, NULL, 478, 529);
        
        [anim setDuration:18.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.path = path;
        anim.rotationMode = kCAAnimationRotateAuto;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 9) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 830, 112);
        CGPathAddLineToPoint(path, NULL, 804, 159);
        CGPathAddLineToPoint(path, NULL, 776, 193);
        CGPathAddLineToPoint(path, NULL, 512, 430);
        //CGPathAddLineToPoint(path, NULL, 458, 475);
        
        [anim setDuration:12.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.path = path;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    } else if (self.mapTag == 10) {
        
        CALayer *layer = self.cemcuk.layer;
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 835, 203);
        CGPathAddLineToPoint(path, NULL, 785, 215);
        CGPathAddLineToPoint(path, NULL, 743, 241);
        CGPathAddLineToPoint(path, NULL, 718, 251);
        CGPathAddLineToPoint(path, NULL, 702, 325);
        CGPathAddLineToPoint(path, NULL, 707, 344);
        CGPathAddLineToPoint(path, NULL, 699, 372);
        CGPathAddLineToPoint(path, NULL, 708, 402);
        CGPathAddLineToPoint(path, NULL, 597, 430);
        CGPathAddLineToPoint(path, NULL, 553, 441);
        CGPathAddLineToPoint(path, NULL, 512, 430);
        //CGPathAddLineToPoint(path, NULL, 478, 453);
        //CGPathAddLineToPoint(path, NULL, 445, 470);
        
        [anim setDuration:12.0];
        [anim setCalculationMode:kCAAnimationPaced];
        anim.path = path;
        anim.delegate = self;
        [layer addAnimation:anim forKey:@"position"];
        
        [self animateMainView];
        
    }
}

#pragma mark - View lifecycle

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];

    if (self.mapTag == 2) {
        [self.player performSelector:@selector(play) withObject:nil afterDelay:1.0];
    } else if (self.mapTag == 3) {
        [self.player performSelector:@selector(play) withObject:nil afterDelay:1.0];
    } else if (self.mapTag == 4) {
        [self.player performSelector:@selector(play) withObject:nil afterDelay:3.0];
    } else if (self.mapTag == 9) {
        [self.player performSelector:@selector(play) withObject:nil afterDelay:7.0];
    } else {
        [self.player play];
    }
    
    
    [self goCemcuk];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.map.frame = CGRectMake(-15, -10, 1000, 1000);
    
    if (self.mapTag == 0) {

        self.mapView.frame = CGRectMake(-490, 0, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(923, 7);
        
    } else if (self.mapTag == 1) {
        
        self.mapView.frame = CGRectMake(-505, -175, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(950, 233);
        
    } else if (self.mapTag == 2) {
        
        self.mapView.frame = CGRectMake(-485, -454, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(881, 567);
        
    } else if (self.mapTag == 3) {
        
        self.mapView.frame = CGRectMake(0, -680, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(107, 789);
        
    } else if (self.mapTag == 4) {
        
        self.mapView.frame = CGRectMake(0, -628, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(0, 690);
        
    } else if (self.mapTag == 5) {
        
        self.mapView.frame = CGRectMake(-210, -381, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(457, 400);
        
    } else if (self.mapTag == 6) {
        
        self.mapView.frame = CGRectMake(-318, -444, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(559, 691);
        
    } else if (self.mapTag == 7) {
        
        self.mapView.frame = CGRectMake(-260, -307, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(561, 387);
        
    } else if (self.mapTag == 8) {
        
        self.mapView.frame = CGRectMake(-142, -350, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(263, 525);
        
    } else if (self.mapTag == 9) {
        
        self.mapView.frame = CGRectMake(-500, 0, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(830, 112);
        
    } else if (self.mapTag == 10) {
        
        self.mapView.frame = CGRectMake(-500, -112, 1000, 1000);
        self.cemcuk.layer.position = CGPointMake(835, 203);
        
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.mapTag == 6 ||
        self.mapTag == 7 ||
        self.mapTag == 8) {
        
        self.map.image = [UIImage imageNamed:@"harita2.jpg"];
        
        self.cemcuk.animationImages = [NSArray arrayWithObjects:
                                       [UIImage imageNamed:@"foot0.png"],
                                       [UIImage imageNamed:@"foot1.png"],
                                       [UIImage imageNamed:@"foot2.png"],
                                       nil];
        self.cemcuk.image = [self.cemcuk.animationImages objectAtIndex:0];
        
        self.cemcuk.animationDuration = 0.7;
        [self.cemcuk startAnimating];
        
        self.cemcuk.frame = CGRectMake(self.cemcuk.frame.origin.x,
                                       self.cemcuk.frame.origin.y, 
                                       36, 33);
        
    } else if (self.mapTag == 9 || self.mapTag == 10) {
        
        self.map.image = [UIImage imageNamed:@"harita2.jpg"];
        self.cemcuk.image = [UIImage imageNamed:@"bus.png"];
        self.cemcuk.frame = CGRectMake(self.cemcuk.frame.origin.x,
                                       self.cemcuk.frame.origin.y, 
                                       31, 32);
    }
    
    NSString *wavFile = [NSString stringWithFormat:@"map%d",self.mapTag];
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:wavFile ofType:@"mp3"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    [fileURL release];
}

- (void)viewDidUnload
{
    self.map = nil;
    self.mapView = nil;
    self.cemcuk = nil;
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
