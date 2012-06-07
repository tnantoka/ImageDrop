//
//  IDAppDelegate.m
//  ImageDrop
//
//  Created by Tatsuya Tobioka on 12/06/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "IDAppDelegate.h"

@implementation IDAppDelegate
@synthesize widthLabel = _widthLabel;
@synthesize heightLabel = _heightLabel;
@synthesize codeField = _codeField;
@synthesize imageCell = _imageCell;

@synthesize window = _window;

- (void)dealloc
{
    [super dealloc];
    
    [_widthLabel release];
    [_heightLabel release];
    [_codeField release];
    [_imageCell release];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    _widthLabel.title = @"? px";
    _heightLabel.title = @"? px";
    _codeField.title = @"CGRectMake(0, 0, ?, ?);";
}

- (BOOL)application:(NSApplication *)sender openFile:(NSString *)filename {
    
    _imageCell.image = [[NSImage alloc] initWithContentsOfFile:filename];
    [self imageAction:_imageCell];
    
    [_window makeKeyAndOrderFront:nil];

    return NO;
}

- (IBAction)imageAction:(id)sender {
    
    NSImageCell *imageCell = (NSImageCell *)sender;
    NSImage *image = imageCell.image;
     
    NSBitmapImageRep* imageRep = [NSBitmapImageRep imageRepWithData:[image TIFFRepresentation]];
    NSSize size = NSMakeSize([imageRep pixelsWide], [imageRep pixelsHigh]);
    
    _widthLabel.title = [NSString stringWithFormat:@"%.0f px", size.width];
    _heightLabel.title = [NSString stringWithFormat:@"%.0f px", size.height];
    _codeField.title = [NSString stringWithFormat:@"CGRectMake(0, 0, %.0f, %.0f);", image.size.width, image.size.height];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag {
    [_window makeKeyAndOrderFront:nil];
    return NO;
}

@end
