//
//  SoundRecorderController.h
//  ProVoc
//
//  Created by Mike Holman on 25/07/2013.
//
//

#import <Foundation/Foundation.h>

@interface SoundRecorderController : NSObject

+ (SoundRecorderController *)sharedGrabber;
+ (SoundRecorderController *)sharedController;
- (NSString *)captureMovie;
- (NSImage *)captureImage;

@end
