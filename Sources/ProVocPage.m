//
//  ProVocPage.m
//  ProVoc
//
//  Created by bovet on Sun Feb 09 2003.
//  Copyright (c) 2003 Arizona Software. All rights reserved.
//

#import "ProVocPage.h"
#import "ProVocDocument.h"

@implementation ProVocPage

-(id)init
{
    if (self = [super init]) {
        mWords = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

-(void)dealloc
{
    [mWords release];
    [super dealloc];
}

-(id)initWithCoder:(NSCoder *)inCoder
{
	if ([inCoder allowsKeyedCoding] && [inCoder decodeObjectForKey:@"ProVocWordsArray"]) {
		if (self = [super init]) {
			mTitle = [[inCoder decodeObjectForKey:@"ProVocPageTitle"] retain];
			mWords = [[inCoder decodeObjectForKey:@"ProVocWordsArray"] retain];
		}
	} else {
		if (self = [super initWithCoder:inCoder])
			mWords = [[inCoder decodeObjectForKey:@"Words"] retain];
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder *)inCoder
{
	[super encodeWithCoder:inCoder];
	[inCoder encodeObject:mWords forKey:@"Words"];
}

-(NSArray *)words
{
	return mWords;
}

-(void)addWord:(ProVocWord *)inWord
{
	[self addWords:@[inWord]];
}

-(void)addWords:(NSArray *)inWords
{
	[self insertWords:inWords atIndex:[[self words] count]];
}

-(void)insertWord:(ProVocWord *)inWord atIndex:(NSInteger)inIndex
{
	[self insertWords:@[inWord] atIndex:inIndex];
}

-(void)insertWords:(NSArray *)inWords atIndex:(NSInteger)inIndex
{
	NSEnumerator *enumerator = [inWords reverseObjectEnumerator];
	ProVocWord *word;
	while (word = [enumerator nextObject]) {
		[word setPage:self];
		[mWords insertObject:word atIndex:inIndex];
	}
}

-(void)removeWord:(ProVocWord *)inWord
{
	[mWords removeObject:inWord];
}

-(void)removeWords:(NSArray *)inWords
{
	[mWords removeObjectsInArray:inWords];
}

@end
