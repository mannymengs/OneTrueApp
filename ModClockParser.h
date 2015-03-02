//
//  ModClockParser.h
//  OTA
//
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

@class AppDelegate;
#import <Foundation/Foundation.h>
#import "ModClock.h"

@interface ModClockParser : NSObject <NSXMLParserDelegate>
{
    NSMutableString *currentElementValue;
    ModClock *mc;
    AppDelegate *app;
}

-(id) initParser;

@end