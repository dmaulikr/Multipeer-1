//
//  SFAdvertisingViewController.m
//  Multipeer
//
//  Created by Spencer Fornaciari on 3/4/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFAdvertisingViewController.h"

@interface SFAdvertisingViewController ()

@property (nonatomic) MCPeerID *localPeerID;
@property (nonatomic) MCSession *session;
@property (nonatomic) MCAdvertiserAssistant *assistant;
@property (strong, nonatomic) IBOutlet UILabel *advertiserLabel;

@end

@implementation SFAdvertisingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.localPeerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];
    self.advertiserLabel.text = [[UIDevice currentDevice] name];
    self.session = [[MCSession alloc] initWithPeer:self.localPeerID
                                  securityIdentity:nil
                              encryptionPreference:MCEncryptionNone];
    self.session.delegate = self;
    
    self.assistant = [[MCAdvertiserAssistant alloc] initWithServiceType:CFServiceType
                                                          discoveryInfo:nil
                                                                session:self.session];
    
    [self.assistant start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
