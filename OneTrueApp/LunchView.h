//
//  LunchView.h
//  onetrueapp
//
//  Created by Seb Lim on 11/3/14.
//  Copyright (c) 2014 Seb Lim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LunchView : UIViewController

- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end
