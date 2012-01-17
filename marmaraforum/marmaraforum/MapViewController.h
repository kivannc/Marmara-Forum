#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>

#define degreesToRadians(x) (M_PI * x / 180.0)

@interface MapViewController : UIViewController {
    
    CGPoint startPoint;
    
    UIImageView* _map;
    UIImageView* _cemcuk;
    UIView* _mapView;
    
    int mapTag;
    
    AVAudioPlayer *_player;
}

@property (nonatomic, retain) AVAudioPlayer* player;

@property (nonatomic) int mapTag;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic, retain) IBOutlet UIImageView* map;
@property (nonatomic, retain) IBOutlet UIImageView* cemcuk;
@property (nonatomic, retain) IBOutlet UIView* mapView;

- (void)goCemcuk;
- (IBAction)navigateToTop:(id)sender;

@end
