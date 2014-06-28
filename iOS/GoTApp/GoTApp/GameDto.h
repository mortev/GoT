//
//  GameDto.h
//  GoTApp
//
//  Created by Christine Mysen on 28.06.14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameDto : NSObject

@property NSInteger *GameId;
@property NSDate *Date;
@property NSDate *CreatedDate;
@property NSString *Status;
@property NSInteger *CreatedByPlayerId;

@end
