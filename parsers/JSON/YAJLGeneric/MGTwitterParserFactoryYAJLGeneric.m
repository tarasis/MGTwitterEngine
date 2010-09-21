//
//  MGTwitterParserFactoryYAJLGeneric.m
//
//  Created by Sam Deane on 21/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

#import "MGTwitterParserFactoryYAJLGeneric.h"
#import "MGTwitterEngine.h"
#import "MGTwitterMiscYAJLGenericParser.h"
#import "MGTwitterSearchYAJLGenericParser.h"

#import "OAuthConsumer.h"

@implementation MGTwitterParserFactoryYAJLGeneric

- (void) parseData: (NSData*) data URL: (NSURL*) URL identifier: (NSString*) identifier requestType: (MGTwitterRequestType) requestType responseType: (MGTwitterResponseType) responseType engine: (MGTwitterEngine*) engine
{
    switch (responseType) {
		case MGTwitterMiscellaneous:
			[MGTwitterMiscYAJLGenericParser parserWithJSON:data delegate:engine 
							   connectionIdentifier:identifier requestType:requestType 
									   responseType:responseType URL:URL deliveryOptions:_deliveryOptions];
			break;
		case MGTwitterSearchResults:
 			[MGTwitterSearchYAJLGenericParser parserWithJSON:data delegate:engine 
								 connectionIdentifier:identifier requestType:requestType 
										 responseType:responseType URL:URL deliveryOptions:_deliveryOptions];
			break;
		default:
            [MGTwitterYAJLGenericParser parserWithJSON:data delegate:engine 
								  connectionIdentifier:identifier requestType:requestType 
										  responseType:responseType URL:URL deliveryOptions:_deliveryOptions];
            break;
	}
}

@end
