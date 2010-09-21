//
//  MGTwitterEngineParserFactory.h
//
//  Created by Sam Deane on 21/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MGTwitterRequestTypes.h"
#import "MGTwitterEngineDelegate.h"

@class MGTwitterEngine;

@interface MGTwitterParserFactory : NSObject 
{

}

- (NSString*) APIFormat;

- (void) parseData: (NSData*) data 
			URL: (NSURL*) URL 
			identifier: (NSString*) identifier 
			requestType: (MGTwitterRequestType) requestType 
			responseType: (MGTwitterResponseType) responseType 
			deliveryOptions: (MGTwitterEngineDeliveryOptions) deliveryOptions 
			engine: (MGTwitterEngine*) engine;

@end
