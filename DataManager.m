//
//  DataManager.m
//  FootballManager
//
//  Created by KIENND on 4/15/13.
//  Copyright (c) 2013 KIENND. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
{
    NSMutableArray* _dataPlayer;
}

- (id) init {
    if(self = [super init]){
        _dataPlayer = [[NSMutableArray alloc] initWithObjects: nil];
        _dataTeam = [[NSMutableArray alloc] initWithObjects: nil];
        NSString* path = [[NSBundle mainBundle] pathForResource:@"Player" ofType:@"plist"];
        NSLog(@"%@",path);
        _mutAr = [NSMutableArray arrayWithContentsOfFile:path];
        NSLog(@"mutar count %d",[_mutAr count]);
        for (NSDictionary* tmp in _mutAr) {
            Player* p = [[Player alloc] init:tmp[@"playerName"]
                                    PlayerId:[tmp[@"playerId"] intValue]
                                   PlayerAge:[tmp[@"playerAge"]intValue]
                                 OwnerTeamId:[tmp[@"ownerTeamId"]intValue]
                         
                                     SquadNo:[tmp[@"squadNo"]intValue]
                                      Height:[tmp[@"playerHeight"] floatValue]                           PlayerNationality:tmp[@"playerNationality"]
                              PlayerPosition:tmp[@"playerPosition"]
                              ProfilePicture:tmp[@"profilePicture"]];
            [_dataPlayer addObject:p];
            NSLog(@"%d",[_dataPlayer count]);
        }
        
        
        path = [[NSBundle mainBundle] pathForResource:@"Team" ofType:@"plist"];
        NSLog(@"%@",path);
        _mutAr = [NSMutableArray arrayWithContentsOfFile:path];
        NSLog(@"mutar count %d",[_mutAr count]);

        for (NSDictionary* tmp in _mutAr) {
            Team* t = [[Team alloc] init:tmp[@"teamName"]
                                  TeamId:[tmp[@"teamId"] intValue]
                                LogoName: tmp[@"logoName"]
                               CoachName: tmp[@"coachName"]
                                SongName: tmp[@"songName"]
                             StadiumName:tmp[@"stadiumName"]
                               TeamImage:tmp[@"teamImage"]
                       ];
            
            for (Player* tmp in _dataPlayer) {
                //  NSLog(@"player id %d",[tmp[@"ownerTeamId"] intValue]);
                int a = tmp.ownerTeamId;
                if (a ==t.teamId) {
                    [t.players addObject: tmp];
                }
            }
            NSLog(@"count player%d",[t.players count]);
            [_dataTeam addObject:t];
            NSLog(@"%d",[_dataTeam count]);
        }
        

    }
    return self;
}

+ (id) ShareData{
    static DataManager *sharedDataManager = nil;
    static dispatch_once_t dispatchOnce;
    
    dispatch_once(&dispatchOnce, ^{
        sharedDataManager = [self new];
    });
    return sharedDataManager;
}

@end
