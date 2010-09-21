//
//  MGTwitterUsersYAJLParser.m
//  MGTwitterEngine
//
//  Created by Matt Gemmell on 11/02/2008.
//  Copyright 2008 Instinctive Code.
//

#import "MGTwitterUsersYAJLParser.h"

@implementation MGTwitterUsersYAJLParser

- (void)addValue:(id)value forKey:(NSString *)key
{
	if (_status)
	{
		[_status setObject:value forKey:key];
		MGTWITTER_LOG_PARSING(@"user:   status: %@ = %@ (%@)", key, value, NSStringFromClass([value class]));
	}
	else if (_user)
	{
		[_user setObject:value forKey:key];
		MGTWITTER_LOG_PARSING(@"user:   user: %@ = %@ (%@)", key, value, NSStringFromClass([value class]));
	}
}

- (void)startDictionaryWithKey:(NSString *)key
{
	MGTWITTER_LOG_PARSING(@"user: dictionary start = %@", key);

	if (! _user)
	{
		_user = [[NSMutableDictionary alloc] initWithCapacity:0];
	}
	else
	{
		if (! _status)
		{
			_status = [[NSMutableDictionary alloc] initWithCapacity:0];
		}
	}
}

- (void)endDictionary
{
	if (_status)
	{
		[_user setObject:_status forKey:@"status"];
		[_status release];
		_status = nil;
	}
	else
	{
		[_user setObject:[NSNumber numberWithInt:requestType] forKey:TWITTER_SOURCE_REQUEST_TYPE];
		
		[self _parsedObject:_user];
		
		[parsedObjects addObject:_user];
		[_user release];
		_user = nil;
	}
	
	MGTWITTER_LOG_PARSING(@"user: dictionary end");
}

- (void)startArrayWithKey:(NSString *)key
{
	MGTWITTER_LOG_PARSING(@"user: array start = %@", key);
}

- (void)endArray
{
	MGTWITTER_LOG_PARSING(@"user: array end");
}

- (void)dealloc
{
	[_user release];
	[_status release];

	[super dealloc];
}

@end
