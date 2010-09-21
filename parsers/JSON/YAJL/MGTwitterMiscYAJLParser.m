//
//  MGTwitterMiscYAJLParser.m
//  MGTwitterEngine
//
//  Created by Matt Gemmell on 11/02/2008.
//  Copyright 2008 Instinctive Code.
//

#import "MGTwitterMiscYAJLParser.h"

@implementation MGTwitterMiscYAJLParser

- (void)addValue:(id)value forKey:(NSString *)key
{
	if (_results)
	{
		[_results setObject:value forKey:key];
		MGTwitterLogParsing(@"misc:   results: %@ = %@ (%@)", key, value, NSStringFromClass([value class]));
	}
}

- (void)startDictionaryWithKey:(NSString *)key
{
	MGTwitterLogParsing(@"misc: dictionary start = %@", key);

	if (! _results)
	{
		_results = [[NSMutableDictionary alloc] initWithCapacity:0];
	}
}

- (void)endDictionary
{
	[_results setObject:[NSNumber numberWithInt:requestType] forKey:TWITTER_SOURCE_REQUEST_TYPE];
		
	[self _parsedObject:_results];
		
	if(_results){
		[parsedObjects addObject:_results];
	}

	[_results release];
	_results = nil;
	
	MGTwitterLogParsing(@"misc: dictionary end");
}

- (void)startArrayWithKey:(NSString *)key
{
	MGTwitterLogParsing(@"misc: array start = %@", key);
}

- (void)endArray
{
	MGTwitterLogParsing(@"misc: array end");
}

- (void)dealloc
{
	[_results release];

	[super dealloc];
}

@end
