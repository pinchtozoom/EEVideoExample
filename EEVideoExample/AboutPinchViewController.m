//
//  AboutPinchViewController.m
//  EEVideoExample
//
//  Created by David Hopkinson on 07/08/2013.
//  Copyright (c) 2013 PInch To Zoom Limited. All rights reserved.
//

#import "AboutPinchViewController.h"

@interface AboutPinchViewController ()

@end

@implementation AboutPinchViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeAbout:(id)sender {
    [self dismissViewControllerAnimated:YES completion:Nil];
}
@end
