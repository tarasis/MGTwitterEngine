//
//  MGTwitterParserFactoryYAJLGeneric.h
//
//  Created by Sam Deane on 21/09/2010.
//  Copyright 2010 Elegant Chaos. All rights reserved.
//

// By default, logging will be enabled if DEBUG is set to 1, and disabled otherwise.
// You can provide your own definition of MGTwitterLog to direct it elsewhere.

#ifndef MGTwitterLog
#if DEBUG
#define MGTwitterLog(...) NSLog(__VA_ARGS__)
#else
#define MGTwitterLog(...)
#endif
#endif

// By default, logging of the parsers will be enabled if DEBUG_PARSING is set to 1, and disabled otherwise.
// You can provide your own definition of MGTwitterLogParsing to direct it elsewhere.

#ifndef MGTwitterLogParsing
#if DEBUG_PARSING
#define MGTwitterLogParsing MGTwitterLog
#else
#define MGTwitterLogParsing(...)
#endif
#endif
