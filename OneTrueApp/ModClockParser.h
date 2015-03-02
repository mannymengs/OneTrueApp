//
//  ModClockParser.h
//  OTA
//
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "ModClock.h"

@interface ModClockParser : NSObject <NSXMLParserDelegate>
{
    NSMutableString *currentNodeContent;
    ModClock *mc;
    AppDelegate *app;
}

-(id) initParser;
-(id) loadXMLByURL: (NSString *) urlString;
-(ModClock *) mcDisp;


@end
