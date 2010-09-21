//
//  MGTwitterParserFactoryNSXML.h
//
//  Created by Sam Deane on 21/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

#import "MGTwitterParserFactory.h"


@interface MGTwitterParserFactoryNSXML : MGTwitterParserFactory
{
	
}

- (void) parseData: (NSData*) data URL: (NSURL*) URL identifier: (NSString*) identifier requestType: (MGTwitterRequestType) requestType responseType: (MGTwitterResponseType) responseType engine: (MGTwitterEngine*) engine;

@end
