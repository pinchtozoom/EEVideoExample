//
//  SplashVideoViewController.m
//  EEVideoExample
//
//  Created by David Hopkinson on 07/08/2013.
//  Copyright (c) 2013 PInch To Zoom Limited. All rights reserved.
//

#import "SplashVideoViewController.h"
#import "AboutPinchViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SplashVideoViewController ()

@end

@implementation SplashVideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    

}

- (void)viewDidAppear:(BOOL)animated {
    
    // ************************************************************
    // This is the magic bit that stops the audio being stopped.
    // You could set this up in the app delegate.
    // Requires AVFoundation
    // ************************************************************
    NSError *setCategoryError = nil;
    BOOL success = [[AVAudioSession sharedInstance]
                    setCategory: AVAudioSessionCategoryAmbient
                    error: &setCategoryError];
    
    if (!success) { /* handle the error in setCategoryError */ }
    // ************************************************************
    
    NSString*thePath=[[NSBundle mainBundle] pathForResource:@"PinchToZoom" ofType:@"m4v"];
    NSLog(@"%@", thePath);
    NSURL*theurl=[NSURL fileURLWithPath:thePath];
    
    _moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:theurl];
    [_moviePlayer.view setFrame:self.view.frame];
    [_moviePlayer prepareToPlay];
    [_moviePlayer setShouldAutoplay:YES];
    [_moviePlayer setFullscreen:YES];
    [_moviePlayer setControlStyle:MPMovieControlStyleNone];
// This was the pre-ios 6 hack to make things work - Deprecated and ignored since then.
    //    _moviePlayer.useApplicationAudioSession = NO;
    [self.view addSubview:_moviePlayer.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playBackFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:_moviePlayer];

}

-(void)playBackFinished:(id)sender {
    NSLog(@"Playback finished");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"AboutPinch" bundle:nil];
    
    AboutPinchViewController *about = (AboutPinchViewController*)[storyboard instantiateInitialViewController];
    [self presentViewController:about animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
