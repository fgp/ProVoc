ProVoc 5
===========

The dev branch contains an updated version of the original version 4.2.4 code base, which has been abandoned about 13 years ago by its original developer and maintainer Arizona Software. That means that the dev branch doesn't contain the changes committed to the master branch by Mike Holman (http://github.com/mikecsh/), at least not yet. It'll stay there until deemed stable enough to be merged to the master branch.

More informations about the status of this branch is to be found in the Project's Wiki.

-- hagbarðr

ProVoc 4
===========

A vocabulary trainer for Mac OS X, originally written by Arizona Software (www.arizona-software.ch).

*Please be aware that the codebase of this project is very old and the app may not be working at all.*

## Screenshots:
![alt tag](https://raw.github.com/mikecsh/provoc/master/Screenshots/1.png)
![alt tag](https://raw.github.com/mikecsh/provoc/master/Screenshots/2.png)
![alt tag](https://raw.github.com/mikecsh/provoc/master/Screenshots/3.png)

## Current abilities:
* As displayed on http://www.arizona-software.ch
	
## Roadmap:
* Updating the interface
* Modernizing the code
* ARC Compatibility
* QTKit or AVFoundation to replace Quickdraw
* CoreData to replace custom file format (with converter??) to allow better performance and less code
* First App Store deployment to renew user base
* Re-introduce sharing of decks
* More stats
* iOS port?
* iCloud syncing?


## Contributors:

* Arizona Software (Original authors - http://www.arizona-software.ch)
* Mike Holman (http://github.com/mikecsh/)

Contributions via pull requests or issues are very welcome.

Original Readme that Accompanied Source Code When Released By Arizona Software
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
