//
//  MGTwitterParserFactoryTouchJSON.m
//
//  Created by Sam Deane on 21/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

#import "MGTwitterParserFactoryTouchJSON.h"
#import "MGTwitterTouchJSONParser.h"
#import "MGTwitterEngine.h"
#import "OAuthConsumer.h"

@implementation MGTwitterParserFactoryTouchJSON

- (void) parseData: (NSData*) data URL: (NSURL*) URL identifier: (NSString*) identifier requestType: (MGTwitterRequestType) requestType responseType: (MGTwitterResponseType) responseType engine: (MGTwitterEngine*) engine
{
	[MGTwitterTouchJSONParser parserWithJSON:data delegate:engine
								connectionIdentifier:identifier requestType:requestType
										responseType:responseType URL:URL deliveryOptions:_deliveryOptions];
}

@end
