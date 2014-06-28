//
//  ServerManager.m
//  GoTApp
//
//  Created by Morten on 28/06/14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import "ServerManager.h"
#import "PlayerBuilder.h"
#import "ServerCommunicator.h"

@implementation ServerManager
- (void)fetchPlayers
{
    [self.communicator getPlayers];
}

#pragma mark - ServerCommunicatorDelegate

- (void)receivedPlayersJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *players = [PlayerBuilder playersFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingPlayersFailedWithError:error];
        
    } else {
        [self.delegate didReceivePlayers:players];
    }
}

- (void)fetchingPlayersFailedWithError:(NSError *)error
{
    [self.delegate fetchingPlayersFailedWithError:error];
}
@end
