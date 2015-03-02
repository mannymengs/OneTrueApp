//
//  ModClockVC.m
//  OTA
//
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import "ModClockVC.h"

@interface ModClockVC ()

@end

@implementation ModClockVC

/**
 This method runs when the view controller loads. It completes the task of setting up and displaying the mod clock.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    //Figure out day type
    //NSString *xmlURL = @"";
    //Parse XML with URL corresponding to day type
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.roxburylatin.org/data/flash/ADay.xml"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithData:data];
    ModClockParser *parser = [[ModClockParser alloc] initParser];
    [xmlparser setDelegate:parser];
    
    BOOL worked;
    if(worked)
    {
        NSLog(@"Yay!");
    }
    else
    {
        NSLog(@"Boo...");
    }
    //Display mod clock with parsed info.
    /*
     ModClock *mc = [p mcDisp];
     NSString *mcText = [NSString stringWithFormat:@"Period"];//Finish format
     self.mcDispLabel.text = mcText;
     */
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

@end
