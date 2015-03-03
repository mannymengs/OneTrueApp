//
//  ModClockParser.m
//  OTA
//
//  Created by Manny Mengistab on 11/2/14.
//  Copyright (c) 2014 JSM Inc. All rights reserved.
//

#import "ModClockParser.h"
#import "AppDelegate.h"

@implementation ModClockParser
NSXMLParser *parser;

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSString *errorString = [NSString stringWithFormat:@"Could not load data - error at line %ld", (long)parser.lineNumber];
    NSLog(@"Error - %@",errorString);
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
    if(!currentElementValue)
    {
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    }
    else
    {
        [currentElementValue appendString:string];
    }
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
        app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

/**
 This pair of methods deals with the elements and attributes in the xml
*/
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"modclock"])
    {
        app.modclocks = [[NSMutableArray alloc] init];//for parent element, allocate memory and initialize mutable array of mod clocks
    }
    else if([elementName isEqualToString:@"mod"])
    {
        //for child element, allocate memory and initizalize mod clock, then set properties of mod clock to equal attributes of the element
        mc = [[ModClock alloc] init];
        mc.time = [attributeDict objectForKey:@"time"];
        mc.flag = [attributeDict objectForKey:@"flag"];
        mc.name = [attributeDict objectForKey:@"name"];
    }
}

-(void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"modclock"])
    {
        return;//ignores parent element
    }
    else if ([elementName isEqualToString:@"mod"])
    {
        //when done with each child element, add newly filled mod clock to mutable array, then set it to nil
        [app.modclocks addObject:mc];
        mc = nil;
    }
    else
    {
        [mc setValue:currentElementValue forKey:elementName];//if neither of the above work, which is impossible
    }
}
@end
