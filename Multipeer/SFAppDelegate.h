//
//  SFAppDelegate.h
//  Multipeer
//
//  Created by Spencer Fornaciari on 3/4/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "MCManager.h"

@interface SFAppDelegate : UIResponder <UIApplicationDelegate, MCSessionDelegate, MCAdvertiserAssistantDelegate, MCBrowserViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) MCPeerID *localPeerID;
@property (nonatomic) MCSession *session;
@property (nonatomic) MCAdvertiserAssistant *assistant;
@property (nonatomic) MCBrowserViewController *browser;

@end
