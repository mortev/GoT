//
//  SecondViewController.m
//  GoTApp
//
//  Created by Christine Mysen on 28.06.14.
//  Copyright (c) 2014 MortenRoarTony. All rights reserved.
//

#import "SecondViewController.h"

#import "PlayerDetailCell.h"

#import "PlayerDto.h"
#import "ServerManager.h"
#import "ServerCommunicator.h"

@interface SecondViewController () <ServerManagerDelegate> {
    NSArray *_players;
    ServerManager *_manager;
}
@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _manager = [[ServerManager alloc] init];
    _manager.communicator = [[ServerCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startFetchingPlayers:)
                                                 name:@"kCLAuthorizationStatusAuthorized"
                                               object:nil];
}


#pragma mark - Notification Observer
- (void)startFetchingPlayers:(NSNotification *)notification
{
    [_manager fetchPlayers];
}

#pragma mark - ServerManagerDelegate
- (void)didReceivePlayers:(NSArray *)players
{
    _players = players;
    [self.tableView reloadData];
}

- (void)fetchingPlayersFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PlayerDto *player = _players[indexPath.row];
    
    NSString* fullName = [NSString stringWithFormat:@"%@%@", player.FirstName, player.LastName];
    
    [cell.nameLabel setText:fullName];
    //[cell.whoLabel setText:region.Description];
    //[cell.locationLabel setText:[NSString stringWithFormat:@"%@, %@", group.city, group.country]];
    //[cell.descriptionLabel setText:region.Description];
    
    return cell;
}

@end
