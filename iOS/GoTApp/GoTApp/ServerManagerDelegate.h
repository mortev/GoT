//
//  ServerManagerDelegate.h
//  GoTApp
//
//  Created by Morten on 28/06/14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServerManagerDelegate
- (void)didReceivePlayers:(NSArray *)players;
- (void)fetchingPlayersFailedWithError:(NSError *)error;
@end