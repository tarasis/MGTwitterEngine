//
//  MGTwitterSearchYAJLGenericParser.h
//  MGTwitterEngine
//
//  Created by Matt Gemmell on 11/02/2008.
//  Copyright 2008 Instinctive Code.
//

#import "MGTwitterEngineGlobalHeader.h"

#import "MGTwitterYAJLGenericParser.h"

@interface MGTwitterSearchYAJLGenericParser : MGTwitterYAJLGenericParser {
	BOOL insideArray;
	NSMutableDictionary *_status;
}

@end
