//
//  MGTwitterParserFactoryNSXML.m
//
//  Created by Sam Deane on 21/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

#import "MGTwitterParserFactoryNSXML.h"
#import "MGTwitterEngine.h"

#import "MGTwitterStatusesParser.h"
#import "MGTwitterUsersParser.h"
#import "MGTwitterMessagesParser.h"
#import "MGTwitterMiscParser.h"
#import "MGTwitterSocialGraphParser.h"
#import "MGTwitterUserListsParser.h"

@implementation MGTwitterParserFactoryNSXML

- (NSString*) APIFormat
{
	return @"xml";
}

- (void) parseData: (NSData*) data URL: (NSURL*) URL identifier: (NSString*) identifier requestType: (MGTwitterRequestType) requestType responseType: (MGTwitterResponseType) responseType deliveryOptions: (MGTwitterEngineDeliveryOptions) deliveryOptions engine: (MGTwitterEngine*) engine
{
// Determine which type of parser to use.
switch (responseType) {
	case MGTwitterStatuses:
	case MGTwitterStatus:
		[MGTwitterStatusesParser parserWithXML:data delegate:engine 
						  connectionIdentifier:identifier requestType:requestType 
								  responseType:responseType];
		break;
	case MGTwitterUsers:
	case MGTwitterUser:
		[MGTwitterUsersParser parserWithXML:data delegate:engine 
					   connectionIdentifier:identifier requestType:requestType 
							   responseType:responseType];
		break;
	case MGTwitterDirectMessages:
	case MGTwitterDirectMessage:
		[MGTwitterMessagesParser parserWithXML:data delegate:engine 
						  connectionIdentifier:identifier requestType:requestType 
								  responseType:responseType];
		break;
	case MGTwitterMiscellaneous:
		[MGTwitterMiscParser parserWithXML:data delegate:engine 
					  connectionIdentifier:identifier requestType:requestType 
							  responseType:responseType];
		break;
	case MGTwitterUserLists:
		NSLog(@"response type: %d", responseType);
		[MGTwitterUserListsParser parserWithXML:data delegate:engine 
						   connectionIdentifier:identifier requestType:requestType 
								   responseType:responseType];
		break;
		
	case MGTwitterSocialGraph:
		[MGTwitterSocialGraphParser parserWithXML:data delegate:engine 
							 connectionIdentifier:identifier requestType:requestType 
									 responseType:responseType];
	default:
		break;
}
}

@end
