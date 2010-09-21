//
//  MGTwitterSearchYAJLParser.m
//  MGTwitterEngine
//
//  Created by Matt Gemmell on 11/02/2008.
//  Copyright 2008 Instinctive Code.
//

#import "MGTwitterSearchYAJLParser.h"

@implementation MGTwitterSearchYAJLParser

- (void)addValue:(id)value forKey:(NSString *)key
{
	if (insideArray)
	{
		//if for some reason there are no dictionaries, exit here
		if (!_dictionaries || [_dictionaries count] == 0)
		{
			return;
		}
		
		NSMutableDictionary *lastDictionary = [_dictionaries lastObject];
		[lastDictionary setObject:value forKey:key];
		
		MGTwitterLogParsing(@"search:   results: %@ = %@ (%@)", key, value, NSStringFromClass([value class]));
	}
	else
	{
		if (_status)
		{
			[_status setObject:value forKey:key];
		}
		MGTwitterLogParsing(@"search:   status: %@ = %@ (%@)", key, value, NSStringFromClass([value class]));
	}
}

- (void)startDictionaryWithKey:(NSString *)key
{
	MGTwitterLogParsing(@"search: dictionary start = %@", key);
	if (insideArray)
	{
		if (!_dictionaries) 
		{
			_dictionaries = [[NSMutableArray alloc] init];
		}
		
		if (!_dictionaryKeys) 
		{
			_dictionaryKeys = [[NSMutableArray alloc] init];
		}
		
		//add a new dictionary to the array
		NSMutableDictionary *newDictionary = [[NSMutableDictionary alloc] initWithCapacity:0];
		[_dictionaries addObject:newDictionary];
		[newDictionary release];
		
		//add a key for the above dictionary to the array
		[_dictionaryKeys addObject:(key) ? key : @""];
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
	if (insideArray)
	{
		if (_dictionaries && _dictionaryKeys && [_dictionaries count] > 0 && [_dictionaryKeys count] > 0)
		{
			//is this the root dictionary?
			if ([_dictionaries count] == 1)
			{
				//one dictionary left, so it must be the root
				NSMutableDictionary *rootDictionary = [_dictionaries lastObject];
				
				//set the request type in the root dictionary
				[rootDictionary setObject:[NSNumber numberWithInt:requestType] forKey:TWITTER_SOURCE_REQUEST_TYPE];
				
				//send the root dictionary to the super class
				[self _parsedObject:rootDictionary];			
				[parsedObjects addObject:rootDictionary];
			}
			else 
			{
				//child dictionary found
				//add the child dictionary to its parent dictionary
				NSMutableDictionary *parentDictionary = [_dictionaries objectAtIndex:[_dictionaries count] - 2];
				[parentDictionary setObject:[_dictionaries lastObject] forKey:[_dictionaryKeys lastObject]];
			}
			
			//remove the last dictionary since it has been joined with its parent (or was the root dictionary)
			//also remove the corresponding key
			[_dictionaries removeLastObject];
			[_dictionaryKeys removeLastObject];
		}
	}
	else
	{
		if (_status)
		{
			[_status setObject:[NSNumber numberWithInt:requestType] forKey:TWITTER_SOURCE_REQUEST_TYPE];
			
			[parsedObjects addObject:_status];
			[_status release];
			_status = nil;
		}
	}
	
	MGTwitterLogParsing(@"search: dictionary end");
}

- (void)startArrayWithKey:(NSString *)key
{
	MGTwitterLogParsing(@"search: array start = %@", key);
	insideArray = YES;
}

- (void)endArray
{
	MGTwitterLogParsing(@"search: array end");
	insideArray = NO;
}

- (void)dealloc
{
	[_dictionaries release];
	[_dictionaryKeys release];
	[_status release];
	
	[super dealloc];
}


@end
