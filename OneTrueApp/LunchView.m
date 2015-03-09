//
//  LunchView.m
//  onetrueapp
//
//  Created by Seb Lim on 11/3/14.
//  Copyright (c) 2014 Seb Lim. All rights reserved.
//

#import "LunchView.h"

@interface LunchView ()

@end

@implementation LunchView
@synthesize webview;

/**
 *Added a webview and told it what to display.
 */
- (void)viewDidLoad {
    
    NSString *website = @"http://www.sagedining.com/menus/roxburylatin";
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
