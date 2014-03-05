//
//  MCManager.m
//  Multipeer
//
//  Created by Spencer Fornaciari on 3/4/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "MCManager.h"

@implementation MCManager

-(id)init
{
    if (self = [super init]) {
        self.localPeerID = nil;
        self.session = nil;
        self.assistant = nil;
        self.browser = nil;
    }
    
    return self;
}

@end
