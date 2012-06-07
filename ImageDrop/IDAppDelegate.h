//
//  IDAppDelegate.h
//  ImageDrop
//
//  Created by Tatsuya Tobioka on 12/06/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface IDAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextFieldCell *widthLabel;
@property (assign) IBOutlet NSTextFieldCell *heightLabel;
@property (assign) IBOutlet NSTextFieldCell *codeField;

@property (assign) IBOutlet NSImageCell *imageCell;

- (IBAction)imageAction:(id)sender;

@end
