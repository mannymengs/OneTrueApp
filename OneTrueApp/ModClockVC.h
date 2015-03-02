//
//  ModClockVC.h
//  OTA
//  This ViewController houses the mod clock within itself. It creates a parser given the day type and then displays the mod clock accordingly.
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModClock.h"
#import "ModClockParser.h"

@interface ModClockVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *mcDispLabel;

@end
