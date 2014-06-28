//
//  PlayerBuilder.m
//  GoTApp
//
//  Created by Morten on 28/06/14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import "PlayerBuilder.h"
#import "PlayerDto.h"

@implementation PlayerBuilder
+ (NSArray *)playersFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options: NSJSONReadingMutableContainers error: &localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *players = [[NSMutableArray alloc] init];
    
    //NSArray *results = [parsedObject objectForKey:@"RegionDto"];
    NSLog(@"Count %d", parsedObject.count);
    
    for (NSDictionary *playerDic in parsedObject) {
        PlayerDto *player = [[PlayerDto alloc] init];
        
        for (NSString *key in playerDic) {
            if ([player respondsToSelector:NSSelectorFromString(key)]) {
                [player setValue:[playerDic valueForKey:key] forKey:key];
            }
        }
        
        [players addObject:player];
    }
    
    return players;
}
@end