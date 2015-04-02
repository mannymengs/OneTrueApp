//
//  ViewController.m
//  onetrueapp
//
//  Created by Seb Lim on 11/2/14.
//  Copyright (c) 2014 Seb Lim. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mcLabel, dispString;


- (void)viewDidLoad {
   /**
    AnimatedPicture.animationImages = [NSArray arrayWithObjects:
                                       [UIImage imageNamed:@"OTA0000.jpg"],
                                       [UIImage imageNamed:@"OTA0001.jpg"],
                                       [UIImage imageNamed:@"OTA0002.jpg"],
                                       [UIImage imageNamed:@"OTA0003.jpg"],
                                       [UIImage imageNamed:@"OTA0004.jpg"],
                                       [UIImage imageNamed:@"OTA0005.jpg"],
                                       [UIImage imageNamed:@"OTA0006.jpg"],
                                       [UIImage imageNamed:@"OTA0007.jpg"],
                                       [UIImage imageNamed:@"OTA0008.jpg"],
                                       [UIImage imageNamed:@"OTA0009.jpg"],
                                       [UIImage imageNamed:@"OTA0010.jpg"],
                                       [UIImage imageNamed:@"OTA0011.jpg"],
                                       [UIImage imageNamed:@"OTA0012.jpg"],
                                       [UIImage imageNamed:@"OTA0013.jpg"],
                                       [UIImage imageNamed:@"OTA0014.jpg"],
                                       [UIImage imageNamed:@"OTA0015.jpg"],
                                       [UIImage imageNamed:@"OTA0016.jpg"],
                                       [UIImage imageNamed:@"OTA0017.jpg"],
                                       [UIImage imageNamed:@"OTA0018.jpg"],
                                       [UIImage imageNamed:@"OTA0019.jpg"],
                                       [UIImage imageNamed:@"OTA0020.jpg"],
                                       [UIImage imageNamed:@"OTA0021.jpg"],
                                       [UIImage imageNamed:@"OTA0022.jpg"],
                                       [UIImage imageNamed:@"OTA0023.jpg"],
                                       [UIImage imageNamed:@"OTA0024.jpg"],
                                       [UIImage imageNamed:@"OTA0025.jpg"],
                                       [UIImage imageNamed:@"OTA0026.jpg"],
                                       [UIImage imageNamed:@"OTA0027.jpg"],
                                       [UIImage imageNamed:@"OTA0028.jpg"],
                                       [UIImage imageNamed:@"OTA0029.jpg"],
                                       [UIImage imageNamed:@"OTA0030.jpg"],
                                       [UIImage imageNamed:@"OTA0031.jpg"],
                                       [UIImage imageNamed:@"OTA0032.jpg"],
                                       [UIImage imageNamed:@"OTA0033.jpg"],
                                       [UIImage imageNamed:@"OTA0034.jpg"],
                                       [UIImage imageNamed:@"OTA0035.jpg"],
                                       [UIImage imageNamed:@"OTA0036.jpg"],
                                       [UIImage imageNamed:@"OTA0037.jpg"],
                                       [UIImage imageNamed:@"OTA0038.jpg"],
                                       [UIImage imageNamed:@"OTA0039.jpg"],
                                       [UIImage imageNamed:@"OTA0040.jpg"],
                                       [UIImage imageNamed:@"OTA0041.jpg"],
                                       [UIImage imageNamed:@"OTA0042.jpg"],
                                       [UIImage imageNamed:@"OTA0043.jpg"],
                                       [UIImage imageNamed:@"OTA0044.jpg"],
                                       [UIImage imageNamed:@"OTA0045.jpg"],
                                       [UIImage imageNamed:@"OTA0046.jpg"],
                                       [UIImage imageNamed:@"OTA0047.jpg"],
                                       [UIImage imageNamed:@"OTA0048.jpg"],
                                       [UIImage imageNamed:@"OTA0049.jpg"],
                                       [UIImage imageNamed:@"OTA0050.jpg"],
                                       [UIImage imageNamed:@"OTA0051.jpg"],
                                       [UIImage imageNamed:@"OTA0052.jpg"],
                                       [UIImage imageNamed:@"OTA0053.jpg"],
                                       [UIImage imageNamed:@"OTA0054.jpg"],
                                       [UIImage imageNamed:@"OTA0055.jpg"],
                                       [UIImage imageNamed:@"OTA0056.jpg"],
                                       [UIImage imageNamed:@"OTA0057.jpg"],
                                       [UIImage imageNamed:@"OTA0058.jpg"],
                                       [UIImage imageNamed:@"OTA0059.jpg"],
                                       [UIImage imageNamed:@"OTA0060.jpg"],
                                       [UIImage imageNamed:@"OTA0061.jpg"],
                                       [UIImage imageNamed:@"OTA0062.jpg"],
                                       [UIImage imageNamed:@"OTA0063.jpg"],
                                       [UIImage imageNamed:@"OTA0064.jpg"],
                                       [UIImage imageNamed:@"OTA0065.jpg"],
                                       [UIImage imageNamed:@"OTA0066.jpg"],
                                       [UIImage imageNamed:@"OTA0067.jpg"],
                                       [UIImage imageNamed:@"OTA0068.jpg"],
                                       [UIImage imageNamed:@"OTA0069.jpg"],
                                       [UIImage imageNamed:@"OTA0070.jpg"],
                                       [UIImage imageNamed:@"OTA0071.jpg"],
                                       [UIImage imageNamed:@"OTA0072.jpg"],
                                       [UIImage imageNamed:@"OTA0073.jpg"],
                                       [UIImage imageNamed:@"OTA0074.jpg"],
                                       [UIImage imageNamed:@"OTA0075.jpg"],
                                       [UIImage imageNamed:@"OTA0076.jpg"],
                                       [UIImage imageNamed:@"OTA0077.jpg"],
                                       [UIImage imageNamed:@"OTA0078.jpg"],
                                       [UIImage imageNamed:@"OTA0079.jpg"],
                                       [UIImage imageNamed:@"OTA0080.jpg"],
                                       [UIImage imageNamed:@"OTA0081.jpg"],
                                       [UIImage imageNamed:@"OTA0082.jpg"],
                                       [UIImage imageNamed:@"OTA0083.jpg"],
                                       [UIImage imageNamed:@"OTA0084.jpg"],
                                       [UIImage imageNamed:@"OTA0085.jpg"],
                                       [UIImage imageNamed:@"OTA0086.jpg"],
                                       [UIImage imageNamed:@"OTA0087.jpg"],
                                       [UIImage imageNamed:@"OTA0088.jpg"],
                                       [UIImage imageNamed:@"OTA0089.jpg"],
                                       [UIImage imageNamed:@"OTA0090.jpg"],
                                       [UIImage imageNamed:@"OTA0091.jpg"],
                                       [UIImage imageNamed:@"OTA0092.jpg"],
                                       [UIImage imageNamed:@"OTA0093.jpg"],
                                       [UIImage imageNamed:@"OTA0094.jpg"],
                                       [UIImage imageNamed:@"OTA0095.jpg"],
                                       [UIImage imageNamed:@"OTA0096.jpg"],
                                       [UIImage imageNamed:@"OTA0097.jpg"],
                                       [UIImage imageNamed:@"OTA0098.jpg"],
                                       [UIImage imageNamed:@"OTA0099.jpg"],
                                       [UIImage imageNamed:@"OTA0100.jpg"],
                                       [UIImage imageNamed:@"OTA0101.jpg"],
                                       [UIImage imageNamed:@"OTA0102.jpg"],
                                       [UIImage imageNamed:@"OTA0103.jpg"],
                                       [UIImage imageNamed:@"OTA0104.jpg"],
                                       [UIImage imageNamed:@"OTA0105.jpg"],
                                       [UIImage imageNamed:@"OTA0106.jpg"],
                                       [UIImage imageNamed:@"OTA0107.jpg"],
                                       [UIImage imageNamed:@"OTA0108.jpg"],
                                       [UIImage imageNamed:@"OTA0109.jpg"],
                                       [UIImage imageNamed:@"OTA0110.jpg"],
                                       [UIImage imageNamed:@"OTA0111.jpg"],
                                       [UIImage imageNamed:@"OTA0112.jpg"],
                                       [UIImage imageNamed:@"OTA0113.jpg"],
                                       [UIImage imageNamed:@"OTA0114.jpg"],
                                       [UIImage imageNamed:@"OTA0115.jpg"],
                                       [UIImage imageNamed:@"OTA0116.jpg"],
                                       [UIImage imageNamed:@"OTA0117.jpg"],
                                       [UIImage imageNamed:@"OTA0118.jpg"],
                                       [UIImage imageNamed:@"OTA0119.jpg"], nil];
    
    
    [AnimatedPicture setAnimationRepeatCount:0];
    AnimatedPicture.animationDuration = 4;
    [AnimatedPicture startAnimating];
    */
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 *This method keeps the view controller in only potrait mode and not able to rotate.
 */
- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

-(void) viewDidAppear:(BOOL)animated{
    mcLabel.text = dispString;
    [mcLabel setText:dispString];
    [mcLabel setNeedsDisplay];
}

/**
 This method sets the label text to a given string. Used to set the mod clock display text
 */
-(void)setmcDisplay:(NSString *)mcDisp
{
    dispString = mcDisp;
    mcLabel.text = dispString;
    [mcLabel setText:dispString];
    [mcLabel setNeedsDisplay];
}

/**
 This method refreshes the display of the mod clock when a button is pressed

- (IBAction)refreshDisplay:(id)sender {
    AppDelegate *ad = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [ad updateMC];
}
*/
@end
