//
//  ViewController.h
//  OTA
//  This ViewController houses the mod clock within itself. It creates a parser given the day type and then displays the mod clock accordingly.
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    IBOutlet UIImageView *AnimatedPicture;
}

@property NSString *dispString;
@property (weak, nonatomic) IBOutlet UILabel *mcLabel;
-(void)setmcDisplay:(NSString *)mcDisp;
- (IBAction)refreshDisplay:(id)sender;

@end

