//
//  PlayerBuilder.h
//  GoTApp
//
//  Created by Morten on 28/06/14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerBuilder : NSObject

+ (NSArray *)playersFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
