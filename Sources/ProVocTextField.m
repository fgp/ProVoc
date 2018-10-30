//
//  ProVocTextField.m
//  ProVoc
//
//  Created by Simon Bovet on 14.10.05.
//  Copyright 2005 Arizona Software. All rights reserved.
//

#import "ProVocTextField.h"


@implementation ProVocTextField

- (id)chainedResponder:(int)inOffset
{
	return inOffset < 0 ? mPreviousField : mNextField;
}

- (BOOL)becomeFirstResponder
{
	BOOL ok = [super becomeFirstResponder];
	if (ok) {
		[[NSNotificationCenter defaultCenter] postNotificationName:ProVocTextFieldDidBecomeFirstResponderNotification object:self];
	}
	return ok;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(controlTextDidChange:) name:NSControlTextDidChangeNotification object:nil];
	}
	return self;
}

- (void)controlTextDidChange:(NSNotification *)obj {
	[self updateLayoutForCustomFont];
}

- (void)updateLayoutForCustomFont {
	if([self.attributedStringValue length] > 0) {
		[self.attributedStringValue enumerateAttributesInRange:NSMakeRange(0, self.attributedStringValue.string.length) options:0 usingBlock:^(NSDictionary<NSString *,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
			//NSLog(@"Found Attribs: %@ in range %@", attrs, NSStringFromRange(range));
			if ([attrs objectForKey:NSFontAttributeName]) {
				//NSLog(@"Found Font: %@ in range %@", [attrs objectForKey:NSFontAttributeName], NSStringFromRange(range));
				NSFont *font = (NSFont*)[attrs objectForKey:NSFontAttributeName];
				if(font != nil) {
					float minSize = font.pointSize;
					float maxSize = font.pointSize;
					float fontSize = maxSize;
					NSTextField *field = self;
					for(int a=maxSize; a>=minSize; a--) {
						NSDictionary *attributes = [[NSDictionary alloc] initWithObjectsAndKeys:[NSFont fontWithName:[[field font] fontName] size:a], NSFontAttributeName, nil];
						NSSize sizes = [field.stringValue sizeWithAttributes:attributes];
						if (sizes.width < field.frame.size.width && sizes.height < field.frame.size.height)
							break;
						fontSize--;
					}
					[field setFont:[NSFont systemFontOfSize: fontSize]];
				}
			}
		}];
	}
}

@end

