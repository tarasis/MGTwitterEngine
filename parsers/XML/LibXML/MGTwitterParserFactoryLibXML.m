//
//  MGTwitterParserFactoryLibXML.m
//  ici
//
//  Created by Sam Deane on 21/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

#import "MGTwitterParserFactoryLibXML.h"
#import "MGTwitterEngine.h"

#import "MGTwitterStatusesLibXMLParser.h"
#import "MGTwitterMessagesLibXMLParser.h"
#import "MGTwitterUsersLibXMLParser.h"
#import "MGTwitterMiscLibXMLParser.h"
#import "MGTwitterSocialGraphLibXMLParser.h"

@implementation MGTwitterParserFactoryLibXML

- (void) parseData: (NSData*) data URL: (NSURL*) URL identifier: (NSString*) identifier requestType: (MGTwitterRequestType) requestType responseType: (MGTwitterResponseType) responseType deliveryOptions: (MGTwitterEngineDeliveryOptions) deliveryOptions engine: (MGTwitterEngine*) engine
{
switch (responseType) {
	case MGTwitterStatuses:
	case MGTwitterStatus:
		[MGTwitterStatusesLibXMLParser parserWithXML:data delegate:engine 
								connectionIdentifier:identifier requestType:requestType 
										responseType:responseType URL:URL];
		break;
	case MGTwitterUsers:
	case MGTwitterUser:
		[MGTwitterUsersLibXMLParser parserWithXML:data delegate:engine 
							 connectionIdentifier:identifier requestType:requestType 
									 responseType:responseType URL:URL];
		break;
	case MGTwitterDirectMessages:
	case MGTwitterDirectMessage:
		[MGTwitterMessagesLibXMLParser parserWithXML:data delegate:engine 
								connectionIdentifier:identifier requestType:requestType 
										responseType:responseType URL:URL];
		break;
	case MGTwitterMiscellaneous:
		[MGTwitterMiscLibXMLParser parserWithXML:data delegate:engine 
							connectionIdentifier:identifier requestType:requestType 
									responseType:responseType URL:URL];
		break;
	case MGTwitterSocialGraph:
		[MGTwitterSocialGraphLibXMLParser parserWithXML:data delegate:engine 
								   connectionIdentifier:identifier requestType:requestType 
										   responseType:responseType URL:URL];
		break;
	default:
		break;
	}
}

@end
