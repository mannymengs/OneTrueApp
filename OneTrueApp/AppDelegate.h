//
//  AppDelegate.h
//  OneTrueApp
//
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import <Foundation/Foundation.h>	
#import <UIKit/UIKit.h>
#import "ModClock.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) NSMutableArray *modclocks;//mutable array to hold mod clock objects
@property NSString *type;//day type
@property NSMutableArray *names, *times, *flags, *hours, *minutes;//mutable arrays to be filled with parsed info - names are fairly self-explanatory
@property NSNumber *dTime;//time left to be displayed
@property NSString *dFlag, *dName;//flag and name to be displayed
@property NSString *ics;//.ics code
@property BOOL drop;

-(NSString *) loadDayType:(NSString *) icsstring;
-(BOOL) loadMC;
-(void) calculateMC;
-(void) displayMC;
-(NSString *)loadICSAndReturnPathFromURL:(NSURL *)url;
-(void) updateMC;

@end

