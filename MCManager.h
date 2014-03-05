//
//  MCManager.h
//  Multipeer
//
//  Created by Spencer Fornaciari on 3/4/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface MCManager : NSObject <MCSessionDelegate>

@property (nonatomic) MCPeerID *localPeerID;
@property (nonatomic) MCSession *session;
@property (nonatomic) MCAdvertiserAssistant *assistant;
@property (nonatomic) MCBrowserViewController *browser;

@end
