//
//  ProVocMovieView.h
//  ProVoc
//
//  Created by Simon Bovet on 16.04.06.
//  Copyright 2006 Arizona Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Disabled because QTKit no longer exists
// #import <QTKit/QTKit.h>

// Changed base class from QTMovieView to NSView
// TODO: Find a replacement for QTMovieView
@interface ProVocMovieView : NSView

-(IBAction)fullScreen:(id)inSender;

@end

/*
@interface QTMovie (ProVocMovieView)

-(NSSize)imageSize;
-(void)displayInFullSize;

@end
*/

