//
//  MGTwitterEngineParserFactory.m
//  ici
//
//  Created by Sam Deane on 21/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

#import "MGTwitterParserFactory.h"

@implementation MGTwitterParserFactory

- (void) parseData: (NSData*) data 
			   URL: (NSURL*) URL 
		identifier: (NSString*) identifier 
	   requestType: (MGTwitterRequestType) requestType 
	  responseType: (MGTwitterResponseType) responseType 
   deliveryOptions: (MGTwitterEngineDeliveryOptions) deliveryOptions 
			engine: (MGTwitterEngine*) engine
{
	NSAssert(NO, @"Parser subclasses should implement this method.");
}

@end
