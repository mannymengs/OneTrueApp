//
//  VarsityView.m
//  OneTrueApp
//
//  Created by Seb Lim on 11/16/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import "VarsityView.h"

@interface VarsityView ()

@end

@implementation VarsityView

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
