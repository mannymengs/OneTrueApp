//
//  ThreeSocView.m
//  OneTrueApp
//
//  Created by Seb Lim on 11/24/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import "ThreeSocView.h"

@interface ThreeSocView ()

@end

@implementation ThreeSocView
@synthesize webview;

/**
 *Added a webview and told it what to display.
 */
- (void)viewDidLoad {
    NSString *website = @"http://www.roxburylatin.org/school_life/athteampages.aspx?TeamID=692";
    NSURL *url = [NSURL URLWithString:website];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestURL];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 *This button dismisses the view controller that is popped up and goes to the previous view controller.
 */
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 *This method keeps the view controller in only potrait mode and not able to rotate.
 */
- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
