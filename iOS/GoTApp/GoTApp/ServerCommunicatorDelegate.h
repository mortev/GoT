//
//  ServerCommunicatorDelegate.h
//  GoTApp
//
//  Created by Morten on 28/06/14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServerCommunicatorDelegate
- (void)receivedPlayersJSON:(NSData *)objectNotation;
- (void)fetchingPlayersFailedWithError:(NSError *)error;
@end
