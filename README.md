ProVoc
============

ProVoc is a vocabulary trainer for mac OS originally developed by Arizona
software that offered many features which even now, years after the software
was abandoned, are unmatched by its competitors. While the latest binary release
of ProVoc does not run on modern versions of mac OS, Arizona software has
been kind enough to make the source code of the last released version
available under a BSD license.

The goal of this fork of the original source code is to provide a version of
ProVoc that runs on modern versions of macOS, and to fix any bugs we
encounter in the process.  The goal is explicitly *not* to add features or
modernize the UI -- the software was pretty complete and had a very
well-designed UI by the time it was abandoned.

## Releases

[ProVoc Reboot v0.91 (based on 4.2.3)](https://github.com/fgp/ProVoc/releases/tag/v0.91-4.2.3reboot)

## Status

The current codebase compiles and runs on mac OS 12.4 Monterey for Intel
CPUs. The code hasn't been tested on Apple Silicon, but likely compiles and
runs their as well. Features related to video playback have been disabled,
because these were implemented through QTKit which has been removed from
recent versions of mac OS by Apple. 

## Contributors:

* Arizona Software (Original authors - http://www.arizona-software.ch)
* Mike Holman (http://github.com/mikecsh/)
* Hagbarðr Lindenstruth  (http://github.com/lindenstruth/)
* Florian G. Pflug (myself) (http://github.com/fgp)

## Screenshots:

![alt tag](https://raw.github.com/fgp/provoc/master/Screenshots/1.png)
![alt tag](https://raw.github.com/fgp/provoc/master/Screenshots/2.png)
![alt tag](https://raw.github.com/fgp/provoc/master/Screenshots/3.png)

Original Readme By Arizona Software
===========

Thank you for downloading the source code of ProVoc! Please take a moment
to read the following lines:

- This source code is available under the BSD license (see below)
- This code base is really, really old... Please keep in mind that this
    software has grown from a simple vocabulary training app that we've
    written (probably like many of you out there) "just for our own needs".
- Be thus accordingly indulgent! We known that the overall structure,
    the design patterns used, well... almost everything could have been
    much clearer and much better -- if only we had the same knowledge
    at that time as today.
- If you want to rewrite this app, think seriously about adopting some
    up-to-date technology (CoreData is beyond any question, so as
    QTCapture and all sorts of other things)
- This code should primarly serve as a reference for those of you
    who want to write some "importers" for ProVoc vocabulary files.
- Please understand that we don't have time anymore to provide support
    of any kind, or answer questions about the code.

Having said that, enjoy developing for Mac OS X -- we can assure you that
it's really a fun and inspiring experience!

-- Arizona Software
