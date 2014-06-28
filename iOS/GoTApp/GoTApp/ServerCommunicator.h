//
//  ServerCommunicator.h
//  GoTApp
//
//  Created by Morten on 28/06/14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServerCommunicatorDelegate;

@interface ServerCommunicator : NSObject
@property (weak, nonatomic) id<ServerCommunicatorDelegate> delegate;

- (void)getPlayers;

@end