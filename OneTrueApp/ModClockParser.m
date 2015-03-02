//
//  ModClockParser.m
//  OTA
//
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

/*
 How to Implement:
 Read in type of day (?)
 Parse said day's XML and store all mod clock times, flags, and names in 3 arrays
 Get current time, and compare to all times in array of times to see which is closest (parse NSString into NSInteger?)
 Use that comparison to find grab corresponding flag and name
 Return these values to ModClock class
 */

#import "ModClockParser.h"
#import "AppDelegate.h"

@implementation ModClockParser

NSXMLParser *parser;

/**
 This method loads the XML code of URL which is given as a string and returns a parser which can be used to parse it.
 Parameters:
 urlString
    the string holding the URL containing the XML which is to be parsed
 
 Return Value:
 self
    the parser which can be used to parse the loaded XML
 */
-(id)loadXMLByURL:(NSString *)urlString
{
    NSURL *mcXML = [NSURL URLWithString:urlString];
    NSData *xmlData = [[NSData alloc] initWithContentsOfURL:mcXML];
    parser = [[NSXMLParser alloc] initWithData:xmlData];
    parser.delegate = self;
    [parser parse];
    return self;
}

/**
 This method takes XML content from a given node found as a string, trims the white space, and stores it in a variable in order to prime the XML for parsing.
 Parameters:
 parser
    the parser (unused)
 foundCharacters
    the string holding the found characters from the XML
 */
-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(!currentNodeContent)
    {
        currentNodeContent = [[NSMutableString alloc] initWithString:string];
    }
    else
    [currentNodeContent appendString:string];
}

/**
 This method initiates the parser
 Returns:
 self
    the parser
 */
-(id) initParser
{
    if(self == [super init])
    {
        app = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    }
    return self;
}

-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"modclock"])
    {
        app.modclocks = [[NSMutableArray alloc] init];
        app.times = [[NSMutableArray alloc] init];
        app.flags = [[NSMutableArray alloc] init];
        app.names = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"mod"])
    {
        mc = [[ModClock alloc] init];
        mc.time = [[attributeDict objectForKey:@"time"] stringValue];
        mc.flag = [[attributeDict objectForKey:@"flag"] stringValue];
        mc.name = [[attributeDict objectForKey:@"name"] stringValue];
    }
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"modclock"])
    {
        return;
    }
    if ([elementName isEqualToString:@"name"])
    {
        [app.modclocks addObject:mc];
        mc = nil;
        
    }
}

/**
 This method will return the ModClock object holding the current mod clock display information which can then be used to display the time
 Returns:
 mc
    the mod clock object
 */
-(ModClock *) mcDisp
{
    mc.name = @"Name";
    mc.time = @"Time";
    mc.flag = @"Flag";
    return mc;
}
@end
