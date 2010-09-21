//
//  MGTwitterParserFactoryYAJL.m
//
//  Created by Sam Deane on 21/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

#import "MGTwitterParserFactoryYAJL.h"

#import "MGTwitterStatusesYAJLParser.h"
#import "MGTwitterMessagesYAJLParser.h"
#import "MGTwitterUsersYAJLParser.h"
#import "MGTwitterMiscYAJLParser.h"
#import "MGTwitterSearchYAJLParser.h"

#import "OAuthConsumer.h"

@implementation MGTwitterParserFactoryYAJL

- (void) parseData: (NSData*) data URL: (NSURL*) URL identifier: (NSString*) identifier requestType: (MGTwitterRequestType) requestType responseType: (MGTwitterResponseType) responseType engine: (MGTwitterEngine*) engine
{
	switch (responseType) {
		case MGTwitterStatuses:
		case MGTwitterStatus:
			[MGTwitterStatusesYAJLParser parserWithJSON:data delegate:engine 
								   connectionIdentifier:identifier requestType:requestType 
										   responseType:responseType URL:URL deliveryOptions:_deliveryOptions];
			break;
		case MGTwitterUsers:
		case MGTwitterUser:
			[MGTwitterUsersYAJLParser parserWithJSON:data delegate:engine 
								connectionIdentifier:identifier requestType:requestType 
										responseType:responseType URL:URL deliveryOptions:_deliveryOptions];
			break;
		case MGTwitterDirectMessages:
		case MGTwitterDirectMessage:
			[MGTwitterMessagesYAJLParser parserWithJSON:data delegate:engine 
								   connectionIdentifier:identifier requestType:requestType 
										   responseType:responseType URL:URL deliveryOptions:_deliveryOptions];
			break;
		case MGTwitterMiscellaneous:
			[MGTwitterMiscYAJLParser parserWithJSON:data delegate:engine 
							   connectionIdentifier:identifier requestType:requestType 
									   responseType:responseType URL:URL deliveryOptions:_deliveryOptions];
			break;
		case MGTwitterSearchResults:
			[MGTwitterSearchYAJLParser parserWithJSON:data delegate:engine 
								 connectionIdentifier:identifier requestType:requestType 
										 responseType:responseType URL:URL deliveryOptions:_deliveryOptions];
			break;
		default:
			break;
	}
}

@end
