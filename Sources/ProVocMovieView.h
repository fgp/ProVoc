//
//  ProVocMovieView.h
//  ProVoc
//
//  Created by Simon Bovet on 16.04.06.
//  Copyright 2006 Arizona Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AVFoundation/AVFoundation.h>
#ifndef DISABLE_QTKIT
#import <QTKit/QTKit.h>
#endif

#ifndef DISABLE_QTKIT
@interface ProVocMovieView : QTMovieView
#else
@interface ProVocMovieView : NSView
#endif

-(IBAction)fullScreen:(id)inSender;

@end

#ifndef DISABLE_QTKIT
@interface QTMovie (ProVocMovieView)
#else
@interface AVAsset (ProVocMovieView)
#endif

-(NSSize)imageSize;
-(void)displayInFullSize;

@end
