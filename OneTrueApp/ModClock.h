//
//  ModClock.h
//  OTA
//
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModClock : NSObject

/**
 Properties:
 name
    the current period and block
 time
    the benchmark time at which the flag should change
 flag
    the modifier which explains the meaning of time
 */
@property NSString *name, *time, *flag;

@end
