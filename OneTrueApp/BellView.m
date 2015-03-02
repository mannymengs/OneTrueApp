//
//  BellView.m
//  onetrueapp
//
//  Created by Seb Lim on 11/3/14.
//  Copyright (c) 2014 Seb Lim. All rights reserved.
//

#import "BellView.h"

@interface BellView ()

@end

@implementation BellView

- (void)viewDidLoad {
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
- (IBAction)Back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 *This method keeps the view controller in only potrait mode and not able to rotate.
 */
- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
