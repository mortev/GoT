//
//  ServerManager.h
//  GoTApp
//
//  Created by Morten on 28/06/14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ServerManagerDelegate.h"
#import "ServerCommunicatorDelegate.h"

@class ServerCommunicator;

@interface ServerManager : NSObject<ServerCommunicatorDelegate>
@property (strong, nonatomic) ServerCommunicator *communicator;
@property (weak, nonatomic) id<ServerManagerDelegate> delegate;

- (void)fetchPlayers;
@end