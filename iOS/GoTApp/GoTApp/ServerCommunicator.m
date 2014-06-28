//
//  ServerCommunicator.m
//  GoTApp
//
//  Created by Morten on 28/06/14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import "ServerCommunicator.h"
#import "ServerCommunicatorDelegate.h"

@implementation ServerCommunicator

- (void)getPlayers
{
    //NSString *urlAsString = [NSString stringWithFormat:@"http://192.168.10.245/GoT/GoTService/GetRegions"];
    //NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    //NSLog(@"%@", urlAsString);
    
    //just give your URL instead of my URL
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL  URLWithString:@"http://192.168.11.1/GoT/GoTService/GetPlayers"]];
    
    [request setHTTPMethod:@"GET"];
    
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"content-type"];
    
    NSError *error;
    
    NSURLResponse *response;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request   returningResponse:&response error:&error];
    
    
    if (error) {
        [self.delegate fetchingPlayersFailedWithError:error];
    } else {
        [self.delegate receivedPlayersJSON:responseData];
    }
    
    //You need to check response.Once you get the response copy that and paste in ONLINE JSON VIEWER.If you do this clearly you can get the correct results.
    
    //After that it depends upon the json format whether it is DICTIONARY or ARRAY
    
    //NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:responseData options: NSJSONReadingMutableContainers error: &error];
    
    //NSArray *array=[[jsonArray objectForKey:@"search_api"]objectForKey:@"result"];
    
    //[NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
    
    //if (error) {
    //[self.delegate fetchingRegionsFailedWithError:error];
    //} else {
    //[self.delegate receivedRegionsJSON:responseData];
    //}
    //}];
}

@end


