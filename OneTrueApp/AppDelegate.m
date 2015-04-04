//
//  AppDelegate.m
//  OneTrueApp
//
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "Parse.h"
#import "ViewController.h"
#import "ModClockParser.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
#pragma mark - UIApplicationDelegate
@synthesize modclocks;
@synthesize type, names, times, flags, hours, minutes, dTime, dFlag, dName, ics, drop;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    //SEL calc = NSSelectorFromString(@"calculateMC");
    //SEL disp = NSSelectorFromString(@"displayMC");
    SEL up = NSSelectorFromString(@"updateMC");
    
    //NSLog (and other variables) is used to track through step by step and check/resolve errors, so any unnecessary use of it should be commented out
    //NSLog(@"Launched");
    
    //Gets the current day of the week
    NSDate *today = [NSDate date];
    NSDateFormatter *tf = [[NSDateFormatter alloc] init];
    [tf setDateFormat:@"EEE"];
    NSString *dow = [tf stringFromDate:today];
    
    //Checks if weekend, and if so, simply displays string saying "Weekend"
    if([dow isEqualToString:@"Sat"] || [dow isEqualToString:@"Sun"])
    {
        //NSLog(@"Weekend");
        ViewController *mcVC = (ViewController *) self.window.rootViewController;//Gets viewcontroller with mod clock label, which should be root view controller of app
        [mcVC setmcDisplay:@"Weekend"];
        return YES;
    }
    
    NSURL *dURL = [NSURL URLWithString:@"http://www.roxburylatin.org/data/ical/Day_Type.ics"];
    NSString *lics = [self loadICSAndReturnPathFromURL:dURL];
    if(lics == nil || lics == (NSString *) [NSNull null])
    {
        NSLog(@"There is no calendar information.");
        ViewController *mcVC = (ViewController *) self.window.rootViewController;//Gets viewcontroller with mod clock label, which should be root view controller of app
        [mcVC setmcDisplay:@"Check connection"];
        return YES;
    }
    type = [self loadDayType:lics];
    //NSLog(@"%@", type);
    
    BOOL loaded = [self loadMC];
    
    //Checks if parsing worked;
    if(loaded)
    {
        //Allocates memory and initializes mutable array objects which will store times, flags, and names from the mod clock objects
        times = [[NSMutableArray alloc] init];
        flags = [[NSMutableArray alloc] init];
        names = [[NSMutableArray alloc] init];
        
        //Fills mutable arrays with the parsed times, flags, and names
        //int ci = 0;
        //NSLog(@"AYEEEEEEE");
        for(ModClock *m in modclocks)
        {
            //NSLog(@"1: %@, %@, %@", m.time, m.flag, m.name);
            //NSLog(@"AND");
            [times addObject:m.time];
            [flags addObject:m.flag];
            [names addObject:m.name];
            //NSLog(@"2: %@,%@,%@",[times objectAtIndex:ci], [flags objectAtIndex:ci], [names objectAtIndex:ci]);
            //ci++;
        }
    }
    else
    {
        //NSLog(@"Boo...");
        ViewController *mcVC = (ViewController *) self.window.rootViewController;//Gets viewcontroller with mod clock label, which should be root view controller of app
        [mcVC setmcDisplay:@"Special Day"];
        return YES;
    }
    
    //Allocates memorey and initializes mutable array objects to hold the hour and minute values acquired from the times
    hours = [[NSMutableArray alloc] init];
    minutes = [[NSMutableArray alloc] init];
    
    //Fills mutable arrays with the hours and minutes as int values
    int j = 0;
    for(NSString *t in times)
    {
        //times are strings in the form "HH:mm"
        //Taking substrings and parsing into ints
        int h = [[t substringToIndex:2] intValue];//int hour
        int m = [[t substringFromIndex:3] intValue];//int minute
        //NSLog(@"%u, %u", h, m);
        
        //Adds the hours and minutes
        [hours addObject:[NSNumber numberWithInt: h]];
        [minutes addObject:[NSNumber numberWithInt:m]];
        //NSLog(@"%u, %u", [[hours objectAtIndex:j] intValue], [[minutes objectAtIndex:j] intValue]);
        j++;
    }
    
    [self calculateMC];//Initial calculation
    [self displayMC];//Initial display
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:up userInfo:nil repeats:YES];//Updates the mod clock every second
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 /**
    [Parse setApplicationId:@"H1NfX2OZhx0IOFHirAVKbKHn2rBTdI8MJlVC5n8O" clientKey:@"vxy5DT2dcXj2akHhA4PgdMfPKWczwJGVfhxi7XpG"];
    
    [PFUser enableAutomaticUser];
    
    PFACL *defaultACL = [PFACL ACL];
    
    // If you would like all objects to be private by default, remove this line.
    [defaultACL setPublicReadAccess:YES];
    
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
    
    if (application.applicationState != UIApplicationStateBackground) {
        // Track an app open here if we launch with a push, unless
        // "content_available" was used to trigger a background push (introduced in iOS 7).
        // In that case, we skip tracking here to avoid double counting the app-open.
        BOOL preBackgroundPush = ![application respondsToSelector:@selector(backgroundRefreshStatus)];
        BOOL oldPushHandlerOnly = ![self respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)];
        BOOL noPushPayload = ![launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
            [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
        }
    }
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                        UIUserNotificationTypeBadge |
                                                        UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                                 categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    } else
#endif
    {
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                         UIRemoteNotificationTypeAlert |
                                                         UIRemoteNotificationTypeSound)];
    }
*/
    return YES;
}

/**
 Loads the ics file information from the RL website
 Parameters:
 url the url from which to download the .ics file
 Returns:
 ics the string containing the .ics code
 */
-(NSString *)loadICSAndReturnPathFromURL:(NSURL *)url
{
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    if (error == nil)
    {
        ics = [NSString stringWithUTF8String:[data bytes]];
        //NSLog(@"%@", ics);
        return ics;
    }
    NSLog(@"Error: %@",[error localizedDescription]);
    
    return nil;
}

/**
 Loads the day type through given string containing contents of .ics file
 Parameters:
 ics the string containing .ics code
 Returns:
 dt the day type as a string
 */
-(NSString *) loadDayType:(NSString *) cal
{
    NSString *dt;
    NSArray *icsa = [cal componentsSeparatedByString:@"\n"];//Creates an array with the separate lines of the .ics code string
    /*
     for(NSString *line in icsa)
     {
     NSLog(@"%@", line);
     }
     */
    
    NSDate *today = [NSDate date];//Gets today's date
    NSDateFormatter *tf = [[NSDateFormatter alloc] init];//Creates date formatter
    [tf setDateFormat:@"yyyyMMdd"];//Sets the date formatter to format the date (e.g. 20150101)
    NSString *ts = [tf stringFromDate: today];//Sets a string from the formatted date
    //NSLog(@"%@", ts);
    
    //Goes through the array and finds the index with the current date line
    int si = 0;
    int summary = 0;
    for(int i = 0; i < [icsa count]; i++)
    {
        NSString *s = [icsa objectAtIndex:i];
        //NSLog(@"%@", s);
        if([[s stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] isEqualToString:[@"DTSTART;VALUE=DATE:" stringByAppendingString:ts]] || [[s stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:[@"DTSTART;VALUE=DATE:" stringByAppendingString:ts]])
        {
            //NSLog(@"%@", s);
            si = i;
            break;
        }
        else
        {
            dt = @"Special Day";
        }
    }
    
    //Starts from the index of the current date and finds the index of the next SUMMARY
    for(int i = si; i < [icsa count]; i++)
    {
        NSString *s = [icsa objectAtIndex:i];
        if([[s substringToIndex:7] isEqualToString:@"SUMMARY"])
        {
            summary = i;//records index for SUMMARY
            break;
        }
    }
    dt = [[icsa objectAtIndex:summary] substringFromIndex:8];//trims SUMMARY string and stores the day type
    
    NSMutableArray *alph = [[NSMutableArray alloc] init];//mutable array for alphabet
    int next;
    NSString *ndt;
    for (char H = 'H'; H >= 'A'; H--)
    {
        //NSLog(@"%@", [NSString stringWithFormat:@"%c", H]);
        [alph addObject:[NSString stringWithFormat:@"%c", H]];
    }
    
    //NSLog(@"%u", [alph count]);
    for(int i = 0; i < [alph count]; i++)
    {
        //NSLog(@"%@", [alph objectAtIndex:i]);
    }
    
    for(int i = summary + 1; i < [icsa count]; i++)
    {
        NSString *s = [icsa objectAtIndex:i];
        if([[s substringToIndex:7] isEqualToString:@"SUMMARY"])
        {
            next = i;
            break;
        }
    }
    ndt = [[[icsa objectAtIndex:next] substringFromIndex:8] substringToIndex:1];
    //NSLog(@"%@", ndt);
    
    int cdti = 0;
    int ndti = 0;
    for(int i = 0; i < [alph count]; i++)
    {
        if([[dt substringToIndex:1] isEqualToString:[alph objectAtIndex:i]])
        {
            cdti = i;
            break;
        }
    }
    for(int i = 0; i < [alph count]; i++)
    {
        if([ndt isEqualToString:[alph objectAtIndex:i]])
        {
            ndti = i;
            break;
        }
    }
    //NSLog(@"cdti = %u, ndti = %u", cdti, ndti);
    drop = ((ndti == (cdti + 2)) || ((ndti == 0) && (cdti == [alph count] - 2)));
    
    if(drop)
    {
        //NSLog(@"Drop Day");
    }
    return dt;
}

/**
 Loads the mod clocks
 Returns:
 YES if it worked and NO if not
 */
-(BOOL) loadMC
{
    NSError *__autoreleasing dataError;
    BOOL worked;
    if([[type stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 4)
    {
        return NO;
    }
    //Completes the parsing of the XML with the mod clock information
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:[type stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]] ofType:@"xml"];
    //NSLog(@"File Path: %@", filePath);
    
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&dataError];//data object storing xml data - needs troubleshooting
    
    //Checks if data is null; if so, informs tester and terminates processes - frequent error:
    //Error Domain=NSCocoaErrorDomain Code=-1 "The operation couldn’t be completed. (Cocoa error -1.)" UserInfo=0x786518b0 {NSXMLParserErrorMessage=Could not open data stream}
    if(data == nil || data == (NSData *)[NSNull null])
    {
        NSLog(@"DATA IS NULL: %@", dataError);
        return NO;
    }
    
    //Creates a generic xml parser object, then a specialized mod clock parser delegate which carries instructions on how to parse mod clock xml information
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithData:data];
    ModClockParser *mcParser = [[ModClockParser alloc] initParser];
    [xmlparser setDelegate:mcParser];//Sets the delegate of the xml parser to be the mod clock parser class
    worked = [xmlparser parse];//Completes the parsing with the mod clock parser instructions and returns a boolean YES if successful, or NO if not
    
    return worked;
}

/**
 Calculates which mod clock properties to use and then the time left
 */
-(void)calculateMC
{
    NSDate *today = [NSDate date];
    NSDateFormatter *tf = [[NSDateFormatter alloc] init];
    [tf setDateFormat:@"EEE"];
    NSString *dow = [tf stringFromDate:today];
    
    //Checks if weekend, and if so, simply displays string saying "Weekend"
    if([dow isEqualToString:@"Sat"] || [dow isEqualToString:@"Sun"])
    {
        //NSLog(@"Weekend");
        ViewController *mcVC = (ViewController *) self.window.rootViewController;//Gets viewcontroller with mod clock label, which should be root view controller of app
        [mcVC setmcDisplay:@"Weekend"];
        return;
    }
    
    NSDate *cTime = [NSDate date];//Creates date object to hold current date
    NSDateFormatter *df = [[NSDateFormatter alloc] init];//Creates date formatter to set format of date object
    [df setDateFormat:@"HH:mm"];//Sets format of date object; HH means 24-hour time
    NSString *fTime = [df stringFromDate: cTime]; //Strig holding formatted current time
    //NSLog(@"%@", fTime);
    
    //Creates NSNumber objects from with int values parsed from current hour and minute substrings
    NSNumber *ch = [NSNumber numberWithInt:[[fTime substringToIndex:2] intValue]];//current hour
    NSNumber *cm = [NSNumber numberWithInt:[[fTime substringFromIndex:3] intValue]];//current minute
    //NSLog(@"%u, %u", [ch intValue], [cm intValue]);
    
    //Check for closest time after current time
    int ilatest = 0;
    if([ch intValue] > [[hours objectAtIndex:([times count]-1)] intValue] || ([ch intValue] == [[hours objectAtIndex:([times count]-1)] intValue] && [cm intValue] > [[minutes objectAtIndex:([times count]-1)] intValue]))
    {
        ilatest = (int)[times count];
    }
    else if([ch intValue] < [[hours objectAtIndex:0] intValue])
    {
        ilatest = 0;
    }
    else
    {
        //Check for closest time after current time
        for(int i = 0; i < [times count]; i++)
        {
            if(([ch intValue] < [[hours objectAtIndex:i] intValue]) || (([ch intValue] == [[hours objectAtIndex:i] intValue]) && ([cm intValue] < [[minutes objectAtIndex:i] intValue])))
            {
                ilatest = i;
                //NSLog(@"%u, %u", [[hours objectAtIndex:ilatest] intValue], [[minutes objectAtIndex:ilatest] intValue]);
                //NSLog(@"%u", ilatest);
                break;
            }
        }
    }
    
    //Converts both the current time and mod clock time to minutes since 00:00 in order to check difference
    if(ilatest != [times count] && ilatest != 0)
    {
        //NSLog(@"%u", ilatest);
        NSNumber *cminutesTime = [NSNumber numberWithInt:[ch intValue]*60 + [cm intValue]];
        NSNumber *iminutesTime = [NSNumber numberWithInt:[[hours objectAtIndex:ilatest] intValue]*60 + [[minutes objectAtIndex:ilatest] intValue]];
        dTime = [NSNumber numberWithInt:[iminutesTime intValue] - [cminutesTime intValue]];
        //NSLog(@"%u", [dTime intValue]);
    }
    
    //Sets the flag and name for display, making sure the appropriate ones are used
    if(ilatest > 0)
    {
        //NSLog(@"%@, %@", [flags objectAtIndex:ilatest - 1], [names objectAtIndex:ilatest - 1]);
        dFlag = [flags objectAtIndex:(ilatest - 1)];
        dName = [names objectAtIndex:(ilatest - 1)];
    }
    else
    {
        //NSLog(@"%@, %@", [flags objectAtIndex:ilatest], [names objectAtIndex:ilatest]);
        dFlag = [flags objectAtIndex:ilatest];
        dName = [names objectAtIndex:ilatest];
    }
}

/**
 Displays the formatted modclock in a label in a view controller
 */
-(void)displayMC
{
    NSString *displayString;//String for display
    ViewController *mcVC = (ViewController *) self.window.rootViewController;//Gets viewcontroller with mod clock label, which should be root view controller of app
    
    NSDate *today = [NSDate date];
    NSDateFormatter *tf = [[NSDateFormatter alloc] init];
    [tf setDateFormat:@"EEE"];
    NSString *dow = [tf stringFromDate:today];
    if([type isEqualToString:@"Special Day"])
    {
        displayString = @"Special Day";
    }
    //Checks if weekend, and if so, simply displays string saying "Weekend"
    else if([dow isEqualToString:@"Sat"] || [dow isEqualToString:@"Sun"])
    {
        //NSLog(@"Weekend");
        //ViewController *mcVC = (ViewController *) self.window.rootViewController;//Gets viewcontroller with mod clock label, which should be root view controller of app
        //[mcVC setmcDisplay:@"Weekend"];
        displayString = @"Weekend";
    }
    //Creates the string to fill label text
    else if([dName isEqualToString:@"After School"] || (drop && [[dName substringToIndex:1] isEqualToString:@"7"]))
    {
        displayString = @"After School";//Time isn't needed
    }
    else if([dName isEqualToString:@"Before School"])
    {
        displayString = @"Before School";
    }
    else
    {
        if([dFlag isEqualToString:@"left"])
        {
            dFlag = [dFlag stringByAppendingString:@" in"];//Adds "in" to "left" so that it makes sense
        }
        displayString = [NSString stringWithFormat:@"%u min %@ \n%@", [dTime intValue], dFlag, dName];
    }
    [mcVC setmcDisplay:displayString];//sends the string to the label in the view controller
    //NSLog(@"%@", displayString);
}

/**
    This method recalculates and redisplays the mod clock
 */
-(void) updateMC
{
    [self calculateMC];
    [self displayMC];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    if (error.code == 3010) {
        NSLog(@"Push notifications are not supported in the iOS Simulator.");
    } else {
        // show some alert or otherwise handle the failure to register.
        NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    //[PFPush storeDeviceToken:newDeviceToken];
    //[PFPush subscribeToChannelInBackground:@"" target:self selector:@selector(subscribeFinished:error:)];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    //[PFPush handlePush:userInfo];
    
    if (application.applicationState == UIApplicationStateInactive) {
        //[PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    // Override point for customization after application launch.
   // SEL calc = NSSelectorFromString(@"calculateMC");
    //SEL disp = NSSelectorFromString(@"displayMC");
    SEL up = NSSelectorFromString(@"updateMC");
    
    //NSLog (and other variables) is used to track through step by step and check/resolve errors, so any unnecessary use of it should be commented out
    //NSLog(@"Launched");
    
    //Gets the current day of the week
    NSDate *today = [NSDate date];
    NSDateFormatter *tf = [[NSDateFormatter alloc] init];
    [tf setDateFormat:@"EEE"];
    NSString *dow = [tf stringFromDate:today];
    
    //Checks if weekend, and if so, simply displays string saying "Weekend"
    if([dow isEqualToString:@"Sat"] || [dow isEqualToString:@"Sun"])
    {
        //NSLog(@"Weekend");
        ViewController *mcVC = (ViewController *) self.window.rootViewController;//Gets viewcontroller with mod clock label, which should be root view controller of app
        [mcVC setmcDisplay:@"Weekend"];
    }
    
    NSURL *dURL = [NSURL URLWithString:@"http://www.roxburylatin.org/data/ical/Day_Type.ics"];
    NSString *lics = [self loadICSAndReturnPathFromURL:dURL];
    if(lics == nil || lics == (NSString *) [NSNull null])
    {
        NSLog(@"There is no calendar information.");
        ViewController *mcVC = (ViewController *) self.window.rootViewController;//Gets viewcontroller with mod clock label, which should be root view controller of app
        [mcVC setmcDisplay:@"Check connection"];
    }
    type = [self loadDayType:lics];
    //NSLog(@"%@", type);
    
    BOOL loaded = [self loadMC];
    
    //Checks if parsing worked;
    if(loaded)
    {
        //Allocates memory and initializes mutable array objects which will store times, flags, and names from the mod clock objects
        times = [[NSMutableArray alloc] init];
        flags = [[NSMutableArray alloc] init];
        names = [[NSMutableArray alloc] init];
        
        //Fills mutable arrays with the parsed times, flags, and names
        //int ci = 0;
        //NSLog(@"AYEEEEEEE");
        for(ModClock *m in modclocks)
        {
            //NSLog(@"1: %@, %@, %@", m.time, m.flag, m.name);
            //NSLog(@"AND");
            [times addObject:m.time];
            [flags addObject:m.flag];
            [names addObject:m.name];
            //NSLog(@"2: %@,%@,%@",[times objectAtIndex:ci], [flags objectAtIndex:ci], [names objectAtIndex:ci]);
            //ci++;
        }
    }
    else
    {
        NSLog(@"Boo...");
        ViewController *mcVC = (ViewController *) self.window.rootViewController;//Gets viewcontroller with mod clock label, which should be root view controller of app
        [mcVC setmcDisplay:@"Check connection."];
    }
    
    //Allocates memorey and initializes mutable array objects to hold the hour and minute values acquired from the times
    hours = [[NSMutableArray alloc] init];
    minutes = [[NSMutableArray alloc] init];
    
    //Fills mutable arrays with the hours and minutes as int values
    int j = 0;
    for(NSString *t in times)
    {
        //times are strings in the form "HH:mm"
        //Taking substrings and parsing into ints
        int h = [[t substringToIndex:2] intValue];//int hour
        int m = [[t substringFromIndex:3] intValue];//int minute
        //NSLog(@"%u, %u", h, m);
        
        //Adds the hours and minutes
        [hours addObject:[NSNumber numberWithInt: h]];
        [minutes addObject:[NSNumber numberWithInt:m]];
        //NSLog(@"%u, %u", [[hours objectAtIndex:j] intValue], [[minutes objectAtIndex:j] intValue]);
        j++;
    }
    
    [self calculateMC];//Initial calculation
    [self displayMC];//Initial display
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:up userInfo:nil repeats:YES];//Updates the mod clock every second
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - ()

- (void)subscribeFinished:(NSNumber *)result error:(NSError *)error {
    if ([result boolValue]) {
        NSLog(@"ParseStarterProject successfully subscribed to push notifications on the broadcast channel.");
    } else {
        NSLog(@"ParseStarterProject failed to subscribe to push notifications on the broadcast channel.");
    }
}

@end
