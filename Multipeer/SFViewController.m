//
//  SFViewController.m
//  Multipeer
//
//  Created by Spencer Fornaciari on 3/4/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()

@property (nonatomic) MCSession *session;
@property (nonatomic) MCPeerID *localPeerID;
@property (nonatomic) MCBrowserViewController *browserVC;
@property (nonatomic) NSOutputStream *outputStream;

@property (strong, nonatomic) IBOutlet UILabel *senderLabel;


- (IBAction)sendMessage:(id)sender;

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.localPeerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];
    
    self.session = [[MCSession alloc] initWithPeer:self.localPeerID
                                        securityIdentity:nil
                                    encryptionPreference:MCEncryptionNone];
    self.session.delegate = self;
    
    
    self.browserVC = [[MCBrowserViewController alloc] initWithServiceType:CFServiceType
                                                                  session:self.session];
    
    
    self.browserVC.delegate = self;
    
    
    self.senderLabel.text = [[UIDevice currentDevice] name];
    
    [self presentViewController:self.browserVC
                       animated:YES
                     completion:nil];
    
    
    
//    [self.session sendData:<#(NSData *)#> toPeers:<#(NSArray *)#> withMode:<#(MCSessionSendDataMode)#> error:<#(NSError *__autoreleasing *)#>]
    
//    NSOutputStream *outputStream = [self.session startStreamWithName:<#(NSString *)#> toPeer:<#(MCPeerID *)#> error:<#(NSError *__autoreleasing *)#>]
    
    
    //Set Delegate
    //stream.delegate = self;
    
    //Schedule in run loop
    //[stream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    //Open stream
    //[stream open]
    
    //Implement NSStream Delegate callbacks
    
    
    //Disconnection
//    [self.session disconnect];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MCSession Delegate Methods

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
{
    NSError *error;
    NSOutputStream *outputStream = [self.session startStreamWithName:CFServiceType toPeer:peerID error:&error];
    outputStream.delegate = self;
    
    switch (state) {
        case MCSessionStateConnected:
            [outputStream open];
            break;
        case MCSessionStateNotConnected:
            break;
            
        case MCSessionStateConnecting:
            break;
    }
}

-(void)session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
{
    
}

//Receiving a stream request
-(void)session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
{
    stream.delegate = self;
    [stream scheduleInRunLoop:[NSRunLoop mainRunLoop]
                      forMode:NSDefaultRunLoopMode];
    [stream open];
    
    NSString *message = 
}


//For receiving messages
-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
{
    NSString *message =
    [[NSString alloc] initWithData:data
                          encoding:NSUTF8StringEncoding];
    NSLog(@"%@", message);
}

-(void)session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
    
}


#pragma mark - MCBrowser Delegate Methods

-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    [self.browserVC dismissViewControllerAnimated:YES completion:nil];
}

-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    [self.browserVC dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - MCNearbyServiceAdvertiser Delegate Methods

-(void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void (^)(BOOL, MCSession *))invitationHandler
{
    
}

#pragma mark - MCNearbyServiceBrowser Delegate Methods

-(void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info
{
    
}

-(void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID
{
    
}




- (IBAction)sendMessage:(id)sender {
    NSString *message = @"Hello, World!";
    NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    
    [self.session sendData:data toPeers:[self.session connectedPeers] withMode:MCSessionSendDataReliable error:&error];
    
}
@end
